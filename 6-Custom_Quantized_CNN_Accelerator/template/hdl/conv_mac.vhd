-------------------------------------------------------------------------
-- Matthew Dwyer
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------
-- staged_mac.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a basic staged axi-stream mac unit. It
-- multiplies two integer values together and accumulates them.
--
-- NOTES:
-- 10/25/21 by MPD::Inital template creation
-- 9/5/25 by CWS::Minor changes to remove Qx.x
-------------------------------------------------------------------------

-- TODO fix back to back singles.
-- TODO fix multiple cycles

library work;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity conv_mac is
    generic (
        -- Parameters of mac
        C_DATA_WIDTH : integer := 8;
        C_OUTPUT_DATA_WIDTH : integer := 32
    );
    port (
        S_AXIS_TREADY : out std_logic;
        S_AXIS_TDATA  : in  std_logic_vector(C_DATA_WIDTH*2-1 downto 0);
        S_AXIS_TLAST  : in  std_logic;
        S_AXIS_TVALID : in  std_logic;

        bias : in std_logic_vector(C_OUTPUT_DATA_WIDTH-1 downto 0);

        M_AXIS_TREADY : in  std_logic;
        M_AXIS_TDATA  : out std_logic_vector(C_OUTPUT_DATA_WIDTH-1 downto 0);
        M_AXIS_TLAST  : out std_logic;
        M_AXIS_TVALID : out std_logic;
        
        accummulate_test : out std_logic_vector(31 downto 0);

        rst : in std_logic;
        clk : in std_logic
    );

    attribute SIGIS : string;
    attribute SIGIS of clk : signal is "Clk";

end conv_mac;
architecture behavioral of conv_mac is
    -- Internal Signals
    -- Mac state
    type STATE_TYPE is (WAIT_FOR_VALUES, MAC_STAGE, SEND_RESULT);
    signal currentState : STATE_TYPE := WAIT_FOR_VALUES;
    signal nextState : STATE_TYPE := WAIT_FOR_VALUES;
    -- States:
    -- WAIT_FOR_VALUES: Waiting for valid values to come in
    -- MAC_STAGE: Multiply and accumulate values
    -- SEND_RESULT: Send the result out

    -- Debug signals, make sure we aren't going crazy
    signal mac_debug : std_logic_vector(31 downto 0);
    signal multiplied_value : std_logic_vector(C_DATA_WIDTH * 2 - 1 downto 0) := (others => '0');
    signal multiplied_value_bias : std_logic_vector(31 downto 0) := (others => '0');
    signal accumulated_value : std_logic_vector(31 downto 0) := (others => '0');
    signal added_value :  std_logic_vector(31 downto 0) := (others => '0');
    signal added_value_bias :  std_logic_vector(31 downto 0) := (others => '0');
    signal outputOccurred : std_logic := '0';

begin

    -- Interface signals
    -- NOTE: UTILIZE THE DSP ON THE ZEDBOARDS

    -- Internal signals
    -- Debug Signals
    mac_debug <= x"00000000"; -- Double checking sanity
    multiplied_value <= std_logic_vector(resize(signed(S_AXIS_TDATA(C_DATA_WIDTH - 1 downto 0)) * signed(S_AXIS_TDATA(C_DATA_WIDTH * 2 - 1 downto C_DATA_WIDTH)), C_DATA_WIDTH * 2));
    multiplied_value_bias <=   std_logic_vector(signed(bias) + resize(signed(S_AXIS_TDATA(C_DATA_WIDTH - 1 downto 0)) * signed(S_AXIS_TDATA(C_DATA_WIDTH * 2 - 1 downto C_DATA_WIDTH)), C_DATA_WIDTH * 2));
    added_value <=   std_logic_vector(resize(signed(accumulated_value) + resize(signed(multiplied_value), 32), 32));
    added_value_bias <=   std_logic_vector(resize(signed(accumulated_value) + resize(signed(multiplied_value), 32) + signed(bias), 32));
    
    accummulate_test <= accumulated_value;
    
    process(S_AXIS_TVALID, S_AXIS_TLAST, M_AXIS_TREADY, outputOccurred) is   
    begin
       case currentState is -- State
            -- Wait here until we receive values
            when WAIT_FOR_VALUES =>
                if (S_AXIS_TVALID = '1') then
                    if (S_AXIS_TLAST = '1') then
                        nextState <= SEND_RESULT;
                    else
                        nextState <= MAC_STAGE;
                    end if;
                else 
                    if (S_AXIS_TLAST = '1') then
                        if (outputOccurred = '0') then
                            nextState <= SEND_RESULT;
                        else
                            nextState <= WAIT_FOR_VALUES;
                        end if;
                    else 
                        nextState <= WAIT_FOR_VALUES;
                    end if; 
                end if;
            
            when MAC_STAGE =>
               if (S_AXIS_TVALID = '1') then
                    if (S_AXIS_TLAST = '1') then
                        nextState <= SEND_RESULT;
                    else 
                        nextState <= MAC_STAGE;
                    end if;
                    
                else 
                    nextState <= WAIT_FOR_VALUES;
                end if;
                
            when SEND_RESULT =>
               if (M_AXIS_TREADY = '1') then        
                    if (S_AXIS_TVALID = '1') then
                        if (S_AXIS_TLAST = '1') then
                            nextState <= SEND_RESULT;
                        else
                            nextState <= MAC_STAGE;
                        end if;

                    else
                        nextState <= WAIT_FOR_VALUES;
                    end if;
                else 
                    nextState <= SEND_RESULT;
                end if;
            when others =>
                nextState <= WAIT_FOR_VALUES;
                -- Not really important, this case should never happen
                -- Needed for proper synthisis         
        end case; -- State
    
    
    end process;
    
    process (clk, rst) is
    begin
        -- Reset values if reset is low
        if rst = '1' then -- Reset
            currentState <= WAIT_FOR_VALUES;
            S_AXIS_TREADY <= '1'; -- We are ready to accept values
            accumulated_value <= (others => '0');
        else
            if rising_edge(clk) then -- Rising Edge
                case currentState is -- State
                    -- Wait here until we receive values
                    when WAIT_FOR_VALUES =>
                        case nextState is
                            when WAIT_FOR_VALUES =>
                                --SD_AXIS_TREADY <= '1';
                            when MAC_STAGE =>
                                --SD_AXIS_TREADY <= '1';
                                outputOccurred <= '0';
                                accumulated_value <= added_value;
                            when SEND_RESULT =>
                                --SD_AXIS_TREADY <= '0';
                                if (S_AXIS_TVALID = '1') then
                                    accumulated_value <= added_value_bias;
                                end if;
                            when others =>
                        end case; -- State
                        
                        M_AXIS_TVALID <= '0';
                        M_AXIS_TLAST <= '0';
                        S_AXIS_TREADY <= '1';
                        currentState <= nextState;

                    when MAC_STAGE =>
                       case nextState is
                            when WAIT_FOR_VALUES =>
                                --SD_AXIS_TREADY <= '1';
                            when MAC_STAGE =>
                                --SD_AXIS_TREADY <= '1';
                                    accumulated_value <= added_value;
                            when SEND_RESULT =>
                                --SD_AXIS_TREADY <= '0';
                                    accumulated_value <= added_value_bias;
                            when others =>
                        end case; -- State
                        
                        M_AXIS_TVALID <= '0';
                        M_AXIS_TLAST <= '0';
                        S_AXIS_TREADY <= '1';
                        currentState <= nextState;

                    when SEND_RESULT =>
                        case nextState is
                            when WAIT_FOR_VALUES =>
                                 M_AXIS_TVALID <= '1';
                                 M_AXIS_TLAST <= '1';
                                 M_AXIS_TDATA <= accumulated_value;
                                 S_AXIS_TREADY <= '1';
                                 accumulated_value <= (others => '0');
                                 outputOccurred <= '1';
                                 
                           when MAC_STAGE =>
                                 M_AXIS_TVALID <= '1';
                                 M_AXIS_TLAST <= '1';
                                 M_AXIS_TDATA <= accumulated_value;
                                 S_AXIS_TREADY <= '1';
                                 
                                 accumulated_value <= std_logic_vector(resize(signed(multiplied_value), 32));
                                 
                           when SEND_RESULT =>
                                if (M_AXIS_TREADY = '1') then
                                    M_AXIS_TVALID <= '1';
                                    M_AXIS_TLAST <= '1';
                                    M_AXIS_TDATA <= accumulated_value;
                                    S_AXIS_TREADY <= '1';
                                    accumulated_value <= multiplied_value_bias;

                                else
                                    M_AXIS_TVALID <= '0';
                                    M_AXIS_TLAST <= '0';
                                    S_AXIS_TREADY <= '0';
                                end if; 
                            when others =>
                        end case; -- State
                        
                        currentState <= nextState;
                        -- Other stages go here	

                    when others =>
                        currentState <= nextState;
                        -- Not really important, this case should never happen
                        -- Needed for proper synthisis         
                end case; -- State
            end if; -- Rising Edge

        end if; -- Reset
    end process;
end architecture behavioral;
