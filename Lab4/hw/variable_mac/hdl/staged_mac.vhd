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

entity staged_mac is
--    generic (
--        -- Parameters of mac
--        C_DATA_WIDTH : integer := 8
--    );
    port (
        ACLK : in std_logic;
        ARESETN : in std_logic;

        -- AXIS slave data interface
        SD_AXIS_TREADY : out std_logic;
        SD_AXIS_TDATA : in std_logic_vector(19 downto 0); -- Packed data input
        SD_AXIS_TLAST : in std_logic;
        SD_AXIS_TUSER : in std_logic; -- Should we treat this first value in the stream as an inital accumulate value? : Yes, when this is high we will pull the bias in
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

end staged_mac;
architecture behavioral of staged_mac is
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
    signal multiplied_value : std_logic_vector(15 downto 0) := (others => '0');
    signal accumulated_value : std_logic_vector(31 downto 0) := (others => '0');
    signal added_value :  std_logic_vector(31 downto 0) := (others => '0');
    signal outputOccurred : std_logic := '0'; 

begin

    -- Interface signals
    -- NOTE: UTILIZE THE DSP ON THE ZEDBOARDS

    -- Internal signals
    -- Debug Signals
    mac_debug <= x"00000000"; -- Double checking sanity
    added_value <=   std_logic_vector(resize(signed(accumulated_value) + resize(signed(multiplied_value), 32), 32));
    
    process(SD_AXIS_TDATA) is
    begin
        if(SD_AXIS_TDATA(16) = '1') then
            multiplied_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA(1 downto 0)) * signed(SD_AXIS_TDATA(3 downto 2)), 16));
        elsif(SD_AXIS_TDATA(17) = '1') then
            multiplied_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA(3 downto 0)) * signed(SD_AXIS_TDATA(7 downto 4)), 16));
        else
            multiplied_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA(7 downto 0)) * signed(SD_AXIS_TDATA(15 downto 8)), 16)); 
        end if;     
    end process;
    
    process(SD_AXIS_TVALID, SD_AXIS_TLAST, MO_AXIS_TREADY, outputOccurred) is   
    begin
       case currentState is -- State
            -- Wait here until we receive values
            when WAIT_FOR_VALUES =>
                if (SD_AXIS_TVALID = '1') then
                    if (SD_AXIS_TLAST = '1') then
                        nextState <= SEND_RESULT;
                    else
                        nextState <= MAC_STAGE;
                    end if;
                else 
                    if (SD_AXIS_TLAST = '1') then
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
               if (SD_AXIS_TVALID = '1') then
                    if (SD_AXIS_TLAST = '1') then
                        nextState <= SEND_RESULT;
                    else 
                        nextState <= MAC_STAGE;
                    end if;
                    
                else 
                    nextState <= WAIT_FOR_VALUES;
                end if;
                
            when SEND_RESULT =>
               if (MO_AXIS_TREADY = '1') then        
                    if (SD_AXIS_TVALID = '1') then
                        if (SD_AXIS_TLAST = '1') then
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
    
    process (ACLK, ARESETN) is
    begin
        -- Reset values if reset is low
        if ARESETN = '0' then -- Reset
            currentState <= WAIT_FOR_VALUES;
            SD_AXIS_TREADY <= '1'; -- We are ready to accept values
            accumulated_value <= (others => '0');

        else
            if rising_edge(ACLK) then -- Rising Edge
                case currentState is -- State
                    -- Wait here until we receive values
                    when WAIT_FOR_VALUES =>
                        case nextState is
                            when WAIT_FOR_VALUES =>
                                --SD_AXIS_TREADY <= '1';
                            when MAC_STAGE =>
                                --SD_AXIS_TREADY <= '1';
                                outputOccurred <= '0';
                                if (SD_AXIS_TUSER = '1') then
                                    accumulated_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA(15 downto 0)), 32));
                                else
                                    accumulated_value <= added_value;
                                end if;
                            when SEND_RESULT =>
                                --SD_AXIS_TREADY <= '0';
                                if (SD_AXIS_TVALID = '1') then
                                    if (SD_AXIS_TUSER = '1') then
                                        accumulated_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA(15 downto 0)), 32));
                                    else
                                        accumulated_value <= added_value;
                                    end if;
                                end if;
                            when others =>
                        end case; -- State
                        
                        MO_AXIS_TVALID <= '0';
                        MO_AXIS_TLAST <= '0';
                        SD_AXIS_TREADY <= '1';
                        currentState <= nextState;

                    when MAC_STAGE =>
                       case nextState is
                            when WAIT_FOR_VALUES =>
                                --SD_AXIS_TREADY <= '1';
                            when MAC_STAGE =>
                                --SD_AXIS_TREADY <= '1';
                                if (SD_AXIS_TUSER = '1') then 
                                    accumulated_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA(15 downto 0)), 32));
                                else
                                    accumulated_value <= added_value;
                                end if;
                            when SEND_RESULT =>
                                --SD_AXIS_TREADY <= '0';
                                if (SD_AXIS_TUSER = '1') then 
                                    accumulated_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA(15 downto 0)), 32));
                                else
                                    accumulated_value <= added_value;
                                end if;
                            when others =>
                        end case; -- State
                        
                        MO_AXIS_TVALID <= '0';
                        MO_AXIS_TLAST <= '0';
                        SD_AXIS_TREADY <= '1';
                        currentState <= nextState;

                    when SEND_RESULT =>
                        case nextState is
                            when WAIT_FOR_VALUES =>
                                 MO_AXIS_TVALID <= '1';
                                 MO_AXIS_TLAST <= '1';
                                 MO_AXIS_TDATA <= accumulated_value;
                                 SD_AXIS_TREADY <= '1';
                                 accumulated_value <= (others => '0');
                                 outputOccurred <= '1';
                                 
                            when MAC_STAGE =>
                                 MO_AXIS_TVALID <= '1';
                                 MO_AXIS_TLAST <= '1';
                                 MO_AXIS_TDATA <= accumulated_value;
                                 SD_AXIS_TREADY <= '1';
                                 
                                 if (SD_AXIS_TUSER = '1') then
                                    accumulated_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA(15 downto 0)), 32));
                                 else
                                    accumulated_value <= std_logic_vector(resize(signed(multiplied_value), 32));
                                 end if;
                                 
                            when SEND_RESULT =>
                                if (MO_AXIS_TREADY = '1') then
                                    MO_AXIS_TVALID <= '1';
                                    MO_AXIS_TLAST <= '1';
                                    MO_AXIS_TDATA <= accumulated_value;
                                    SD_AXIS_TREADY <= '1';
                                    
                                    if (SD_AXIS_TUSER = '1') then
                                       accumulated_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA(15 downto 0)), 32));
                                    else
                                       accumulated_value <= std_logic_vector(resize(signed(multiplied_value), 32));
                                    end if;
                                else
                                    MO_AXIS_TVALID <= '0';
                                    MO_AXIS_TLAST <= '0';
                                    SD_AXIS_TREADY <= '0';
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