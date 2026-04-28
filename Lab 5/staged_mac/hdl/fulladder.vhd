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

entity fulladder is
  port(i_C : in std_logic;
       i_X : in std_logic;
       i_Y : in std_logic;
       o_S : out std_logic;
       o_C : out std_logic);
end fulladder;

architecture structural of fulladder is
  component invg
  port(i_A          : in std_logic;
       o_F          : out std_logic);
  end component;

  component andg2
    port(i_A          : in std_logic;
        i_B          : in std_logic;
        o_F          : out std_logic); 
  end component;

  component org2
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
-- Sum Calculation i_C ^ (i_X ^ i_Y)
  xyxor : xorg2
  port map(i_A => i_X, i_B => i_Y, o_F => ixor);

  sxor : xorg2
  port map(i_A => i_C, i_B => ixor, o_F => o_S);

-- Carry Calculation
  -- ~i_C AND (i_X and i_Y)
  iCnot : invg
  port map(i_A => i_C, o_F => invC);

  andxy : andg2
  port map(i_A => i_X, i_B => i_Y, o_F => xandy);

  noticandxy : andg2
  port map(i_A => invC, i_B => xandy, o_F => nicc);

  -- i_C AND (i_X or i_Y)
  orxy : org2
  port map(i_A => i_X, i_B => i_Y, o_F => xory);

  candxory : andg2
  port map(i_A => i_C, i_B => xory, o_F => icc);

  -- final OR gate (~i_C | i_C)
  carryOut : org2
  port map(i_A => nicc, i_B => icc, o_F => o_C);


end structural;