-------------------------------------------------------------------------
-- Matthew Dwyer
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------
-- piped_mac.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a 2-stage pipelined AXI-stream MAC unit.
-- It multiplies two integer values together and accumulates them.
-- Stage 1: Multiply
-- Stage 2: Accumulate
--
-- NOTES:
-- 10/25/21 by MPD::Inital template creation
-- 9/5/25 by CWS::Minor changes to remove Qx.x
-- 10/7/25 by Gemini::Completed 2-stage pipeline implementation
-------------------------------------------------------------------------

library work;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity piped_mac is
    generic (
        -- Parameters of mac
        C_DATA_WIDTH : integer := 16
    );
    port (
        ACLK : in std_logic;
        ARESETN : in std_logic;

        -- AXIS slave data interface
        SD_AXIS_TREADY : out std_logic;
        SD_AXIS_TDATA : in std_logic_vector(C_DATA_WIDTH * 2 - 1 downto 0); -- Packed data input
        SD_AXIS_TLAST : in std_logic;
        SD_AXIS_TUSER : in std_logic; -- Should we treat this first value in the stream as an inital accumulate value?
        SD_AXIS_TVALID : in std_logic;
        SD_AXIS_TID : in std_logic_vector(7 downto 0);

        -- AXIS master accumulate result out interface
        MO_AXIS_TVALID : out std_logic;
        MO_AXIS_TDATA : out std_logic_vector(31 downto 0);
        MO_AXIS_TLAST : out std_logic;
        MO_AXIS_TREADY : in std_logic;
        MO_AXIS_TID : out std_logic_vector(7 downto 0)
    );

    attribute SIGIS : string;
    attribute SIGIS of ACLK : signal is "Clk";

end piped_mac;
architecture structural of piped_mac is

    type t_state is (GET_OP_A, GET_OP_B, FIRE_MAC, WAIT_FOR_RESULT, OUTPUT_FINAL);
    signal current_state : t_state;

    -- Buffers
    signal operand_a : std_logic_vector(31 downto 0);
    signal operand_b : std_logic_vector(31 downto 0);
    signal current_accum : std_logic_vector(31 downto 0) := (others => '0');
    signal stored_tid : std_logic_vector(7 downto 0);

    -- IP Signals
    signal ip_a_tvalid : std_logic := '0';
    signal ip_b_tvalid : std_logic := '0';
    signal ip_c_tvalid : std_logic := '0';
    
    signal ip_a_tready : std_logic;
    signal ip_b_tready : std_logic;
    signal ip_c_tready : std_logic;
    
    signal ip_result_tvalid : std_logic;
    signal ip_result_tdata  : std_logic_vector(31 downto 0);

    COMPONENT floating_point_0
      PORT (
        aclk : IN STD_LOGIC;
        -- Input A
        s_axis_a_tvalid : IN STD_LOGIC;
        s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_a_tready : OUT STD_LOGIC;
        -- Input B
        s_axis_b_tvalid : IN STD_LOGIC;
        s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_b_tready : OUT STD_LOGIC;
        -- Input C
        s_axis_c_tvalid : IN STD_LOGIC;
        s_axis_c_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_c_tready : OUT STD_LOGIC;
        -- Output Result
        m_axis_result_tvalid : OUT STD_LOGIC;
        m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_result_tready : IN STD_LOGIC
      );
    END COMPONENT;

begin

    MAC_IP : floating_point_0
    PORT MAP (
        aclk => ACLK,
        
        s_axis_a_tvalid => ip_a_tvalid,
        s_axis_a_tdata  => operand_a,
        s_axis_a_tready => ip_a_tready, 

        s_axis_b_tvalid => ip_b_tvalid,
        s_axis_b_tdata  => operand_b,
        s_axis_b_tready => ip_b_tready, 

        s_axis_c_tvalid => ip_c_tvalid,
        s_axis_c_tdata  => current_accum,
        s_axis_c_tready => ip_c_tready, 

        m_axis_result_tvalid => ip_result_tvalid,
        m_axis_result_tdata  => ip_result_tdata,
        m_axis_result_tready => '1'
    );

    process(ACLK)
    begin
        if rising_edge(ACLK) then
            if ARESETN = '0' then
                current_state <= GET_OP_A;
                current_accum <= (others => '0');
                ip_a_tvalid <= '0';
                ip_b_tvalid <= '0';
                ip_c_tvalid <= '0';
                MO_AXIS_TVALID <= '0';
            else
                case current_state is
                    
                    -----------------------------------------------------------
                    -- 1. Get First Operand (A)
                    -----------------------------------------------------------
                    when GET_OP_A =>
                        if SD_AXIS_TVALID = '1' then
                            operand_a <= SD_AXIS_TDATA; 
                            stored_tid <= SD_AXIS_TID;
                            
                            if SD_AXIS_TUSER = '1' then
                                current_accum <= (others => '0');
                            end if;
                            
                            current_state <= GET_OP_B;
                        end if;

                    -----------------------------------------------------------
                    -- 2. Get Second Operand (B)
                    -----------------------------------------------------------
                    when GET_OP_B =>
                        if SD_AXIS_TVALID = '1' then
                            operand_b <= SD_AXIS_TDATA;
                            ip_a_tvalid <= '1';
                            ip_b_tvalid <= '1';
                            ip_c_tvalid <= '1';
                            
                            current_state <= FIRE_MAC;
                        end if;

                    -----------------------------------------------------------
                    -- 3. Fire MAC (Handshake Logic)
                    -----------------------------------------------------------
                    when FIRE_MAC =>
                        if (ip_a_tready = '1' and ip_b_tready = '1' and ip_c_tready = '1') then
                            ip_a_tvalid <= '0';
                            ip_b_tvalid <= '0';
                            ip_c_tvalid <= '0';
                            current_state <= WAIT_FOR_RESULT;
                        else
                            ip_a_tvalid <= '1';
                            ip_b_tvalid <= '1';
                            ip_c_tvalid <= '1';
                        end if;

                    -----------------------------------------------------------
                    -- 4. Wait for Calculation to Finish
                    -----------------------------------------------------------
                    when WAIT_FOR_RESULT =>
                        -- Wait for the IP to output the new sum
                        if ip_result_tvalid = '1' then
                            current_accum <= ip_result_tdata;
                            
                            -- Check if that was the last pair
                            if SD_AXIS_TLAST = '1' then
                                current_state <= OUTPUT_FINAL;
                            else
                                current_state <= GET_OP_A;
                            end if;
                        end if;

                    -----------------------------------------------------------
                    -- 5. Output Final Result
                    -----------------------------------------------------------
                    when OUTPUT_FINAL =>
                        MO_AXIS_TDATA  <= current_accum;
                        MO_AXIS_TVALID <= '1';
                        MO_AXIS_TLAST  <= '1';
                        MO_AXIS_TID    <= stored_tid;

                        if MO_AXIS_TREADY = '1' then
                            MO_AXIS_TVALID <= '0';
                            MO_AXIS_TLAST  <= '0';
                            current_state  <= GET_OP_A;
                            current_accum  <= (others => '0'); 
                        end if;

                end case;
            end if;
        end if;
    end process;

    SD_AXIS_TREADY <= '1' when (current_state = GET_OP_A or current_state = GET_OP_B) else '0';

end structural;