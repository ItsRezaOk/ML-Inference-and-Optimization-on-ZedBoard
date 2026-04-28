---------------------------------------
-- Multiplier.vhd
---------------------------------------
-- Basic 8 bit Multiplier for staged_mac.vhd
-- Effectively a 2d array of adders
---------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplier_int8 is
    port(
        input : in std_logic_vector(7 downto 0);
        weight : in std_logic_vector(7 downto 0);
        output : out std_logic_vector(15 downto 0)
    )
end multiplier_int8;

architecture structural of multiplier_int8 is

    component halfadder is
        port(i_X : in std_logic;
            i_Y : in std_logic;
            o_S : out std_logic;
            o_C : out std_logic);
    end component;

    component fulladder is
        port(i_C : in std_logic;
            i_X : in std_logic;
            i_Y : in std_logic;
            o_S : out std_logic;
            o_C : out std_logic);
    end component;

    component andg2 is
        port(i_A : in std_logic;
            i_B : in std_logic;
            o_F : out std_logic);
    end component;

begin



end structural;
