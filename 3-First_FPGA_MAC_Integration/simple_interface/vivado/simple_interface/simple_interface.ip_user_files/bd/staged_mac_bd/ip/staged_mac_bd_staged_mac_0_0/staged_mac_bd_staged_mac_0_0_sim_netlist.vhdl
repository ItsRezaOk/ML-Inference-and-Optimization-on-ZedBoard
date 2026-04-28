-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Tue Oct 21 01:56:10 2025
-- Host        : co2050-14.ece.iastate.edu running 64-bit unknown
-- Command     : write_vhdl -force -mode funcsim
--               /home/cam2022/CPRE-487_git/CPRE-4870/Lab_3/simple_interface/vivado/simple_interface/simple_interface.srcs/sources_1/bd/staged_mac_bd/ip/staged_mac_bd_staged_mac_0_0/staged_mac_bd_staged_mac_0_0_sim_netlist.vhdl
-- Design      : staged_mac_bd_staged_mac_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity staged_mac_bd_staged_mac_0_0_staged_mac is
  port (
    MO_AXIS_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SD_AXIS_TREADY : out STD_LOGIC;
    MO_AXIS_TLAST : out STD_LOGIC;
    SD_AXIS_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ACLK : in STD_LOGIC;
    MO_AXIS_TREADY : in STD_LOGIC;
    SD_AXIS_TVALID : in STD_LOGIC;
    SD_AXIS_TLAST : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    SD_AXIS_TUSER : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of staged_mac_bd_staged_mac_0_0_staged_mac : entity is "staged_mac";
end staged_mac_bd_staged_mac_0_0_staged_mac;

architecture STRUCTURE of staged_mac_bd_staged_mac_0_0_staged_mac is
  signal \ARG__0_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__0_n_1\ : STD_LOGIC;
  signal \ARG__0_carry__0_n_2\ : STD_LOGIC;
  signal \ARG__0_carry__0_n_3\ : STD_LOGIC;
  signal \ARG__0_carry__0_n_4\ : STD_LOGIC;
  signal \ARG__0_carry__0_n_5\ : STD_LOGIC;
  signal \ARG__0_carry__0_n_6\ : STD_LOGIC;
  signal \ARG__0_carry__0_n_7\ : STD_LOGIC;
  signal \ARG__0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \ARG__0_carry__1_n_1\ : STD_LOGIC;
  signal \ARG__0_carry__1_n_3\ : STD_LOGIC;
  signal \ARG__0_carry__1_n_6\ : STD_LOGIC;
  signal \ARG__0_carry__1_n_7\ : STD_LOGIC;
  signal \ARG__0_carry_i_1_n_0\ : STD_LOGIC;
  signal \ARG__0_carry_i_2_n_0\ : STD_LOGIC;
  signal \ARG__0_carry_i_3_n_0\ : STD_LOGIC;
  signal \ARG__0_carry_i_4_n_0\ : STD_LOGIC;
  signal \ARG__0_carry_i_5_n_0\ : STD_LOGIC;
  signal \ARG__0_carry_i_6_n_0\ : STD_LOGIC;
  signal \ARG__0_carry_i_7_n_0\ : STD_LOGIC;
  signal \ARG__0_carry_n_0\ : STD_LOGIC;
  signal \ARG__0_carry_n_1\ : STD_LOGIC;
  signal \ARG__0_carry_n_2\ : STD_LOGIC;
  signal \ARG__0_carry_n_3\ : STD_LOGIC;
  signal \ARG__0_carry_n_4\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__0_n_1\ : STD_LOGIC;
  signal \ARG__30_carry__0_n_2\ : STD_LOGIC;
  signal \ARG__30_carry__0_n_3\ : STD_LOGIC;
  signal \ARG__30_carry__0_n_4\ : STD_LOGIC;
  signal \ARG__30_carry__0_n_5\ : STD_LOGIC;
  signal \ARG__30_carry__0_n_6\ : STD_LOGIC;
  signal \ARG__30_carry__0_n_7\ : STD_LOGIC;
  signal \ARG__30_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \ARG__30_carry__1_n_1\ : STD_LOGIC;
  signal \ARG__30_carry__1_n_3\ : STD_LOGIC;
  signal \ARG__30_carry__1_n_6\ : STD_LOGIC;
  signal \ARG__30_carry__1_n_7\ : STD_LOGIC;
  signal \ARG__30_carry_i_1_n_0\ : STD_LOGIC;
  signal \ARG__30_carry_i_2_n_0\ : STD_LOGIC;
  signal \ARG__30_carry_i_3_n_0\ : STD_LOGIC;
  signal \ARG__30_carry_i_4_n_0\ : STD_LOGIC;
  signal \ARG__30_carry_i_5_n_0\ : STD_LOGIC;
  signal \ARG__30_carry_i_6_n_0\ : STD_LOGIC;
  signal \ARG__30_carry_i_7_n_0\ : STD_LOGIC;
  signal \ARG__30_carry_n_0\ : STD_LOGIC;
  signal \ARG__30_carry_n_1\ : STD_LOGIC;
  signal \ARG__30_carry_n_2\ : STD_LOGIC;
  signal \ARG__30_carry_n_3\ : STD_LOGIC;
  signal \ARG__30_carry_n_4\ : STD_LOGIC;
  signal \ARG__30_carry_n_5\ : STD_LOGIC;
  signal \ARG__30_carry_n_6\ : STD_LOGIC;
  signal \ARG__30_carry_n_7\ : STD_LOGIC;
  signal \ARG__59_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__0_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__0_n_1\ : STD_LOGIC;
  signal \ARG__59_carry__0_n_2\ : STD_LOGIC;
  signal \ARG__59_carry__0_n_3\ : STD_LOGIC;
  signal \ARG__59_carry__0_n_4\ : STD_LOGIC;
  signal \ARG__59_carry__0_n_5\ : STD_LOGIC;
  signal \ARG__59_carry__0_n_6\ : STD_LOGIC;
  signal \ARG__59_carry__0_n_7\ : STD_LOGIC;
  signal \ARG__59_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \ARG__59_carry__1_n_3\ : STD_LOGIC;
  signal \ARG__59_carry__1_n_6\ : STD_LOGIC;
  signal \ARG__59_carry__1_n_7\ : STD_LOGIC;
  signal \ARG__59_carry_i_1_n_0\ : STD_LOGIC;
  signal \ARG__59_carry_i_2_n_0\ : STD_LOGIC;
  signal \ARG__59_carry_i_3_n_0\ : STD_LOGIC;
  signal \ARG__59_carry_i_4_n_0\ : STD_LOGIC;
  signal \ARG__59_carry_i_5_n_0\ : STD_LOGIC;
  signal \ARG__59_carry_i_6_n_0\ : STD_LOGIC;
  signal \ARG__59_carry_i_7_n_0\ : STD_LOGIC;
  signal \ARG__59_carry_n_0\ : STD_LOGIC;
  signal \ARG__59_carry_n_1\ : STD_LOGIC;
  signal \ARG__59_carry_n_2\ : STD_LOGIC;
  signal \ARG__59_carry_n_3\ : STD_LOGIC;
  signal \ARG__59_carry_n_4\ : STD_LOGIC;
  signal \ARG__59_carry_n_5\ : STD_LOGIC;
  signal \ARG__59_carry_n_6\ : STD_LOGIC;
  signal \ARG__59_carry_n_7\ : STD_LOGIC;
  signal \ARG__86_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__0_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__0_n_1\ : STD_LOGIC;
  signal \ARG__86_carry__0_n_2\ : STD_LOGIC;
  signal \ARG__86_carry__0_n_3\ : STD_LOGIC;
  signal \ARG__86_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__1_n_0\ : STD_LOGIC;
  signal \ARG__86_carry__1_n_1\ : STD_LOGIC;
  signal \ARG__86_carry__1_n_2\ : STD_LOGIC;
  signal \ARG__86_carry__1_n_3\ : STD_LOGIC;
  signal \ARG__86_carry_i_1_n_0\ : STD_LOGIC;
  signal \ARG__86_carry_i_2_n_0\ : STD_LOGIC;
  signal \ARG__86_carry_i_3_n_0\ : STD_LOGIC;
  signal \ARG__86_carry_i_4_n_0\ : STD_LOGIC;
  signal \ARG__86_carry_i_5_n_0\ : STD_LOGIC;
  signal \ARG__86_carry_i_6_n_0\ : STD_LOGIC;
  signal \ARG__86_carry_i_7_n_0\ : STD_LOGIC;
  signal \ARG__86_carry_n_0\ : STD_LOGIC;
  signal \ARG__86_carry_n_1\ : STD_LOGIC;
  signal \ARG__86_carry_n_2\ : STD_LOGIC;
  signal \ARG__86_carry_n_3\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__1_n_4\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__1_n_5\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__1_n_6\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__1_n_7\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__2_n_0\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__2_n_4\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__2_n_5\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__2_n_6\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__2_n_7\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__3_n_0\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__3_n_1\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__3_n_2\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__3_n_3\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__3_n_4\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__3_n_5\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__3_n_6\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__3_n_7\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__4_n_0\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__4_n_1\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__4_n_2\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__4_n_3\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__4_n_4\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__4_n_5\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__4_n_6\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__4_n_7\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__5_n_0\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__5_n_1\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__5_n_2\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__5_n_3\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__5_n_4\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__5_n_5\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__5_n_6\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__5_n_7\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__6_n_1\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__6_n_2\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__6_n_3\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__6_n_5\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__6_n_6\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry__6_n_7\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \ARG_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal MO_AXIS_TDATA0 : STD_LOGIC;
  signal \^mo_axis_tlast\ : STD_LOGIC;
  signal MO_AXIS_TVALID_i_1_n_0 : STD_LOGIC;
  signal RESIZE : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \^sd_axis_tready\ : STD_LOGIC;
  signal SD_AXIS_TREADY_i_1_n_0 : STD_LOGIC;
  signal accumulated_value : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \accumulated_value[31]_i_3_n_0\ : STD_LOGIC;
  signal accumulated_value_0 : STD_LOGIC;
  signal currentState : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal nextState : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal outputOccurred : STD_LOGIC;
  signal outputOccurred_i_1_n_0 : STD_LOGIC;
  signal outputOccurred_i_2_n_0 : STD_LOGIC;
  signal outputOccurred_i_3_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in0 : STD_LOGIC;
  signal p_0_out0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_ARG__0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_ARG__0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_ARG__30_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_ARG__30_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_ARG__59_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_ARG__59_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_ARG__86_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ARG__86_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_ARG_inferred__0/i__carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \ARG__86_carry\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG__86_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG__86_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG__86_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG_inferred__0/i__carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG_inferred__0/i__carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG_inferred__0/i__carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG_inferred__0/i__carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG_inferred__0/i__carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG_inferred__0/i__carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \ARG_inferred__0/i__carry__6\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \currentState[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of outputOccurred_i_3 : label is "soft_lutpair0";
begin
  MO_AXIS_TLAST <= \^mo_axis_tlast\;
  SD_AXIS_TREADY <= \^sd_axis_tready\;
\ARG__0_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ARG__0_carry_n_0\,
      CO(2) => \ARG__0_carry_n_1\,
      CO(1) => \ARG__0_carry_n_2\,
      CO(0) => \ARG__0_carry_n_3\,
      CYINIT => '0',
      DI(3) => \ARG__0_carry_i_1_n_0\,
      DI(2) => \ARG__0_carry_i_2_n_0\,
      DI(1) => \ARG__0_carry_i_3_n_0\,
      DI(0) => '0',
      O(3) => \ARG__0_carry_n_4\,
      O(2 downto 0) => RESIZE(2 downto 0),
      S(3) => \ARG__0_carry_i_4_n_0\,
      S(2) => \ARG__0_carry_i_5_n_0\,
      S(1) => \ARG__0_carry_i_6_n_0\,
      S(0) => \ARG__0_carry_i_7_n_0\
    );
\ARG__0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG__0_carry_n_0\,
      CO(3) => \ARG__0_carry__0_n_0\,
      CO(2) => \ARG__0_carry__0_n_1\,
      CO(1) => \ARG__0_carry__0_n_2\,
      CO(0) => \ARG__0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \ARG__0_carry__0_i_1_n_0\,
      DI(2) => \ARG__0_carry__0_i_2_n_0\,
      DI(1) => \ARG__0_carry__0_i_3_n_0\,
      DI(0) => \ARG__0_carry__0_i_4_n_0\,
      O(3) => \ARG__0_carry__0_n_4\,
      O(2) => \ARG__0_carry__0_n_5\,
      O(1) => \ARG__0_carry__0_n_6\,
      O(0) => \ARG__0_carry__0_n_7\,
      S(3) => \ARG__0_carry__0_i_5_n_0\,
      S(2) => \ARG__0_carry__0_i_6_n_0\,
      S(1) => \ARG__0_carry__0_i_7_n_0\,
      S(0) => \ARG__0_carry__0_i_8_n_0\
    );
\ARG__0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880880080800000"
    )
        port map (
      I0 => SD_AXIS_TDATA(6),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(4),
      I3 => SD_AXIS_TDATA(9),
      I4 => SD_AXIS_TDATA(10),
      I5 => SD_AXIS_TDATA(5),
      O => \ARG__0_carry__0_i_1_n_0\
    );
\ARG__0_carry__0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA(6),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(9),
      I3 => SD_AXIS_TDATA(5),
      I4 => SD_AXIS_TDATA(10),
      I5 => SD_AXIS_TDATA(4),
      O => \ARG__0_carry__0_i_10_n_0\
    );
\ARG__0_carry__0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA(5),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(9),
      I3 => SD_AXIS_TDATA(4),
      I4 => SD_AXIS_TDATA(10),
      I5 => SD_AXIS_TDATA(3),
      O => \ARG__0_carry__0_i_11_n_0\
    );
\ARG__0_carry__0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA(4),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(9),
      I3 => SD_AXIS_TDATA(3),
      I4 => SD_AXIS_TDATA(10),
      I5 => SD_AXIS_TDATA(2),
      O => \ARG__0_carry__0_i_12_n_0\
    );
\ARG__0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880880080800000"
    )
        port map (
      I0 => SD_AXIS_TDATA(5),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(3),
      I3 => SD_AXIS_TDATA(9),
      I4 => SD_AXIS_TDATA(10),
      I5 => SD_AXIS_TDATA(4),
      O => \ARG__0_carry__0_i_2_n_0\
    );
\ARG__0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880880080800000"
    )
        port map (
      I0 => SD_AXIS_TDATA(4),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(2),
      I3 => SD_AXIS_TDATA(9),
      I4 => SD_AXIS_TDATA(10),
      I5 => SD_AXIS_TDATA(3),
      O => \ARG__0_carry__0_i_3_n_0\
    );
\ARG__0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => SD_AXIS_TDATA(3),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(2),
      I3 => SD_AXIS_TDATA(9),
      I4 => SD_AXIS_TDATA(10),
      I5 => SD_AXIS_TDATA(1),
      O => \ARG__0_carry__0_i_4_n_0\
    );
\ARG__0_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ARG__0_carry__0_i_1_n_0\,
      I1 => \ARG__0_carry__0_i_9_n_0\,
      O => \ARG__0_carry__0_i_5_n_0\
    );
\ARG__0_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ARG__0_carry__0_i_2_n_0\,
      I1 => \ARG__0_carry__0_i_10_n_0\,
      O => \ARG__0_carry__0_i_6_n_0\
    );
\ARG__0_carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ARG__0_carry__0_i_3_n_0\,
      I1 => \ARG__0_carry__0_i_11_n_0\,
      O => \ARG__0_carry__0_i_7_n_0\
    );
\ARG__0_carry__0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ARG__0_carry__0_i_4_n_0\,
      I1 => \ARG__0_carry__0_i_12_n_0\,
      O => \ARG__0_carry__0_i_8_n_0\
    );
\ARG__0_carry__0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7888877787778777"
    )
        port map (
      I0 => SD_AXIS_TDATA(7),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(9),
      I3 => SD_AXIS_TDATA(6),
      I4 => SD_AXIS_TDATA(5),
      I5 => SD_AXIS_TDATA(10),
      O => \ARG__0_carry__0_i_9_n_0\
    );
\ARG__0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG__0_carry__0_n_0\,
      CO(3) => \NLW_ARG__0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \ARG__0_carry__1_n_1\,
      CO(1) => \NLW_ARG__0_carry__1_CO_UNCONNECTED\(1),
      CO(0) => \ARG__0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \ARG__0_carry__1_i_1_n_0\,
      DI(0) => \ARG__0_carry__1_i_2_n_0\,
      O(3 downto 2) => \NLW_ARG__0_carry__1_O_UNCONNECTED\(3 downto 2),
      O(1) => \ARG__0_carry__1_n_6\,
      O(0) => \ARG__0_carry__1_n_7\,
      S(3 downto 2) => B"01",
      S(1) => \ARG__0_carry__1_i_3_n_0\,
      S(0) => \ARG__0_carry__1_i_4_n_0\
    );
\ARG__0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => SD_AXIS_TDATA(9),
      I1 => SD_AXIS_TDATA(7),
      I2 => SD_AXIS_TDATA(10),
      I3 => SD_AXIS_TDATA(6),
      O => \ARG__0_carry__1_i_1_n_0\
    );
\ARG__0_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F777700070007000"
    )
        port map (
      I0 => SD_AXIS_TDATA(7),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(9),
      I3 => SD_AXIS_TDATA(6),
      I4 => SD_AXIS_TDATA(10),
      I5 => SD_AXIS_TDATA(5),
      O => \ARG__0_carry__1_i_2_n_0\
    );
\ARG__0_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"25FF"
    )
        port map (
      I0 => SD_AXIS_TDATA(6),
      I1 => SD_AXIS_TDATA(9),
      I2 => SD_AXIS_TDATA(7),
      I3 => SD_AXIS_TDATA(10),
      O => \ARG__0_carry__1_i_3_n_0\
    );
\ARG__0_carry__1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4320F05F2FDFAF5F"
    )
        port map (
      I0 => SD_AXIS_TDATA(5),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(10),
      I3 => SD_AXIS_TDATA(6),
      I4 => SD_AXIS_TDATA(7),
      I5 => SD_AXIS_TDATA(9),
      O => \ARG__0_carry__1_i_4_n_0\
    );
\ARG__0_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA(3),
      I1 => SD_AXIS_TDATA(8),
      I2 => SD_AXIS_TDATA(10),
      I3 => SD_AXIS_TDATA(1),
      I4 => SD_AXIS_TDATA(9),
      I5 => SD_AXIS_TDATA(2),
      O => \ARG__0_carry_i_1_n_0\
    );
\ARG__0_carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA(1),
      I1 => SD_AXIS_TDATA(9),
      I2 => SD_AXIS_TDATA(10),
      I3 => SD_AXIS_TDATA(0),
      O => \ARG__0_carry_i_2_n_0\
    );
\ARG__0_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA(0),
      I1 => SD_AXIS_TDATA(9),
      O => \ARG__0_carry_i_3_n_0\
    );
\ARG__0_carry_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \ARG__0_carry_i_1_n_0\,
      I1 => SD_AXIS_TDATA(1),
      I2 => SD_AXIS_TDATA(9),
      I3 => SD_AXIS_TDATA(0),
      I4 => SD_AXIS_TDATA(10),
      O => \ARG__0_carry_i_4_n_0\
    );
\ARG__0_carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA(0),
      I1 => SD_AXIS_TDATA(10),
      I2 => SD_AXIS_TDATA(9),
      I3 => SD_AXIS_TDATA(1),
      I4 => SD_AXIS_TDATA(8),
      I5 => SD_AXIS_TDATA(2),
      O => \ARG__0_carry_i_5_n_0\
    );
\ARG__0_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA(8),
      I1 => SD_AXIS_TDATA(1),
      I2 => SD_AXIS_TDATA(9),
      I3 => SD_AXIS_TDATA(0),
      O => \ARG__0_carry_i_6_n_0\
    );
\ARG__0_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA(0),
      I1 => SD_AXIS_TDATA(8),
      O => \ARG__0_carry_i_7_n_0\
    );
\ARG__30_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ARG__30_carry_n_0\,
      CO(2) => \ARG__30_carry_n_1\,
      CO(1) => \ARG__30_carry_n_2\,
      CO(0) => \ARG__30_carry_n_3\,
      CYINIT => '0',
      DI(3) => \ARG__30_carry_i_1_n_0\,
      DI(2) => \ARG__30_carry_i_2_n_0\,
      DI(1) => \ARG__30_carry_i_3_n_0\,
      DI(0) => '0',
      O(3) => \ARG__30_carry_n_4\,
      O(2) => \ARG__30_carry_n_5\,
      O(1) => \ARG__30_carry_n_6\,
      O(0) => \ARG__30_carry_n_7\,
      S(3) => \ARG__30_carry_i_4_n_0\,
      S(2) => \ARG__30_carry_i_5_n_0\,
      S(1) => \ARG__30_carry_i_6_n_0\,
      S(0) => \ARG__30_carry_i_7_n_0\
    );
\ARG__30_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG__30_carry_n_0\,
      CO(3) => \ARG__30_carry__0_n_0\,
      CO(2) => \ARG__30_carry__0_n_1\,
      CO(1) => \ARG__30_carry__0_n_2\,
      CO(0) => \ARG__30_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \ARG__30_carry__0_i_1_n_0\,
      DI(2) => \ARG__30_carry__0_i_2_n_0\,
      DI(1) => \ARG__30_carry__0_i_3_n_0\,
      DI(0) => \ARG__30_carry__0_i_4_n_0\,
      O(3) => \ARG__30_carry__0_n_4\,
      O(2) => \ARG__30_carry__0_n_5\,
      O(1) => \ARG__30_carry__0_n_6\,
      O(0) => \ARG__30_carry__0_n_7\,
      S(3) => \ARG__30_carry__0_i_5_n_0\,
      S(2) => \ARG__30_carry__0_i_6_n_0\,
      S(1) => \ARG__30_carry__0_i_7_n_0\,
      S(0) => \ARG__30_carry__0_i_8_n_0\
    );
\ARG__30_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880880080800000"
    )
        port map (
      I0 => SD_AXIS_TDATA(6),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(4),
      I3 => SD_AXIS_TDATA(12),
      I4 => SD_AXIS_TDATA(13),
      I5 => SD_AXIS_TDATA(5),
      O => \ARG__30_carry__0_i_1_n_0\
    );
\ARG__30_carry__0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA(6),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(12),
      I3 => SD_AXIS_TDATA(5),
      I4 => SD_AXIS_TDATA(13),
      I5 => SD_AXIS_TDATA(4),
      O => \ARG__30_carry__0_i_10_n_0\
    );
\ARG__30_carry__0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA(5),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(12),
      I3 => SD_AXIS_TDATA(4),
      I4 => SD_AXIS_TDATA(13),
      I5 => SD_AXIS_TDATA(3),
      O => \ARG__30_carry__0_i_11_n_0\
    );
\ARG__30_carry__0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA(4),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(12),
      I3 => SD_AXIS_TDATA(3),
      I4 => SD_AXIS_TDATA(13),
      I5 => SD_AXIS_TDATA(2),
      O => \ARG__30_carry__0_i_12_n_0\
    );
\ARG__30_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880880080800000"
    )
        port map (
      I0 => SD_AXIS_TDATA(5),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(3),
      I3 => SD_AXIS_TDATA(12),
      I4 => SD_AXIS_TDATA(13),
      I5 => SD_AXIS_TDATA(4),
      O => \ARG__30_carry__0_i_2_n_0\
    );
\ARG__30_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880880080800000"
    )
        port map (
      I0 => SD_AXIS_TDATA(4),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(2),
      I3 => SD_AXIS_TDATA(12),
      I4 => SD_AXIS_TDATA(13),
      I5 => SD_AXIS_TDATA(3),
      O => \ARG__30_carry__0_i_3_n_0\
    );
\ARG__30_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => SD_AXIS_TDATA(3),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(2),
      I3 => SD_AXIS_TDATA(12),
      I4 => SD_AXIS_TDATA(13),
      I5 => SD_AXIS_TDATA(1),
      O => \ARG__30_carry__0_i_4_n_0\
    );
\ARG__30_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ARG__30_carry__0_i_1_n_0\,
      I1 => \ARG__30_carry__0_i_9_n_0\,
      O => \ARG__30_carry__0_i_5_n_0\
    );
\ARG__30_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ARG__30_carry__0_i_2_n_0\,
      I1 => \ARG__30_carry__0_i_10_n_0\,
      O => \ARG__30_carry__0_i_6_n_0\
    );
\ARG__30_carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ARG__30_carry__0_i_3_n_0\,
      I1 => \ARG__30_carry__0_i_11_n_0\,
      O => \ARG__30_carry__0_i_7_n_0\
    );
\ARG__30_carry__0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ARG__30_carry__0_i_4_n_0\,
      I1 => \ARG__30_carry__0_i_12_n_0\,
      O => \ARG__30_carry__0_i_8_n_0\
    );
\ARG__30_carry__0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7888877787778777"
    )
        port map (
      I0 => SD_AXIS_TDATA(7),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(12),
      I3 => SD_AXIS_TDATA(6),
      I4 => SD_AXIS_TDATA(5),
      I5 => SD_AXIS_TDATA(13),
      O => \ARG__30_carry__0_i_9_n_0\
    );
\ARG__30_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG__30_carry__0_n_0\,
      CO(3) => \NLW_ARG__30_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \ARG__30_carry__1_n_1\,
      CO(1) => \NLW_ARG__30_carry__1_CO_UNCONNECTED\(1),
      CO(0) => \ARG__30_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \ARG__30_carry__1_i_1_n_0\,
      DI(0) => \ARG__30_carry__1_i_2_n_0\,
      O(3 downto 2) => \NLW_ARG__30_carry__1_O_UNCONNECTED\(3 downto 2),
      O(1) => \ARG__30_carry__1_n_6\,
      O(0) => \ARG__30_carry__1_n_7\,
      S(3 downto 2) => B"01",
      S(1) => \ARG__30_carry__1_i_3_n_0\,
      S(0) => \ARG__30_carry__1_i_4_n_0\
    );
\ARG__30_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => SD_AXIS_TDATA(12),
      I1 => SD_AXIS_TDATA(7),
      I2 => SD_AXIS_TDATA(13),
      I3 => SD_AXIS_TDATA(6),
      O => \ARG__30_carry__1_i_1_n_0\
    );
\ARG__30_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F777700070007000"
    )
        port map (
      I0 => SD_AXIS_TDATA(7),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(12),
      I3 => SD_AXIS_TDATA(6),
      I4 => SD_AXIS_TDATA(13),
      I5 => SD_AXIS_TDATA(5),
      O => \ARG__30_carry__1_i_2_n_0\
    );
\ARG__30_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"25FF"
    )
        port map (
      I0 => SD_AXIS_TDATA(6),
      I1 => SD_AXIS_TDATA(12),
      I2 => SD_AXIS_TDATA(7),
      I3 => SD_AXIS_TDATA(13),
      O => \ARG__30_carry__1_i_3_n_0\
    );
\ARG__30_carry__1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4320F05F2FDFAF5F"
    )
        port map (
      I0 => SD_AXIS_TDATA(5),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(13),
      I3 => SD_AXIS_TDATA(6),
      I4 => SD_AXIS_TDATA(7),
      I5 => SD_AXIS_TDATA(12),
      O => \ARG__30_carry__1_i_4_n_0\
    );
\ARG__30_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA(3),
      I1 => SD_AXIS_TDATA(11),
      I2 => SD_AXIS_TDATA(13),
      I3 => SD_AXIS_TDATA(1),
      I4 => SD_AXIS_TDATA(12),
      I5 => SD_AXIS_TDATA(2),
      O => \ARG__30_carry_i_1_n_0\
    );
\ARG__30_carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA(1),
      I1 => SD_AXIS_TDATA(12),
      I2 => SD_AXIS_TDATA(13),
      I3 => SD_AXIS_TDATA(0),
      O => \ARG__30_carry_i_2_n_0\
    );
\ARG__30_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA(0),
      I1 => SD_AXIS_TDATA(12),
      O => \ARG__30_carry_i_3_n_0\
    );
\ARG__30_carry_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \ARG__30_carry_i_1_n_0\,
      I1 => SD_AXIS_TDATA(1),
      I2 => SD_AXIS_TDATA(12),
      I3 => SD_AXIS_TDATA(0),
      I4 => SD_AXIS_TDATA(13),
      O => \ARG__30_carry_i_4_n_0\
    );
\ARG__30_carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA(0),
      I1 => SD_AXIS_TDATA(13),
      I2 => SD_AXIS_TDATA(12),
      I3 => SD_AXIS_TDATA(1),
      I4 => SD_AXIS_TDATA(11),
      I5 => SD_AXIS_TDATA(2),
      O => \ARG__30_carry_i_5_n_0\
    );
\ARG__30_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA(11),
      I1 => SD_AXIS_TDATA(1),
      I2 => SD_AXIS_TDATA(12),
      I3 => SD_AXIS_TDATA(0),
      O => \ARG__30_carry_i_6_n_0\
    );
\ARG__30_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA(0),
      I1 => SD_AXIS_TDATA(11),
      O => \ARG__30_carry_i_7_n_0\
    );
\ARG__59_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ARG__59_carry_n_0\,
      CO(2) => \ARG__59_carry_n_1\,
      CO(1) => \ARG__59_carry_n_2\,
      CO(0) => \ARG__59_carry_n_3\,
      CYINIT => '0',
      DI(3) => \ARG__59_carry_i_1_n_0\,
      DI(2) => \ARG__59_carry_i_2_n_0\,
      DI(1) => \ARG__59_carry_i_3_n_0\,
      DI(0) => '0',
      O(3) => \ARG__59_carry_n_4\,
      O(2) => \ARG__59_carry_n_5\,
      O(1) => \ARG__59_carry_n_6\,
      O(0) => \ARG__59_carry_n_7\,
      S(3) => \ARG__59_carry_i_4_n_0\,
      S(2) => \ARG__59_carry_i_5_n_0\,
      S(1) => \ARG__59_carry_i_6_n_0\,
      S(0) => \ARG__59_carry_i_7_n_0\
    );
\ARG__59_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG__59_carry_n_0\,
      CO(3) => \ARG__59_carry__0_n_0\,
      CO(2) => \ARG__59_carry__0_n_1\,
      CO(1) => \ARG__59_carry__0_n_2\,
      CO(0) => \ARG__59_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \ARG__59_carry__0_i_1_n_0\,
      DI(2) => \ARG__59_carry__0_i_2_n_0\,
      DI(1) => \ARG__59_carry__0_i_3_n_0\,
      DI(0) => \ARG__59_carry__0_i_4_n_0\,
      O(3) => \ARG__59_carry__0_n_4\,
      O(2) => \ARG__59_carry__0_n_5\,
      O(1) => \ARG__59_carry__0_n_6\,
      O(0) => \ARG__59_carry__0_n_7\,
      S(3) => \ARG__59_carry__0_i_5_n_0\,
      S(2) => \ARG__59_carry__0_i_6_n_0\,
      S(1) => \ARG__59_carry__0_i_7_n_0\,
      S(0) => \ARG__59_carry__0_i_8_n_0\
    );
\ARG__59_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A00"
    )
        port map (
      I0 => SD_AXIS_TDATA(14),
      I1 => SD_AXIS_TDATA(5),
      I2 => SD_AXIS_TDATA(15),
      I3 => SD_AXIS_TDATA(6),
      O => \ARG__59_carry__0_i_1_n_0\
    );
\ARG__59_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A00"
    )
        port map (
      I0 => SD_AXIS_TDATA(14),
      I1 => SD_AXIS_TDATA(4),
      I2 => SD_AXIS_TDATA(15),
      I3 => SD_AXIS_TDATA(5),
      O => \ARG__59_carry__0_i_2_n_0\
    );
\ARG__59_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A00"
    )
        port map (
      I0 => SD_AXIS_TDATA(14),
      I1 => SD_AXIS_TDATA(3),
      I2 => SD_AXIS_TDATA(15),
      I3 => SD_AXIS_TDATA(4),
      O => \ARG__59_carry__0_i_3_n_0\
    );
\ARG__59_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A00"
    )
        port map (
      I0 => SD_AXIS_TDATA(14),
      I1 => SD_AXIS_TDATA(2),
      I2 => SD_AXIS_TDATA(15),
      I3 => SD_AXIS_TDATA(3),
      O => \ARG__59_carry__0_i_4_n_0\
    );
\ARG__59_carry__0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4FB0C0C0"
    )
        port map (
      I0 => SD_AXIS_TDATA(5),
      I1 => SD_AXIS_TDATA(15),
      I2 => SD_AXIS_TDATA(6),
      I3 => SD_AXIS_TDATA(7),
      I4 => SD_AXIS_TDATA(14),
      O => \ARG__59_carry__0_i_5_n_0\
    );
\ARG__59_carry__0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8C733F3F"
    )
        port map (
      I0 => SD_AXIS_TDATA(4),
      I1 => SD_AXIS_TDATA(5),
      I2 => SD_AXIS_TDATA(15),
      I3 => SD_AXIS_TDATA(6),
      I4 => SD_AXIS_TDATA(14),
      O => \ARG__59_carry__0_i_6_n_0\
    );
\ARG__59_carry__0_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8C733F3F"
    )
        port map (
      I0 => SD_AXIS_TDATA(3),
      I1 => SD_AXIS_TDATA(4),
      I2 => SD_AXIS_TDATA(15),
      I3 => SD_AXIS_TDATA(5),
      I4 => SD_AXIS_TDATA(14),
      O => \ARG__59_carry__0_i_7_n_0\
    );
\ARG__59_carry__0_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8C733F3F"
    )
        port map (
      I0 => SD_AXIS_TDATA(2),
      I1 => SD_AXIS_TDATA(3),
      I2 => SD_AXIS_TDATA(15),
      I3 => SD_AXIS_TDATA(4),
      I4 => SD_AXIS_TDATA(14),
      O => \ARG__59_carry__0_i_8_n_0\
    );
\ARG__59_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG__59_carry__0_n_0\,
      CO(3 downto 1) => \NLW_ARG__59_carry__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \ARG__59_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \ARG__59_carry__1_i_1_n_0\,
      O(3 downto 2) => \NLW_ARG__59_carry__1_O_UNCONNECTED\(3 downto 2),
      O(1) => \ARG__59_carry__1_n_6\,
      O(0) => \ARG__59_carry__1_n_7\,
      S(3 downto 1) => B"001",
      S(0) => \ARG__59_carry__1_i_2_n_0\
    );
\ARG__59_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0777"
    )
        port map (
      I0 => SD_AXIS_TDATA(14),
      I1 => SD_AXIS_TDATA(7),
      I2 => SD_AXIS_TDATA(15),
      I3 => SD_AXIS_TDATA(6),
      O => \ARG__59_carry__1_i_1_n_0\
    );
\ARG__59_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E53F"
    )
        port map (
      I0 => SD_AXIS_TDATA(6),
      I1 => SD_AXIS_TDATA(14),
      I2 => SD_AXIS_TDATA(7),
      I3 => SD_AXIS_TDATA(15),
      O => \ARG__59_carry__1_i_2_n_0\
    );
\ARG__59_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => SD_AXIS_TDATA(15),
      I1 => SD_AXIS_TDATA(1),
      O => \ARG__59_carry_i_1_n_0\
    );
\ARG__59_carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA(1),
      I1 => SD_AXIS_TDATA(15),
      O => \ARG__59_carry_i_2_n_0\
    );
\ARG__59_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => SD_AXIS_TDATA(0),
      I1 => SD_AXIS_TDATA(15),
      O => \ARG__59_carry_i_3_n_0\
    );
\ARG__59_carry_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9F606060"
    )
        port map (
      I0 => SD_AXIS_TDATA(1),
      I1 => SD_AXIS_TDATA(2),
      I2 => SD_AXIS_TDATA(15),
      I3 => SD_AXIS_TDATA(3),
      I4 => SD_AXIS_TDATA(14),
      O => \ARG__59_carry_i_4_n_0\
    );
\ARG__59_carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA(15),
      I1 => SD_AXIS_TDATA(1),
      I2 => SD_AXIS_TDATA(2),
      I3 => SD_AXIS_TDATA(14),
      O => \ARG__59_carry_i_5_n_0\
    );
\ARG__59_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8777"
    )
        port map (
      I0 => SD_AXIS_TDATA(15),
      I1 => SD_AXIS_TDATA(0),
      I2 => SD_AXIS_TDATA(1),
      I3 => SD_AXIS_TDATA(14),
      O => \ARG__59_carry_i_6_n_0\
    );
\ARG__59_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA(0),
      I1 => SD_AXIS_TDATA(14),
      O => \ARG__59_carry_i_7_n_0\
    );
\ARG__86_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ARG__86_carry_n_0\,
      CO(2) => \ARG__86_carry_n_1\,
      CO(1) => \ARG__86_carry_n_2\,
      CO(0) => \ARG__86_carry_n_3\,
      CYINIT => '0',
      DI(3) => \ARG__86_carry_i_1_n_0\,
      DI(2) => \ARG__86_carry_i_2_n_0\,
      DI(1) => \ARG__86_carry_i_3_n_0\,
      DI(0) => '0',
      O(3 downto 0) => RESIZE(6 downto 3),
      S(3) => \ARG__86_carry_i_4_n_0\,
      S(2) => \ARG__86_carry_i_5_n_0\,
      S(1) => \ARG__86_carry_i_6_n_0\,
      S(0) => \ARG__86_carry_i_7_n_0\
    );
\ARG__86_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG__86_carry_n_0\,
      CO(3) => \ARG__86_carry__0_n_0\,
      CO(2) => \ARG__86_carry__0_n_1\,
      CO(1) => \ARG__86_carry__0_n_2\,
      CO(0) => \ARG__86_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \ARG__86_carry__0_i_1_n_0\,
      DI(2) => \ARG__86_carry__0_i_2_n_0\,
      DI(1) => \ARG__86_carry__0_i_3_n_0\,
      DI(0) => \ARG__86_carry__0_i_4_n_0\,
      O(3 downto 0) => RESIZE(10 downto 7),
      S(3) => \ARG__86_carry__0_i_5_n_0\,
      S(2) => \ARG__86_carry__0_i_6_n_0\,
      S(1) => \ARG__86_carry__0_i_7_n_0\,
      S(0) => \ARG__86_carry__0_i_8_n_0\
    );
\ARG__86_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \ARG__0_carry__1_n_6\,
      I1 => \ARG__30_carry__0_n_5\,
      I2 => \ARG__59_carry_n_4\,
      O => \ARG__86_carry__0_i_1_n_0\
    );
\ARG__86_carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \ARG__0_carry__1_n_7\,
      I1 => \ARG__30_carry__0_n_6\,
      I2 => \ARG__59_carry_n_5\,
      O => \ARG__86_carry__0_i_2_n_0\
    );
\ARG__86_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \ARG__0_carry__0_n_4\,
      I1 => \ARG__30_carry__0_n_7\,
      I2 => \ARG__59_carry_n_6\,
      O => \ARG__86_carry__0_i_3_n_0\
    );
\ARG__86_carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \ARG__0_carry__0_n_5\,
      I1 => \ARG__30_carry_n_4\,
      I2 => \ARG__59_carry_n_7\,
      O => \ARG__86_carry__0_i_4_n_0\
    );
\ARG__86_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \ARG__59_carry_n_4\,
      I1 => \ARG__30_carry__0_n_5\,
      I2 => \ARG__0_carry__1_n_6\,
      I3 => \ARG__0_carry__1_n_1\,
      I4 => \ARG__30_carry__0_n_4\,
      I5 => \ARG__59_carry__0_n_7\,
      O => \ARG__86_carry__0_i_5_n_0\
    );
\ARG__86_carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \ARG__59_carry_n_5\,
      I1 => \ARG__30_carry__0_n_6\,
      I2 => \ARG__0_carry__1_n_7\,
      I3 => \ARG__0_carry__1_n_6\,
      I4 => \ARG__30_carry__0_n_5\,
      I5 => \ARG__59_carry_n_4\,
      O => \ARG__86_carry__0_i_6_n_0\
    );
\ARG__86_carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \ARG__59_carry_n_6\,
      I1 => \ARG__30_carry__0_n_7\,
      I2 => \ARG__0_carry__0_n_4\,
      I3 => \ARG__0_carry__1_n_7\,
      I4 => \ARG__30_carry__0_n_6\,
      I5 => \ARG__59_carry_n_5\,
      O => \ARG__86_carry__0_i_7_n_0\
    );
\ARG__86_carry__0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \ARG__59_carry_n_7\,
      I1 => \ARG__30_carry_n_4\,
      I2 => \ARG__0_carry__0_n_5\,
      I3 => \ARG__0_carry__0_n_4\,
      I4 => \ARG__30_carry__0_n_7\,
      I5 => \ARG__59_carry_n_6\,
      O => \ARG__86_carry__0_i_8_n_0\
    );
\ARG__86_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG__86_carry__0_n_0\,
      CO(3) => \ARG__86_carry__1_n_0\,
      CO(2) => \ARG__86_carry__1_n_1\,
      CO(1) => \ARG__86_carry__1_n_2\,
      CO(0) => \ARG__86_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \ARG__59_carry__1_n_7\,
      DI(2) => \ARG__86_carry__1_i_1_n_0\,
      DI(1) => \ARG__86_carry__1_i_2_n_0\,
      DI(0) => \ARG__86_carry__1_i_3_n_0\,
      O(3 downto 0) => RESIZE(14 downto 11),
      S(3) => \ARG__86_carry__1_i_4_n_0\,
      S(2) => \ARG__86_carry__1_i_5_n_0\,
      S(1) => \ARG__86_carry__1_i_6_n_0\,
      S(0) => \ARG__86_carry__1_i_7_n_0\
    );
\ARG__86_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ARG__30_carry__1_n_6\,
      I1 => \ARG__59_carry__0_n_5\,
      O => \ARG__86_carry__1_i_1_n_0\
    );
\ARG__86_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ARG__30_carry__1_n_7\,
      I1 => \ARG__59_carry__0_n_6\,
      O => \ARG__86_carry__1_i_2_n_0\
    );
\ARG__86_carry__1_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \ARG__0_carry__1_n_1\,
      I1 => \ARG__30_carry__0_n_4\,
      I2 => \ARG__59_carry__0_n_7\,
      O => \ARG__86_carry__1_i_3_n_0\
    );
\ARG__86_carry__1_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \ARG__59_carry__0_n_4\,
      I1 => \ARG__30_carry__1_n_1\,
      I2 => \ARG__59_carry__1_n_7\,
      O => \ARG__86_carry__1_i_4_n_0\
    );
\ARG__86_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \ARG__59_carry__0_n_5\,
      I1 => \ARG__30_carry__1_n_6\,
      I2 => \ARG__30_carry__1_n_1\,
      I3 => \ARG__59_carry__0_n_4\,
      O => \ARG__86_carry__1_i_5_n_0\
    );
\ARG__86_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \ARG__59_carry__0_n_6\,
      I1 => \ARG__30_carry__1_n_7\,
      I2 => \ARG__30_carry__1_n_6\,
      I3 => \ARG__59_carry__0_n_5\,
      O => \ARG__86_carry__1_i_6_n_0\
    );
\ARG__86_carry__1_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E81717E8"
    )
        port map (
      I0 => \ARG__59_carry__0_n_7\,
      I1 => \ARG__30_carry__0_n_4\,
      I2 => \ARG__0_carry__1_n_1\,
      I3 => \ARG__30_carry__1_n_7\,
      I4 => \ARG__59_carry__0_n_6\,
      O => \ARG__86_carry__1_i_7_n_0\
    );
\ARG__86_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG__86_carry__1_n_0\,
      CO(3 downto 0) => \NLW_ARG__86_carry__2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_ARG__86_carry__2_O_UNCONNECTED\(3 downto 1),
      O(0) => p_0_in0,
      S(3 downto 1) => B"000",
      S(0) => \ARG__59_carry__1_n_6\
    );
\ARG__86_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ARG__0_carry__0_n_6\,
      I1 => \ARG__30_carry_n_5\,
      O => \ARG__86_carry_i_1_n_0\
    );
\ARG__86_carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ARG__0_carry__0_n_7\,
      I1 => \ARG__30_carry_n_6\,
      O => \ARG__86_carry_i_2_n_0\
    );
\ARG__86_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ARG__30_carry_n_7\,
      I1 => \ARG__0_carry_n_4\,
      O => \ARG__86_carry_i_3_n_0\
    );
\ARG__86_carry_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78878778"
    )
        port map (
      I0 => \ARG__30_carry_n_5\,
      I1 => \ARG__0_carry__0_n_6\,
      I2 => \ARG__0_carry__0_n_5\,
      I3 => \ARG__30_carry_n_4\,
      I4 => \ARG__59_carry_n_7\,
      O => \ARG__86_carry_i_4_n_0\
    );
\ARG__86_carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \ARG__30_carry_n_6\,
      I1 => \ARG__0_carry__0_n_7\,
      I2 => \ARG__0_carry__0_n_6\,
      I3 => \ARG__30_carry_n_5\,
      O => \ARG__86_carry_i_5_n_0\
    );
\ARG__86_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \ARG__0_carry_n_4\,
      I1 => \ARG__30_carry_n_7\,
      I2 => \ARG__0_carry__0_n_7\,
      I3 => \ARG__30_carry_n_6\,
      O => \ARG__86_carry_i_6_n_0\
    );
\ARG__86_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ARG__0_carry_n_4\,
      I1 => \ARG__30_carry_n_7\,
      O => \ARG__86_carry_i_7_n_0\
    );
\ARG_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ARG_inferred__0/i__carry_n_0\,
      CO(2) => \ARG_inferred__0/i__carry_n_1\,
      CO(1) => \ARG_inferred__0/i__carry_n_2\,
      CO(0) => \ARG_inferred__0/i__carry_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => accumulated_value(3 downto 0),
      O(3) => \ARG_inferred__0/i__carry_n_4\,
      O(2) => \ARG_inferred__0/i__carry_n_5\,
      O(1) => \ARG_inferred__0/i__carry_n_6\,
      O(0) => \ARG_inferred__0/i__carry_n_7\,
      S(3) => \i__carry_i_1_n_0\,
      S(2) => \i__carry_i_2_n_0\,
      S(1) => \i__carry_i_3_n_0\,
      S(0) => \i__carry_i_4_n_0\
    );
\ARG_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG_inferred__0/i__carry_n_0\,
      CO(3) => \ARG_inferred__0/i__carry__0_n_0\,
      CO(2) => \ARG_inferred__0/i__carry__0_n_1\,
      CO(1) => \ARG_inferred__0/i__carry__0_n_2\,
      CO(0) => \ARG_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => accumulated_value(7 downto 4),
      O(3) => \ARG_inferred__0/i__carry__0_n_4\,
      O(2) => \ARG_inferred__0/i__carry__0_n_5\,
      O(1) => \ARG_inferred__0/i__carry__0_n_6\,
      O(0) => \ARG_inferred__0/i__carry__0_n_7\,
      S(3) => \i__carry__0_i_1_n_0\,
      S(2) => \i__carry__0_i_2_n_0\,
      S(1) => \i__carry__0_i_3_n_0\,
      S(0) => \i__carry__0_i_4_n_0\
    );
\ARG_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG_inferred__0/i__carry__0_n_0\,
      CO(3) => \ARG_inferred__0/i__carry__1_n_0\,
      CO(2) => \ARG_inferred__0/i__carry__1_n_1\,
      CO(1) => \ARG_inferred__0/i__carry__1_n_2\,
      CO(0) => \ARG_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => accumulated_value(11 downto 8),
      O(3) => \ARG_inferred__0/i__carry__1_n_4\,
      O(2) => \ARG_inferred__0/i__carry__1_n_5\,
      O(1) => \ARG_inferred__0/i__carry__1_n_6\,
      O(0) => \ARG_inferred__0/i__carry__1_n_7\,
      S(3) => \i__carry__1_i_1_n_0\,
      S(2) => \i__carry__1_i_2_n_0\,
      S(1) => \i__carry__1_i_3_n_0\,
      S(0) => \i__carry__1_i_4_n_0\
    );
\ARG_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG_inferred__0/i__carry__1_n_0\,
      CO(3) => \ARG_inferred__0/i__carry__2_n_0\,
      CO(2) => \ARG_inferred__0/i__carry__2_n_1\,
      CO(1) => \ARG_inferred__0/i__carry__2_n_2\,
      CO(0) => \ARG_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3) => p_0_in0,
      DI(2 downto 0) => accumulated_value(14 downto 12),
      O(3) => \ARG_inferred__0/i__carry__2_n_4\,
      O(2) => \ARG_inferred__0/i__carry__2_n_5\,
      O(1) => \ARG_inferred__0/i__carry__2_n_6\,
      O(0) => \ARG_inferred__0/i__carry__2_n_7\,
      S(3) => \i__carry__2_i_1_n_0\,
      S(2) => \i__carry__2_i_2_n_0\,
      S(1) => \i__carry__2_i_3_n_0\,
      S(0) => \i__carry__2_i_4_n_0\
    );
\ARG_inferred__0/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG_inferred__0/i__carry__2_n_0\,
      CO(3) => \ARG_inferred__0/i__carry__3_n_0\,
      CO(2) => \ARG_inferred__0/i__carry__3_n_1\,
      CO(1) => \ARG_inferred__0/i__carry__3_n_2\,
      CO(0) => \ARG_inferred__0/i__carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => accumulated_value(18 downto 16),
      DI(0) => \i__carry__3_i_1_n_0\,
      O(3) => \ARG_inferred__0/i__carry__3_n_4\,
      O(2) => \ARG_inferred__0/i__carry__3_n_5\,
      O(1) => \ARG_inferred__0/i__carry__3_n_6\,
      O(0) => \ARG_inferred__0/i__carry__3_n_7\,
      S(3) => \i__carry__3_i_2_n_0\,
      S(2) => \i__carry__3_i_3_n_0\,
      S(1) => \i__carry__3_i_4_n_0\,
      S(0) => \i__carry__3_i_5_n_0\
    );
\ARG_inferred__0/i__carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG_inferred__0/i__carry__3_n_0\,
      CO(3) => \ARG_inferred__0/i__carry__4_n_0\,
      CO(2) => \ARG_inferred__0/i__carry__4_n_1\,
      CO(1) => \ARG_inferred__0/i__carry__4_n_2\,
      CO(0) => \ARG_inferred__0/i__carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => accumulated_value(22 downto 19),
      O(3) => \ARG_inferred__0/i__carry__4_n_4\,
      O(2) => \ARG_inferred__0/i__carry__4_n_5\,
      O(1) => \ARG_inferred__0/i__carry__4_n_6\,
      O(0) => \ARG_inferred__0/i__carry__4_n_7\,
      S(3) => \i__carry__4_i_1_n_0\,
      S(2) => \i__carry__4_i_2_n_0\,
      S(1) => \i__carry__4_i_3_n_0\,
      S(0) => \i__carry__4_i_4_n_0\
    );
\ARG_inferred__0/i__carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG_inferred__0/i__carry__4_n_0\,
      CO(3) => \ARG_inferred__0/i__carry__5_n_0\,
      CO(2) => \ARG_inferred__0/i__carry__5_n_1\,
      CO(1) => \ARG_inferred__0/i__carry__5_n_2\,
      CO(0) => \ARG_inferred__0/i__carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => accumulated_value(26 downto 23),
      O(3) => \ARG_inferred__0/i__carry__5_n_4\,
      O(2) => \ARG_inferred__0/i__carry__5_n_5\,
      O(1) => \ARG_inferred__0/i__carry__5_n_6\,
      O(0) => \ARG_inferred__0/i__carry__5_n_7\,
      S(3) => \i__carry__5_i_1_n_0\,
      S(2) => \i__carry__5_i_2_n_0\,
      S(1) => \i__carry__5_i_3_n_0\,
      S(0) => \i__carry__5_i_4_n_0\
    );
\ARG_inferred__0/i__carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \ARG_inferred__0/i__carry__5_n_0\,
      CO(3) => \NLW_ARG_inferred__0/i__carry__6_CO_UNCONNECTED\(3),
      CO(2) => \ARG_inferred__0/i__carry__6_n_1\,
      CO(1) => \ARG_inferred__0/i__carry__6_n_2\,
      CO(0) => \ARG_inferred__0/i__carry__6_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => accumulated_value(29 downto 27),
      O(3) => p_0_out0,
      O(2) => \ARG_inferred__0/i__carry__6_n_5\,
      O(1) => \ARG_inferred__0/i__carry__6_n_6\,
      O(0) => \ARG_inferred__0/i__carry__6_n_7\,
      S(3) => \i__carry__6_i_1_n_0\,
      S(2) => \i__carry__6_i_2_n_0\,
      S(1) => \i__carry__6_i_3_n_0\,
      S(0) => \i__carry__6_i_4_n_0\
    );
\MO_AXIS_TDATA[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => currentState(1),
      I1 => MO_AXIS_TREADY,
      I2 => currentState(0),
      I3 => ARESETN,
      O => MO_AXIS_TDATA0
    );
\MO_AXIS_TDATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(0),
      Q => MO_AXIS_TDATA(0),
      R => '0'
    );
\MO_AXIS_TDATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(10),
      Q => MO_AXIS_TDATA(10),
      R => '0'
    );
\MO_AXIS_TDATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(11),
      Q => MO_AXIS_TDATA(11),
      R => '0'
    );
\MO_AXIS_TDATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(12),
      Q => MO_AXIS_TDATA(12),
      R => '0'
    );
\MO_AXIS_TDATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(13),
      Q => MO_AXIS_TDATA(13),
      R => '0'
    );
\MO_AXIS_TDATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(14),
      Q => MO_AXIS_TDATA(14),
      R => '0'
    );
\MO_AXIS_TDATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(15),
      Q => MO_AXIS_TDATA(15),
      R => '0'
    );
\MO_AXIS_TDATA_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(16),
      Q => MO_AXIS_TDATA(16),
      R => '0'
    );
\MO_AXIS_TDATA_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(17),
      Q => MO_AXIS_TDATA(17),
      R => '0'
    );
\MO_AXIS_TDATA_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(18),
      Q => MO_AXIS_TDATA(18),
      R => '0'
    );
\MO_AXIS_TDATA_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(19),
      Q => MO_AXIS_TDATA(19),
      R => '0'
    );
\MO_AXIS_TDATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(1),
      Q => MO_AXIS_TDATA(1),
      R => '0'
    );
\MO_AXIS_TDATA_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(20),
      Q => MO_AXIS_TDATA(20),
      R => '0'
    );
\MO_AXIS_TDATA_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(21),
      Q => MO_AXIS_TDATA(21),
      R => '0'
    );
\MO_AXIS_TDATA_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(22),
      Q => MO_AXIS_TDATA(22),
      R => '0'
    );
\MO_AXIS_TDATA_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(23),
      Q => MO_AXIS_TDATA(23),
      R => '0'
    );
\MO_AXIS_TDATA_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(24),
      Q => MO_AXIS_TDATA(24),
      R => '0'
    );
\MO_AXIS_TDATA_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(25),
      Q => MO_AXIS_TDATA(25),
      R => '0'
    );
\MO_AXIS_TDATA_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(26),
      Q => MO_AXIS_TDATA(26),
      R => '0'
    );
\MO_AXIS_TDATA_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(27),
      Q => MO_AXIS_TDATA(27),
      R => '0'
    );
\MO_AXIS_TDATA_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(28),
      Q => MO_AXIS_TDATA(28),
      R => '0'
    );
\MO_AXIS_TDATA_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(29),
      Q => MO_AXIS_TDATA(29),
      R => '0'
    );
\MO_AXIS_TDATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(2),
      Q => MO_AXIS_TDATA(2),
      R => '0'
    );
\MO_AXIS_TDATA_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(30),
      Q => MO_AXIS_TDATA(30),
      R => '0'
    );
\MO_AXIS_TDATA_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(31),
      Q => MO_AXIS_TDATA(31),
      R => '0'
    );
\MO_AXIS_TDATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(3),
      Q => MO_AXIS_TDATA(3),
      R => '0'
    );
\MO_AXIS_TDATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(4),
      Q => MO_AXIS_TDATA(4),
      R => '0'
    );
\MO_AXIS_TDATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(5),
      Q => MO_AXIS_TDATA(5),
      R => '0'
    );
\MO_AXIS_TDATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(6),
      Q => MO_AXIS_TDATA(6),
      R => '0'
    );
\MO_AXIS_TDATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(7),
      Q => MO_AXIS_TDATA(7),
      R => '0'
    );
\MO_AXIS_TDATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(8),
      Q => MO_AXIS_TDATA(8),
      R => '0'
    );
\MO_AXIS_TDATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => MO_AXIS_TDATA0,
      D => accumulated_value(9),
      Q => MO_AXIS_TDATA(9),
      R => '0'
    );
MO_AXIS_TVALID_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C8FF0800"
    )
        port map (
      I0 => MO_AXIS_TREADY,
      I1 => currentState(1),
      I2 => currentState(0),
      I3 => ARESETN,
      I4 => \^mo_axis_tlast\,
      O => MO_AXIS_TVALID_i_1_n_0
    );
MO_AXIS_TVALID_reg: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => '1',
      D => MO_AXIS_TVALID_i_1_n_0,
      Q => \^mo_axis_tlast\,
      R => '0'
    );
SD_AXIS_TREADY_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF2F"
    )
        port map (
      I0 => MO_AXIS_TREADY,
      I1 => currentState(0),
      I2 => currentState(1),
      I3 => \^sd_axis_tready\,
      O => SD_AXIS_TREADY_i_1_n_0
    );
SD_AXIS_TREADY_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ARESETN,
      O => p_0_in
    );
SD_AXIS_TREADY_reg: unisim.vcomponents.FDPE
     port map (
      C => ACLK,
      CE => '1',
      D => SD_AXIS_TREADY_i_1_n_0,
      PRE => p_0_in,
      Q => \^sd_axis_tready\
    );
\accumulated_value[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(0),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(0),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry_n_7\,
      O => p_1_in(0)
    );
\accumulated_value[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(10),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(10),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__1_n_5\,
      O => p_1_in(10)
    );
\accumulated_value[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(11),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(11),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__1_n_4\,
      O => p_1_in(11)
    );
\accumulated_value[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(12),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(12),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__2_n_7\,
      O => p_1_in(12)
    );
\accumulated_value[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(13),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(13),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__2_n_6\,
      O => p_1_in(13)
    );
\accumulated_value[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(14),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(14),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__2_n_5\,
      O => p_1_in(14)
    );
\accumulated_value[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__2_n_4\,
      O => p_1_in(15)
    );
\accumulated_value[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__3_n_7\,
      O => p_1_in(16)
    );
\accumulated_value[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__3_n_6\,
      O => p_1_in(17)
    );
\accumulated_value[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__3_n_5\,
      O => p_1_in(18)
    );
\accumulated_value[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__3_n_4\,
      O => p_1_in(19)
    );
\accumulated_value[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(1),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(1),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry_n_6\,
      O => p_1_in(1)
    );
\accumulated_value[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__4_n_7\,
      O => p_1_in(20)
    );
\accumulated_value[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__4_n_6\,
      O => p_1_in(21)
    );
\accumulated_value[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__4_n_5\,
      O => p_1_in(22)
    );
\accumulated_value[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__4_n_4\,
      O => p_1_in(23)
    );
\accumulated_value[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__5_n_7\,
      O => p_1_in(24)
    );
\accumulated_value[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__5_n_6\,
      O => p_1_in(25)
    );
\accumulated_value[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__5_n_5\,
      O => p_1_in(26)
    );
\accumulated_value[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__5_n_4\,
      O => p_1_in(27)
    );
\accumulated_value[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__6_n_7\,
      O => p_1_in(28)
    );
\accumulated_value[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__6_n_6\,
      O => p_1_in(29)
    );
\accumulated_value[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(2),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(2),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry_n_5\,
      O => p_1_in(2)
    );
\accumulated_value[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__6_n_5\,
      O => p_1_in(30)
    );
\accumulated_value[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => MO_AXIS_TREADY,
      I1 => currentState(0),
      I2 => currentState(1),
      I3 => SD_AXIS_TVALID,
      O => accumulated_value_0
    );
\accumulated_value[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => p_0_in0,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(15),
      I4 => SD_AXIS_TUSER,
      I5 => p_0_out0,
      O => p_1_in(31)
    );
\accumulated_value[31]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => MO_AXIS_TREADY,
      I1 => SD_AXIS_TVALID,
      I2 => currentState(0),
      O => \accumulated_value[31]_i_3_n_0\
    );
\accumulated_value[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(3),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(3),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry_n_4\,
      O => p_1_in(3)
    );
\accumulated_value[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(4),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(4),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__0_n_7\,
      O => p_1_in(4)
    );
\accumulated_value[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(5),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(5),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__0_n_6\,
      O => p_1_in(5)
    );
\accumulated_value[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(6),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(6),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__0_n_5\,
      O => p_1_in(6)
    );
\accumulated_value[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(7),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(7),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__0_n_4\,
      O => p_1_in(7)
    );
\accumulated_value[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(8),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(8),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__1_n_7\,
      O => p_1_in(8)
    );
\accumulated_value[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF008F8FAF008080"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => RESIZE(9),
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA(9),
      I4 => SD_AXIS_TUSER,
      I5 => \ARG_inferred__0/i__carry__1_n_6\,
      O => p_1_in(9)
    );
\accumulated_value_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(0),
      Q => accumulated_value(0)
    );
\accumulated_value_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(10),
      Q => accumulated_value(10)
    );
\accumulated_value_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(11),
      Q => accumulated_value(11)
    );
\accumulated_value_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(12),
      Q => accumulated_value(12)
    );
\accumulated_value_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(13),
      Q => accumulated_value(13)
    );
\accumulated_value_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(14),
      Q => accumulated_value(14)
    );
\accumulated_value_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(15),
      Q => accumulated_value(15)
    );
\accumulated_value_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(16),
      Q => accumulated_value(16)
    );
\accumulated_value_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(17),
      Q => accumulated_value(17)
    );
\accumulated_value_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(18),
      Q => accumulated_value(18)
    );
\accumulated_value_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(19),
      Q => accumulated_value(19)
    );
\accumulated_value_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(1),
      Q => accumulated_value(1)
    );
\accumulated_value_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(20),
      Q => accumulated_value(20)
    );
\accumulated_value_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(21),
      Q => accumulated_value(21)
    );
\accumulated_value_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(22),
      Q => accumulated_value(22)
    );
\accumulated_value_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(23),
      Q => accumulated_value(23)
    );
\accumulated_value_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(24),
      Q => accumulated_value(24)
    );
\accumulated_value_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(25),
      Q => accumulated_value(25)
    );
\accumulated_value_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(26),
      Q => accumulated_value(26)
    );
\accumulated_value_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(27),
      Q => accumulated_value(27)
    );
\accumulated_value_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(28),
      Q => accumulated_value(28)
    );
\accumulated_value_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(29),
      Q => accumulated_value(29)
    );
\accumulated_value_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(2),
      Q => accumulated_value(2)
    );
\accumulated_value_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(30),
      Q => accumulated_value(30)
    );
\accumulated_value_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(31),
      Q => accumulated_value(31)
    );
\accumulated_value_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(3),
      Q => accumulated_value(3)
    );
\accumulated_value_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(4),
      Q => accumulated_value(4)
    );
\accumulated_value_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(5),
      Q => accumulated_value(5)
    );
\accumulated_value_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(6),
      Q => accumulated_value(6)
    );
\accumulated_value_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(7),
      Q => accumulated_value(7)
    );
\accumulated_value_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(8),
      Q => accumulated_value(8)
    );
\accumulated_value_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => accumulated_value_0,
      CLR => p_0_in,
      D => p_1_in(9),
      Q => accumulated_value(9)
    );
\currentState[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002F00"
    )
        port map (
      I0 => MO_AXIS_TREADY,
      I1 => currentState(0),
      I2 => currentState(1),
      I3 => SD_AXIS_TVALID,
      I4 => SD_AXIS_TLAST,
      O => nextState(0)
    );
\currentState[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F043F0704040404"
    )
        port map (
      I0 => MO_AXIS_TREADY,
      I1 => currentState(1),
      I2 => currentState(0),
      I3 => SD_AXIS_TVALID,
      I4 => outputOccurred,
      I5 => SD_AXIS_TLAST,
      O => nextState(1)
    );
\currentState_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      CLR => p_0_in,
      D => nextState(0),
      Q => currentState(0)
    );
\currentState_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      CLR => p_0_in,
      D => nextState(1),
      Q => currentState(1)
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(7),
      I1 => RESIZE(7),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(6),
      I1 => RESIZE(6),
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(5),
      I1 => RESIZE(5),
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(4),
      I1 => RESIZE(4),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(11),
      I1 => RESIZE(11),
      O => \i__carry__1_i_1_n_0\
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(10),
      I1 => RESIZE(10),
      O => \i__carry__1_i_2_n_0\
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(9),
      I1 => RESIZE(9),
      O => \i__carry__1_i_3_n_0\
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(8),
      I1 => RESIZE(8),
      O => \i__carry__1_i_4_n_0\
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_0_in0,
      I1 => accumulated_value(15),
      O => \i__carry__2_i_1_n_0\
    );
\i__carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(14),
      I1 => RESIZE(14),
      O => \i__carry__2_i_2_n_0\
    );
\i__carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(13),
      I1 => RESIZE(13),
      O => \i__carry__2_i_3_n_0\
    );
\i__carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(12),
      I1 => RESIZE(12),
      O => \i__carry__2_i_4_n_0\
    );
\i__carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in0,
      O => \i__carry__3_i_1_n_0\
    );
\i__carry__3_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(18),
      I1 => accumulated_value(19),
      O => \i__carry__3_i_2_n_0\
    );
\i__carry__3_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(17),
      I1 => accumulated_value(18),
      O => \i__carry__3_i_3_n_0\
    );
\i__carry__3_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(16),
      I1 => accumulated_value(17),
      O => \i__carry__3_i_4_n_0\
    );
\i__carry__3_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_0_in0,
      I1 => accumulated_value(16),
      O => \i__carry__3_i_5_n_0\
    );
\i__carry__4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(22),
      I1 => accumulated_value(23),
      O => \i__carry__4_i_1_n_0\
    );
\i__carry__4_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(21),
      I1 => accumulated_value(22),
      O => \i__carry__4_i_2_n_0\
    );
\i__carry__4_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(20),
      I1 => accumulated_value(21),
      O => \i__carry__4_i_3_n_0\
    );
\i__carry__4_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(19),
      I1 => accumulated_value(20),
      O => \i__carry__4_i_4_n_0\
    );
\i__carry__5_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(26),
      I1 => accumulated_value(27),
      O => \i__carry__5_i_1_n_0\
    );
\i__carry__5_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(25),
      I1 => accumulated_value(26),
      O => \i__carry__5_i_2_n_0\
    );
\i__carry__5_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(24),
      I1 => accumulated_value(25),
      O => \i__carry__5_i_3_n_0\
    );
\i__carry__5_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(23),
      I1 => accumulated_value(24),
      O => \i__carry__5_i_4_n_0\
    );
\i__carry__6_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(31),
      I1 => accumulated_value(30),
      O => \i__carry__6_i_1_n_0\
    );
\i__carry__6_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(29),
      I1 => accumulated_value(30),
      O => \i__carry__6_i_2_n_0\
    );
\i__carry__6_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(28),
      I1 => accumulated_value(29),
      O => \i__carry__6_i_3_n_0\
    );
\i__carry__6_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => accumulated_value(27),
      I1 => accumulated_value(28),
      O => \i__carry__6_i_4_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(3),
      I1 => RESIZE(3),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(2),
      I1 => RESIZE(2),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(1),
      I1 => RESIZE(1),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => accumulated_value(0),
      I1 => RESIZE(0),
      O => \i__carry_i_4_n_0\
    );
outputOccurred_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFBFFFF00500000"
    )
        port map (
      I0 => currentState(0),
      I1 => outputOccurred_i_2_n_0,
      I2 => currentState(1),
      I3 => outputOccurred_i_3_n_0,
      I4 => ARESETN,
      I5 => outputOccurred,
      O => outputOccurred_i_1_n_0
    );
outputOccurred_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => SD_AXIS_TVALID,
      I1 => SD_AXIS_TLAST,
      O => outputOccurred_i_2_n_0
    );
outputOccurred_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => SD_AXIS_TVALID,
      I1 => MO_AXIS_TREADY,
      O => outputOccurred_i_3_n_0
    );
outputOccurred_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => outputOccurred_i_1_n_0,
      Q => outputOccurred,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity staged_mac_bd_staged_mac_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    SD_AXIS_TREADY : out STD_LOGIC;
    SD_AXIS_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SD_AXIS_TLAST : in STD_LOGIC;
    SD_AXIS_TUSER : in STD_LOGIC;
    SD_AXIS_TVALID : in STD_LOGIC;
    SD_AXIS_TID : in STD_LOGIC_VECTOR ( 7 downto 0 );
    MO_AXIS_TVALID : out STD_LOGIC;
    MO_AXIS_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MO_AXIS_TLAST : out STD_LOGIC;
    MO_AXIS_TREADY : in STD_LOGIC;
    MO_AXIS_TID : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of staged_mac_bd_staged_mac_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of staged_mac_bd_staged_mac_0_0 : entity is "staged_mac_bd_staged_mac_0_0,staged_mac,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of staged_mac_bd_staged_mac_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of staged_mac_bd_staged_mac_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of staged_mac_bd_staged_mac_0_0 : entity is "staged_mac,Vivado 2020.1";
end staged_mac_bd_staged_mac_0_0;

architecture STRUCTURE of staged_mac_bd_staged_mac_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^mo_axis_tlast\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ACLK : signal is "xilinx.com:signal:clock:1.0 ACLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ACLK : signal is "XIL_INTERFACENAME ACLK, ASSOCIATED_BUSIF MO_AXIS:SD_AXIS, ASSOCIATED_RESET ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN staged_mac_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute sigis : string;
  attribute sigis of ACLK : signal is "Clk";
  attribute X_INTERFACE_INFO of ARESETN : signal is "xilinx.com:signal:reset:1.0 ARESETN RST";
  attribute X_INTERFACE_PARAMETER of ARESETN : signal is "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of MO_AXIS_TLAST : signal is "xilinx.com:interface:axis:1.0 MO_AXIS TLAST";
  attribute X_INTERFACE_INFO of MO_AXIS_TREADY : signal is "xilinx.com:interface:axis:1.0 MO_AXIS TREADY";
  attribute X_INTERFACE_INFO of MO_AXIS_TVALID : signal is "xilinx.com:interface:axis:1.0 MO_AXIS TVALID";
  attribute X_INTERFACE_INFO of SD_AXIS_TLAST : signal is "xilinx.com:interface:axis:1.0 SD_AXIS TLAST";
  attribute X_INTERFACE_INFO of SD_AXIS_TREADY : signal is "xilinx.com:interface:axis:1.0 SD_AXIS TREADY";
  attribute X_INTERFACE_INFO of SD_AXIS_TUSER : signal is "xilinx.com:interface:axis:1.0 SD_AXIS TUSER";
  attribute X_INTERFACE_INFO of SD_AXIS_TVALID : signal is "xilinx.com:interface:axis:1.0 SD_AXIS TVALID";
  attribute X_INTERFACE_INFO of MO_AXIS_TDATA : signal is "xilinx.com:interface:axis:1.0 MO_AXIS TDATA";
  attribute X_INTERFACE_INFO of MO_AXIS_TID : signal is "xilinx.com:interface:axis:1.0 MO_AXIS TID";
  attribute X_INTERFACE_PARAMETER of MO_AXIS_TID : signal is "XIL_INTERFACENAME MO_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN staged_mac_bd_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of SD_AXIS_TDATA : signal is "xilinx.com:interface:axis:1.0 SD_AXIS TDATA";
  attribute X_INTERFACE_INFO of SD_AXIS_TID : signal is "xilinx.com:interface:axis:1.0 SD_AXIS TID";
  attribute X_INTERFACE_PARAMETER of SD_AXIS_TID : signal is "XIL_INTERFACENAME SD_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN staged_mac_bd_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
begin
  MO_AXIS_TID(7) <= \<const0>\;
  MO_AXIS_TID(6) <= \<const0>\;
  MO_AXIS_TID(5) <= \<const0>\;
  MO_AXIS_TID(4) <= \<const0>\;
  MO_AXIS_TID(3) <= \<const0>\;
  MO_AXIS_TID(2) <= \<const0>\;
  MO_AXIS_TID(1) <= \<const0>\;
  MO_AXIS_TID(0) <= \<const0>\;
  MO_AXIS_TLAST <= \^mo_axis_tlast\;
  MO_AXIS_TVALID <= \^mo_axis_tlast\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.staged_mac_bd_staged_mac_0_0_staged_mac
     port map (
      ACLK => ACLK,
      ARESETN => ARESETN,
      MO_AXIS_TDATA(31 downto 0) => MO_AXIS_TDATA(31 downto 0),
      MO_AXIS_TLAST => \^mo_axis_tlast\,
      MO_AXIS_TREADY => MO_AXIS_TREADY,
      SD_AXIS_TDATA(15 downto 0) => SD_AXIS_TDATA(15 downto 0),
      SD_AXIS_TLAST => SD_AXIS_TLAST,
      SD_AXIS_TREADY => SD_AXIS_TREADY,
      SD_AXIS_TUSER => SD_AXIS_TUSER,
      SD_AXIS_TVALID => SD_AXIS_TVALID
    );
end STRUCTURE;
