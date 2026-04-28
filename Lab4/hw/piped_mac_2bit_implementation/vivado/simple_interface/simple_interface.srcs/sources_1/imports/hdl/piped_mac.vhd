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
        C_DATA_WIDTH : integer := 2
    );
    port (
        ACLK : in std_logic;
        ARESETN : in std_logic;

        -- AXIS slave data interface
        SD_AXIS_TREADY : out std_logic;
        SD_AXIS_TDATA : in std_logic_vector(7 downto 0); -- Packed data input
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
architecture behavioral of piped_mac is
    -- Pipeline Stage 1 (Multiply) -> Stage 2 (Accumulate) Registers
    signal s1_product_reg : signed(C_DATA_WIDTH * 2 - 1 downto 0);
    signal s1_is_bias_reg : std_logic;
    signal s1_tlast_reg : std_logic;
    signal s1_tid_reg : std_logic_vector(7 downto 0);
    signal s1_tvalid_reg : std_logic := '0';

    -- Stage 2 State Register
    signal s2_accumulated_value : signed(31 downto 0);
    signal s2_accum_active : std_logic := '0';

    -- Stage 2 Output Registers
    signal mo_tdata_reg : std_logic_vector(31 downto 0);
    signal mo_tlast_reg : std_logic;
    signal mo_tid_reg : std_logic_vector(7 downto 0);
    signal mo_tvalid_reg : std_logic := '0';

    -- Combinational Signals
    signal multiplied_value : signed(C_DATA_WIDTH * 2 - 1 downto 0);
    signal stall : std_logic;

begin
    -- Combinational Logic
    -- Multiplication is performed combinationally based on the input data.
    multiplied_value <= signed(SD_AXIS_TDATA(C_DATA_WIDTH - 1 downto 0)) * signed(SD_AXIS_TDATA(C_DATA_WIDTH * 2 - 1 downto C_DATA_WIDTH));

    -- The pipeline must stall if the output is valid but the downstream component is not ready.
    stall <= mo_tvalid_reg and not MO_AXIS_TREADY;

    -- We are ready to accept new data if the pipeline is not stalled.
    SD_AXIS_TREADY <= not stall;

    -- Assign registered outputs to the master interface
    MO_AXIS_TDATA <= mo_tdata_reg;
    MO_AXIS_TVALID <= mo_tvalid_reg;
    MO_AXIS_TLAST <= mo_tlast_reg;
    MO_AXIS_TID <= mo_tid_reg;
    process (ACLK) is
        variable v_acc_result : signed(31 downto 0);
    begin
        if rising_edge(ACLK) then
            if ARESETN = '0' then
                -- Reset all pipeline and state registers
                s1_product_reg <= (others => '0');
                s1_is_bias_reg <= '0';
                s1_tlast_reg <= '0';
                s1_tid_reg <= (others => '0');
                s1_tvalid_reg <= '0';
                s2_accumulated_value <= (others => '0');
                s2_accum_active <= '0';
                mo_tdata_reg <= (others => '0');
                mo_tlast_reg <= '0';
                mo_tid_reg <= (others => '0');
                mo_tvalid_reg <= '0';
            else
                if (stall = '0') then
                    -- Stage 2: Accumulate
                    -- This stage runs if the pipeline is not stalled. It consumes data from Stage 1.
                    if s1_tvalid_reg = '1' then
                        if s2_accum_active = '0' then
                            v_acc_result := resize(s1_product_reg, 32);
                        else
                            v_acc_result := s2_accumulated_value + resize(s1_product_reg, 32);
                        end if;
                        s2_accumulated_value <= v_acc_result;
                        s2_accum_active <= '1';
                        -- If this is the last piece of data in the stream, the result is ready.
                        if s1_tlast_reg = '1' then
                            mo_tdata_reg <= std_logic_vector(v_acc_result);
                            mo_tvalid_reg <= '1';
                            mo_tlast_reg <= '1';
                            mo_tid_reg <= s1_tid_reg;
                            s2_accum_active <= '0';
                        end if;
                    elsif MO_AXIS_TREADY = '1' then
                        -- De-assert valid if the data was consumed in the previous cycle
                        mo_tvalid_reg <= '0';
                        mo_tlast_reg <= '0';
                    end if;

                    -- Stage 1: Multiply
                    -- This stage runs if the pipeline is not stalled. It consumes data from the slave interface.
                    -- The valid signal propagates through the pipeline.
                    s1_tvalid_reg <= SD_AXIS_TVALID;
                    if SD_AXIS_TVALID = '1' then
                        s1_is_bias_reg <= SD_AXIS_TUSER;
                        s1_tlast_reg <= SD_AXIS_TLAST;
                        s1_tid_reg <= SD_AXIS_TID;
                        if SD_AXIS_TUSER = '1' then
                            -- load bias instead of multiplication
                            s1_product_reg <= signed(SD_AXIS_TDATA(C_DATA_WIDTH * 2 - 1 downto 0));
                        else
                            -- send multiplication result to next stage
                            s1_product_reg <= multiplied_value;
                        end if;
                    end if;
                end if;
            end if; 
        end if; 
    end process;
end architecture behavioral;