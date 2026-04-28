-------------------------------------------------------------------------
-- Tyler Bibus
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- fulladder.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: File contains structural version of a Ones Complimentor
--
--
-- NOTES: 


-- 02/01/2025 by TJB::Created
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity halfadder is
  port(i_X : in std_logic;
       i_Y : in std_logic;
       o_S : out std_logic;
       o_C : out std_logic);
end halfadder;

architecture structural of halfadder is

  component andg2
    port(i_A          : in std_logic;
        i_B          : in std_logic;
        o_F          : out std_logic); 
  end component;

  component xorg2
  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);
  end component;

signal invC, ixor, nicc, xandy, xory, icc : std_logic;

begin

  -- calculate sum
  sum: xorg2
    port map(
        i_A => i_X,
        i_B => i_Y,
        o_F => o_S
    );

  -- calculate carry
  carry: andg2
    port map(
        i_A => i_X,
        i_B => i_Y,
        o_F => o_C
    );


end structural;