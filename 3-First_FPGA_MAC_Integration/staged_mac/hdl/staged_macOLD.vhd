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
    generic (
        -- Parameters of mac
        C_DATA_WIDTH : integer := 8
    );
    port (
        ACLK : in std_logic;
        ARESETN : in std_logic;

        -- AXIS slave data interface
        SD_AXIS_TREADY : out std_logic;
        SD_AXIS_TDATA : in std_logic_vector(C_DATA_WIDTH * 2 - 1 downto 0); -- Packed data input
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
    signal state : STATE_TYPE;
    -- States:
    -- WAIT_FOR_VALUES: Waiting for valid values to come in
    -- MAC_STAGE: Multiply and accumulate values
    -- SEND_RESULT: Send the result out

    -- Debug signals, make sure we aren't going crazy
    signal mac_debug : std_logic_vector(31 downto 0);
    signal multiplied_value : std_logic_vector(C_DATA_WIDTH * 2 - 1 downto 0) := (others => '0');
    signal accumulated_value : std_logic_vector(31 downto 0) := (others => '0');

begin

    -- Interface signals
    -- NOTE: UTILIZE THE DSP ON THE ZEDBOARDS

    -- Internal signals
    -- Debug Signals
    mac_debug <= x"00000000"; -- Double checking sanity
    multiplied_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA(C_DATA_WIDTH - 1 downto 0)) * signed(SD_AXIS_TDATA(C_DATA_WIDTH * 2 - 1 downto C_DATA_WIDTH)), C_DATA_WIDTH * 2));

    process (ACLK) is
    begin
        if rising_edge(ACLK) then -- Rising Edge

            -- Reset values if reset is low
            if ARESETN = '0' then -- Reset
                state <= WAIT_FOR_VALUES;
                SD_AXIS_TREADY <= '1'; -- We are ready to accept values
                accumulated_value <= (others => '0');
                MO_AXIS_TDATA <= (others => '0');
                --multiplied_value <= (others => '0');

            else
                case state is -- State
                        -- Wait here until we receive values
                    when WAIT_FOR_VALUES =>

                        MO_AXIS_TVALID <= '0';
                        MO_AXIS_TLAST <= '0';
                        SD_AXIS_TREADY <= '1';

                        if (SD_AXIS_TVALID = '1') then
                            if (SD_AXIS_TUSER = '1') then
                                accumulated_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA), 32));
                            else
                                accumulated_value <= std_logic_vector(resize(signed(multiplied_value), 32));
                            end if;

                            if (SD_AXIS_TLAST = '1') then
                                state <= SEND_RESULT;
                            else
                                state <= MAC_STAGE;
                            end if;

                        end if;

                    when MAC_STAGE =>
                        SD_AXIS_TREADY <= '1';

                        if (SD_AXIS_TVALID = '1') then
                            if (SD_AXIS_TUSER = '1') then 
                                accumulated_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA), 32));
                            else
                                accumulated_value <= std_logic_vector(resize(signed(accumulated_value) + resize(signed(multiplied_value), 32), 32));
                            end if;
                            if (SD_AXIS_TLAST = '1') then
                                state <= SEND_RESULT;
                            else
                                state <= MAC_STAGE;
                            end if;
                        end if;

                    when SEND_RESULT =>
                        SD_AXIS_TREADY <= '0';
                        MO_AXIS_TVALID <= '1';
                        MO_AXIS_TLAST <= '1';
                        MO_AXIS_TDATA <= accumulated_value;
                        MO_AXIS_TID <= SD_AXIS_TID;

                        if (MO_AXIS_TREADY = '1') then
                            if (SD_AXIS_TVALID = '1') then
                                if (SD_AXIS_TUSER = '1') then
                                    accumulated_value <= std_logic_vector(resize(signed(SD_AXIS_TDATA), 32));
                                else
                                    accumulated_value <= std_logic_vector(resize(signed(multiplied_value), 32));
                                end if;

                                if (SD_AXIS_TLAST = '1') then
                                    state <= SEND_RESULT;
                                else
                                    state <= MAC_STAGE;
                                end if;

                            else
                                state <= WAIT_FOR_VALUES;
                                accumulated_value <= (others => '0');
                                MO_AXIS_TVALID <= '0';
                                MO_AXIS_TLAST <= '0';
                            end if;
                        end if;

                        -- Other stages go here	

                    when others =>
                        state <= WAIT_FOR_VALUES;
                        -- Not really important, this case should never happen
                        -- Needed for proper synthisis         
                end case; -- State
            end if; -- Reset

        end if; -- Rising Edge
    end process;
end architecture behavioral;