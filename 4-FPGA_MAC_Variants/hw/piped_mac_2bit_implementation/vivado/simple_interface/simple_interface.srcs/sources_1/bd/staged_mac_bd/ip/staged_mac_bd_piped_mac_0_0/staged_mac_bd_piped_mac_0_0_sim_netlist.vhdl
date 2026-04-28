-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Mon Oct 27 18:12:20 2025
-- Host        : co2050-04.ece.iastate.edu running 64-bit unknown
-- Command     : write_vhdl -force -mode funcsim
--               /home/cam2022/CPRE-487_git/CPRE-4870/Lab4/hw/piped_mac_2bit_implementation/vivado/simple_interface/simple_interface.srcs/sources_1/bd/staged_mac_bd/ip/staged_mac_bd_piped_mac_0_0/staged_mac_bd_piped_mac_0_0_sim_netlist.vhdl
-- Design      : staged_mac_bd_piped_mac_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity staged_mac_bd_piped_mac_0_0_piped_mac is
  port (
    MO_AXIS_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MO_AXIS_TID : out STD_LOGIC_VECTOR ( 7 downto 0 );
    mo_tlast_reg_reg_0 : out STD_LOGIC;
    SD_AXIS_TREADY : out STD_LOGIC;
    ACLK : in STD_LOGIC;
    SD_AXIS_TID : in STD_LOGIC_VECTOR ( 7 downto 0 );
    MO_AXIS_TREADY : in STD_LOGIC;
    SD_AXIS_TVALID : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    SD_AXIS_TDATA : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SD_AXIS_TUSER : in STD_LOGIC;
    SD_AXIS_TLAST : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of staged_mac_bd_piped_mac_0_0_piped_mac : entity is "piped_mac";
end staged_mac_bd_piped_mac_0_0_piped_mac;

architecture STRUCTURE of staged_mac_bd_piped_mac_0_0_piped_mac is
  signal \_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \_carry__0_n_0\ : STD_LOGIC;
  signal \_carry__0_n_1\ : STD_LOGIC;
  signal \_carry__0_n_2\ : STD_LOGIC;
  signal \_carry__0_n_3\ : STD_LOGIC;
  signal \_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \_carry__1_n_0\ : STD_LOGIC;
  signal \_carry__1_n_1\ : STD_LOGIC;
  signal \_carry__1_n_2\ : STD_LOGIC;
  signal \_carry__1_n_3\ : STD_LOGIC;
  signal \_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \_carry__2_n_0\ : STD_LOGIC;
  signal \_carry__2_n_1\ : STD_LOGIC;
  signal \_carry__2_n_2\ : STD_LOGIC;
  signal \_carry__2_n_3\ : STD_LOGIC;
  signal \_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \_carry__3_i_5_n_0\ : STD_LOGIC;
  signal \_carry__3_i_6_n_0\ : STD_LOGIC;
  signal \_carry__3_i_7_n_0\ : STD_LOGIC;
  signal \_carry__3_i_8_n_0\ : STD_LOGIC;
  signal \_carry__3_n_0\ : STD_LOGIC;
  signal \_carry__3_n_1\ : STD_LOGIC;
  signal \_carry__3_n_2\ : STD_LOGIC;
  signal \_carry__3_n_3\ : STD_LOGIC;
  signal \_carry__4_i_1_n_0\ : STD_LOGIC;
  signal \_carry__4_i_2_n_0\ : STD_LOGIC;
  signal \_carry__4_i_3_n_0\ : STD_LOGIC;
  signal \_carry__4_i_4_n_0\ : STD_LOGIC;
  signal \_carry__4_i_5_n_0\ : STD_LOGIC;
  signal \_carry__4_i_6_n_0\ : STD_LOGIC;
  signal \_carry__4_i_7_n_0\ : STD_LOGIC;
  signal \_carry__4_i_8_n_0\ : STD_LOGIC;
  signal \_carry__4_n_0\ : STD_LOGIC;
  signal \_carry__4_n_1\ : STD_LOGIC;
  signal \_carry__4_n_2\ : STD_LOGIC;
  signal \_carry__4_n_3\ : STD_LOGIC;
  signal \_carry__5_i_1_n_0\ : STD_LOGIC;
  signal \_carry__5_i_2_n_0\ : STD_LOGIC;
  signal \_carry__5_i_3_n_0\ : STD_LOGIC;
  signal \_carry__5_i_4_n_0\ : STD_LOGIC;
  signal \_carry__5_i_5_n_0\ : STD_LOGIC;
  signal \_carry__5_i_6_n_0\ : STD_LOGIC;
  signal \_carry__5_i_7_n_0\ : STD_LOGIC;
  signal \_carry__5_i_8_n_0\ : STD_LOGIC;
  signal \_carry__5_n_0\ : STD_LOGIC;
  signal \_carry__5_n_1\ : STD_LOGIC;
  signal \_carry__5_n_2\ : STD_LOGIC;
  signal \_carry__5_n_3\ : STD_LOGIC;
  signal \_carry__6_i_1_n_0\ : STD_LOGIC;
  signal \_carry__6_i_2_n_0\ : STD_LOGIC;
  signal \_carry__6_i_3_n_0\ : STD_LOGIC;
  signal \_carry__6_i_4_n_0\ : STD_LOGIC;
  signal \_carry__6_i_5_n_0\ : STD_LOGIC;
  signal \_carry__6_i_6_n_0\ : STD_LOGIC;
  signal \_carry__6_i_7_n_0\ : STD_LOGIC;
  signal \_carry__6_n_1\ : STD_LOGIC;
  signal \_carry__6_n_2\ : STD_LOGIC;
  signal \_carry__6_n_3\ : STD_LOGIC;
  signal \_carry_i_1_n_0\ : STD_LOGIC;
  signal \_carry_i_2_n_0\ : STD_LOGIC;
  signal \_carry_i_3_n_0\ : STD_LOGIC;
  signal \_carry_i_4_n_0\ : STD_LOGIC;
  signal \_carry_n_0\ : STD_LOGIC;
  signal \_carry_n_1\ : STD_LOGIC;
  signal \_carry_n_2\ : STD_LOGIC;
  signal \_carry_n_3\ : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal mo_tdata_reg : STD_LOGIC;
  signal mo_tlast_reg_i_1_n_0 : STD_LOGIC;
  signal \^mo_tlast_reg_reg_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s1_product_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s1_tid_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s1_tlast_reg : STD_LOGIC;
  signal s1_tlast_reg3_out : STD_LOGIC;
  signal s1_tvalid_reg : STD_LOGIC;
  signal s1_tvalid_reg_i_1_n_0 : STD_LOGIC;
  signal s2_accum_active : STD_LOGIC;
  signal s2_accum_active1_out : STD_LOGIC;
  signal s2_accum_active_i_1_n_0 : STD_LOGIC;
  signal \s2_accumulated_value[0]_i_3_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[0]_i_4_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[0]_i_5_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[0]_i_6_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[12]_i_2_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[12]_i_3_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[12]_i_4_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[12]_i_5_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[16]_i_2_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[16]_i_3_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[16]_i_4_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[16]_i_5_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[20]_i_2_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[20]_i_3_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[20]_i_4_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[20]_i_5_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[24]_i_2_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[24]_i_3_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[24]_i_4_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[24]_i_5_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[28]_i_2_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[28]_i_3_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[28]_i_4_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[28]_i_5_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[4]_i_2_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[4]_i_3_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[4]_i_4_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[4]_i_5_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[8]_i_2_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[8]_i_3_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[8]_i_4_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value[8]_i_5_n_0\ : STD_LOGIC;
  signal s2_accumulated_value_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \s2_accumulated_value_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \NLW__carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_s2_accumulated_value_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of SD_AXIS_TREADY_INST_0 : label is "soft_lutpair2";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \_carry\ : label is 35;
  attribute ADDER_THRESHOLD of \_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \_carry__6\ : label is 35;
  attribute SOFT_HLUTNM of \s1_product_reg[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s1_product_reg[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s1_product_reg[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \s1_product_reg[3]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of s1_tvalid_reg_i_1 : label is "soft_lutpair2";
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[8]_i_1\ : label is 11;
begin
  mo_tlast_reg_reg_0 <= \^mo_tlast_reg_reg_0\;
SD_AXIS_TREADY_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => MO_AXIS_TREADY,
      I1 => \^mo_tlast_reg_reg_0\,
      O => SD_AXIS_TREADY
    );
\_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_carry_n_0\,
      CO(2) => \_carry_n_1\,
      CO(1) => \_carry_n_2\,
      CO(0) => \_carry_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => s1_product_reg(3 downto 0),
      O(3 downto 0) => p_0_in(3 downto 0),
      S(3) => \_carry_i_1_n_0\,
      S(2) => \_carry_i_2_n_0\,
      S(1) => \_carry_i_3_n_0\,
      S(0) => \_carry_i_4_n_0\
    );
\_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_carry_n_0\,
      CO(3) => \_carry__0_n_0\,
      CO(2) => \_carry__0_n_1\,
      CO(1) => \_carry__0_n_2\,
      CO(0) => \_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \_carry__0_i_1_n_0\,
      DI(2) => \_carry__0_i_2_n_0\,
      DI(1) => \_carry__0_i_3_n_0\,
      DI(0) => \_carry__0_i_4_n_0\,
      O(3 downto 0) => p_0_in(7 downto 4),
      S(3) => \_carry__0_i_5_n_0\,
      S(2) => \_carry__0_i_6_n_0\,
      S(1) => \_carry__0_i_7_n_0\,
      S(0) => \_carry__0_i_8_n_0\
    );
\_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(6),
      I1 => s2_accum_active,
      O => \_carry__0_i_1_n_0\
    );
\_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(5),
      I1 => s2_accum_active,
      O => \_carry__0_i_2_n_0\
    );
\_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(4),
      I1 => s2_accum_active,
      O => \_carry__0_i_3_n_0\
    );
\_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s1_product_reg(3),
      O => \_carry__0_i_4_n_0\
    );
\_carry__0_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(6),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(7),
      O => \_carry__0_i_5_n_0\
    );
\_carry__0_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(5),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(6),
      O => \_carry__0_i_6_n_0\
    );
\_carry__0_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(4),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(5),
      O => \_carry__0_i_7_n_0\
    );
\_carry__0_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(4),
      O => \_carry__0_i_8_n_0\
    );
\_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_carry__0_n_0\,
      CO(3) => \_carry__1_n_0\,
      CO(2) => \_carry__1_n_1\,
      CO(1) => \_carry__1_n_2\,
      CO(0) => \_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \_carry__1_i_1_n_0\,
      DI(2) => \_carry__1_i_2_n_0\,
      DI(1) => \_carry__1_i_3_n_0\,
      DI(0) => \_carry__1_i_4_n_0\,
      O(3 downto 0) => p_0_in(11 downto 8),
      S(3) => \_carry__1_i_5_n_0\,
      S(2) => \_carry__1_i_6_n_0\,
      S(1) => \_carry__1_i_7_n_0\,
      S(0) => \_carry__1_i_8_n_0\
    );
\_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(10),
      I1 => s2_accum_active,
      O => \_carry__1_i_1_n_0\
    );
\_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(9),
      I1 => s2_accum_active,
      O => \_carry__1_i_2_n_0\
    );
\_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(8),
      I1 => s2_accum_active,
      O => \_carry__1_i_3_n_0\
    );
\_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(7),
      I1 => s2_accum_active,
      O => \_carry__1_i_4_n_0\
    );
\_carry__1_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(10),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(11),
      O => \_carry__1_i_5_n_0\
    );
\_carry__1_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(9),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(10),
      O => \_carry__1_i_6_n_0\
    );
\_carry__1_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(8),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(9),
      O => \_carry__1_i_7_n_0\
    );
\_carry__1_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(7),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(8),
      O => \_carry__1_i_8_n_0\
    );
\_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \_carry__1_n_0\,
      CO(3) => \_carry__2_n_0\,
      CO(2) => \_carry__2_n_1\,
      CO(1) => \_carry__2_n_2\,
      CO(0) => \_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \_carry__2_i_1_n_0\,
      DI(2) => \_carry__2_i_2_n_0\,
      DI(1) => \_carry__2_i_3_n_0\,
      DI(0) => \_carry__2_i_4_n_0\,
      O(3 downto 0) => p_0_in(15 downto 12),
      S(3) => \_carry__2_i_5_n_0\,
      S(2) => \_carry__2_i_6_n_0\,
      S(1) => \_carry__2_i_7_n_0\,
      S(0) => \_carry__2_i_8_n_0\
    );
\_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(14),
      I1 => s2_accum_active,
      O => \_carry__2_i_1_n_0\
    );
\_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(13),
      I1 => s2_accum_active,
      O => \_carry__2_i_2_n_0\
    );
\_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(12),
      I1 => s2_accum_active,
      O => \_carry__2_i_3_n_0\
    );
\_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(11),
      I1 => s2_accum_active,
      O => \_carry__2_i_4_n_0\
    );
\_carry__2_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(14),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(15),
      O => \_carry__2_i_5_n_0\
    );
\_carry__2_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(13),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(14),
      O => \_carry__2_i_6_n_0\
    );
\_carry__2_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(12),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(13),
      O => \_carry__2_i_7_n_0\
    );
\_carry__2_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(11),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(12),
      O => \_carry__2_i_8_n_0\
    );
\_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \_carry__2_n_0\,
      CO(3) => \_carry__3_n_0\,
      CO(2) => \_carry__3_n_1\,
      CO(1) => \_carry__3_n_2\,
      CO(0) => \_carry__3_n_3\,
      CYINIT => '0',
      DI(3) => \_carry__3_i_1_n_0\,
      DI(2) => \_carry__3_i_2_n_0\,
      DI(1) => \_carry__3_i_3_n_0\,
      DI(0) => \_carry__3_i_4_n_0\,
      O(3 downto 0) => p_0_in(19 downto 16),
      S(3) => \_carry__3_i_5_n_0\,
      S(2) => \_carry__3_i_6_n_0\,
      S(1) => \_carry__3_i_7_n_0\,
      S(0) => \_carry__3_i_8_n_0\
    );
\_carry__3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(18),
      I1 => s2_accum_active,
      O => \_carry__3_i_1_n_0\
    );
\_carry__3_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(17),
      I1 => s2_accum_active,
      O => \_carry__3_i_2_n_0\
    );
\_carry__3_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(16),
      I1 => s2_accum_active,
      O => \_carry__3_i_3_n_0\
    );
\_carry__3_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(15),
      I1 => s2_accum_active,
      O => \_carry__3_i_4_n_0\
    );
\_carry__3_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(18),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(19),
      O => \_carry__3_i_5_n_0\
    );
\_carry__3_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(17),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(18),
      O => \_carry__3_i_6_n_0\
    );
\_carry__3_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(16),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(17),
      O => \_carry__3_i_7_n_0\
    );
\_carry__3_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(15),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(16),
      O => \_carry__3_i_8_n_0\
    );
\_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \_carry__3_n_0\,
      CO(3) => \_carry__4_n_0\,
      CO(2) => \_carry__4_n_1\,
      CO(1) => \_carry__4_n_2\,
      CO(0) => \_carry__4_n_3\,
      CYINIT => '0',
      DI(3) => \_carry__4_i_1_n_0\,
      DI(2) => \_carry__4_i_2_n_0\,
      DI(1) => \_carry__4_i_3_n_0\,
      DI(0) => \_carry__4_i_4_n_0\,
      O(3 downto 0) => p_0_in(23 downto 20),
      S(3) => \_carry__4_i_5_n_0\,
      S(2) => \_carry__4_i_6_n_0\,
      S(1) => \_carry__4_i_7_n_0\,
      S(0) => \_carry__4_i_8_n_0\
    );
\_carry__4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(22),
      I1 => s2_accum_active,
      O => \_carry__4_i_1_n_0\
    );
\_carry__4_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(21),
      I1 => s2_accum_active,
      O => \_carry__4_i_2_n_0\
    );
\_carry__4_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(20),
      I1 => s2_accum_active,
      O => \_carry__4_i_3_n_0\
    );
\_carry__4_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(19),
      I1 => s2_accum_active,
      O => \_carry__4_i_4_n_0\
    );
\_carry__4_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(22),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(23),
      O => \_carry__4_i_5_n_0\
    );
\_carry__4_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(21),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(22),
      O => \_carry__4_i_6_n_0\
    );
\_carry__4_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(20),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(21),
      O => \_carry__4_i_7_n_0\
    );
\_carry__4_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(19),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(20),
      O => \_carry__4_i_8_n_0\
    );
\_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \_carry__4_n_0\,
      CO(3) => \_carry__5_n_0\,
      CO(2) => \_carry__5_n_1\,
      CO(1) => \_carry__5_n_2\,
      CO(0) => \_carry__5_n_3\,
      CYINIT => '0',
      DI(3) => \_carry__5_i_1_n_0\,
      DI(2) => \_carry__5_i_2_n_0\,
      DI(1) => \_carry__5_i_3_n_0\,
      DI(0) => \_carry__5_i_4_n_0\,
      O(3 downto 0) => p_0_in(27 downto 24),
      S(3) => \_carry__5_i_5_n_0\,
      S(2) => \_carry__5_i_6_n_0\,
      S(1) => \_carry__5_i_7_n_0\,
      S(0) => \_carry__5_i_8_n_0\
    );
\_carry__5_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(26),
      I1 => s2_accum_active,
      O => \_carry__5_i_1_n_0\
    );
\_carry__5_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(25),
      I1 => s2_accum_active,
      O => \_carry__5_i_2_n_0\
    );
\_carry__5_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(24),
      I1 => s2_accum_active,
      O => \_carry__5_i_3_n_0\
    );
\_carry__5_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(23),
      I1 => s2_accum_active,
      O => \_carry__5_i_4_n_0\
    );
\_carry__5_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(26),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(27),
      O => \_carry__5_i_5_n_0\
    );
\_carry__5_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(25),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(26),
      O => \_carry__5_i_6_n_0\
    );
\_carry__5_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(24),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(25),
      O => \_carry__5_i_7_n_0\
    );
\_carry__5_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(23),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(24),
      O => \_carry__5_i_8_n_0\
    );
\_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \_carry__5_n_0\,
      CO(3) => \NLW__carry__6_CO_UNCONNECTED\(3),
      CO(2) => \_carry__6_n_1\,
      CO(1) => \_carry__6_n_2\,
      CO(0) => \_carry__6_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \_carry__6_i_1_n_0\,
      DI(1) => \_carry__6_i_2_n_0\,
      DI(0) => \_carry__6_i_3_n_0\,
      O(3 downto 0) => p_0_in(31 downto 28),
      S(3) => \_carry__6_i_4_n_0\,
      S(2) => \_carry__6_i_5_n_0\,
      S(1) => \_carry__6_i_6_n_0\,
      S(0) => \_carry__6_i_7_n_0\
    );
\_carry__6_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(29),
      I1 => s2_accum_active,
      O => \_carry__6_i_1_n_0\
    );
\_carry__6_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(28),
      I1 => s2_accum_active,
      O => \_carry__6_i_2_n_0\
    );
\_carry__6_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(27),
      I1 => s2_accum_active,
      O => \_carry__6_i_3_n_0\
    );
\_carry__6_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(30),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(31),
      O => \_carry__6_i_4_n_0\
    );
\_carry__6_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(29),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(30),
      O => \_carry__6_i_5_n_0\
    );
\_carry__6_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(28),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(29),
      O => \_carry__6_i_6_n_0\
    );
\_carry__6_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(27),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(28),
      O => \_carry__6_i_7_n_0\
    );
\_carry_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(3),
      O => \_carry_i_1_n_0\
    );
\_carry_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => s2_accum_active,
      I1 => s2_accumulated_value_reg(2),
      I2 => s1_product_reg(2),
      O => \_carry_i_2_n_0\
    );
\_carry_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => s2_accum_active,
      I1 => s2_accumulated_value_reg(1),
      I2 => s1_product_reg(1),
      O => \_carry_i_3_n_0\
    );
\_carry_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => s2_accum_active,
      I1 => s2_accumulated_value_reg(0),
      I2 => s1_product_reg(0),
      O => \_carry_i_4_n_0\
    );
\mo_tdata_reg[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ARESETN,
      O => clear
    );
\mo_tdata_reg[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D000"
    )
        port map (
      I0 => \^mo_tlast_reg_reg_0\,
      I1 => MO_AXIS_TREADY,
      I2 => s1_tlast_reg,
      I3 => s1_tvalid_reg,
      O => mo_tdata_reg
    );
\mo_tdata_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(0),
      Q => MO_AXIS_TDATA(0),
      R => clear
    );
\mo_tdata_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(10),
      Q => MO_AXIS_TDATA(10),
      R => clear
    );
\mo_tdata_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(11),
      Q => MO_AXIS_TDATA(11),
      R => clear
    );
\mo_tdata_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(12),
      Q => MO_AXIS_TDATA(12),
      R => clear
    );
\mo_tdata_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(13),
      Q => MO_AXIS_TDATA(13),
      R => clear
    );
\mo_tdata_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(14),
      Q => MO_AXIS_TDATA(14),
      R => clear
    );
\mo_tdata_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(15),
      Q => MO_AXIS_TDATA(15),
      R => clear
    );
\mo_tdata_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(16),
      Q => MO_AXIS_TDATA(16),
      R => clear
    );
\mo_tdata_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(17),
      Q => MO_AXIS_TDATA(17),
      R => clear
    );
\mo_tdata_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(18),
      Q => MO_AXIS_TDATA(18),
      R => clear
    );
\mo_tdata_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(19),
      Q => MO_AXIS_TDATA(19),
      R => clear
    );
\mo_tdata_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(1),
      Q => MO_AXIS_TDATA(1),
      R => clear
    );
\mo_tdata_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(20),
      Q => MO_AXIS_TDATA(20),
      R => clear
    );
\mo_tdata_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(21),
      Q => MO_AXIS_TDATA(21),
      R => clear
    );
\mo_tdata_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(22),
      Q => MO_AXIS_TDATA(22),
      R => clear
    );
\mo_tdata_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(23),
      Q => MO_AXIS_TDATA(23),
      R => clear
    );
\mo_tdata_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(24),
      Q => MO_AXIS_TDATA(24),
      R => clear
    );
\mo_tdata_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(25),
      Q => MO_AXIS_TDATA(25),
      R => clear
    );
\mo_tdata_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(26),
      Q => MO_AXIS_TDATA(26),
      R => clear
    );
\mo_tdata_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(27),
      Q => MO_AXIS_TDATA(27),
      R => clear
    );
\mo_tdata_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(28),
      Q => MO_AXIS_TDATA(28),
      R => clear
    );
\mo_tdata_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(29),
      Q => MO_AXIS_TDATA(29),
      R => clear
    );
\mo_tdata_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(2),
      Q => MO_AXIS_TDATA(2),
      R => clear
    );
\mo_tdata_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(30),
      Q => MO_AXIS_TDATA(30),
      R => clear
    );
\mo_tdata_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(31),
      Q => MO_AXIS_TDATA(31),
      R => clear
    );
\mo_tdata_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(3),
      Q => MO_AXIS_TDATA(3),
      R => clear
    );
\mo_tdata_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(4),
      Q => MO_AXIS_TDATA(4),
      R => clear
    );
\mo_tdata_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(5),
      Q => MO_AXIS_TDATA(5),
      R => clear
    );
\mo_tdata_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(6),
      Q => MO_AXIS_TDATA(6),
      R => clear
    );
\mo_tdata_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(7),
      Q => MO_AXIS_TDATA(7),
      R => clear
    );
\mo_tdata_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(8),
      Q => MO_AXIS_TDATA(8),
      R => clear
    );
\mo_tdata_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => p_0_in(9),
      Q => MO_AXIS_TDATA(9),
      R => clear
    );
\mo_tid_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => s1_tid_reg(0),
      Q => MO_AXIS_TID(0),
      R => clear
    );
\mo_tid_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => s1_tid_reg(1),
      Q => MO_AXIS_TID(1),
      R => clear
    );
\mo_tid_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => s1_tid_reg(2),
      Q => MO_AXIS_TID(2),
      R => clear
    );
\mo_tid_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => s1_tid_reg(3),
      Q => MO_AXIS_TID(3),
      R => clear
    );
\mo_tid_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => s1_tid_reg(4),
      Q => MO_AXIS_TID(4),
      R => clear
    );
\mo_tid_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => s1_tid_reg(5),
      Q => MO_AXIS_TID(5),
      R => clear
    );
\mo_tid_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => s1_tid_reg(6),
      Q => MO_AXIS_TID(6),
      R => clear
    );
\mo_tid_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => mo_tdata_reg,
      D => s1_tid_reg(7),
      Q => MO_AXIS_TID(7),
      R => clear
    );
mo_tlast_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CF880000"
    )
        port map (
      I0 => s1_tlast_reg,
      I1 => s1_tvalid_reg,
      I2 => MO_AXIS_TREADY,
      I3 => \^mo_tlast_reg_reg_0\,
      I4 => ARESETN,
      O => mo_tlast_reg_i_1_n_0
    );
mo_tlast_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => mo_tlast_reg_i_1_n_0,
      Q => \^mo_tlast_reg_reg_0\,
      R => '0'
    );
\s1_product_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => SD_AXIS_TDATA(0),
      I1 => SD_AXIS_TDATA(2),
      I2 => SD_AXIS_TUSER,
      O => p_1_in(0)
    );
\s1_product_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCC7888"
    )
        port map (
      I0 => SD_AXIS_TDATA(2),
      I1 => SD_AXIS_TDATA(1),
      I2 => SD_AXIS_TDATA(3),
      I3 => SD_AXIS_TDATA(0),
      I4 => SD_AXIS_TUSER,
      O => p_1_in(1)
    );
\s1_product_reg[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA1AC0"
    )
        port map (
      I0 => SD_AXIS_TDATA(2),
      I1 => SD_AXIS_TDATA(0),
      I2 => SD_AXIS_TDATA(3),
      I3 => SD_AXIS_TDATA(1),
      I4 => SD_AXIS_TUSER,
      O => p_1_in(2)
    );
\s1_product_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => \^mo_tlast_reg_reg_0\,
      I1 => MO_AXIS_TREADY,
      I2 => SD_AXIS_TVALID,
      O => s1_tlast_reg3_out
    );
\s1_product_reg[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F00AC0"
    )
        port map (
      I0 => SD_AXIS_TDATA(2),
      I1 => SD_AXIS_TDATA(0),
      I2 => SD_AXIS_TDATA(3),
      I3 => SD_AXIS_TDATA(1),
      I4 => SD_AXIS_TUSER,
      O => p_1_in(3)
    );
\s1_product_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => p_1_in(0),
      Q => s1_product_reg(0),
      R => clear
    );
\s1_product_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => p_1_in(1),
      Q => s1_product_reg(1),
      R => clear
    );
\s1_product_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => p_1_in(2),
      Q => s1_product_reg(2),
      R => clear
    );
\s1_product_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => p_1_in(3),
      Q => s1_product_reg(3),
      R => clear
    );
\s1_tid_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID(0),
      Q => s1_tid_reg(0),
      R => clear
    );
\s1_tid_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID(1),
      Q => s1_tid_reg(1),
      R => clear
    );
\s1_tid_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID(2),
      Q => s1_tid_reg(2),
      R => clear
    );
\s1_tid_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID(3),
      Q => s1_tid_reg(3),
      R => clear
    );
\s1_tid_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID(4),
      Q => s1_tid_reg(4),
      R => clear
    );
\s1_tid_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID(5),
      Q => s1_tid_reg(5),
      R => clear
    );
\s1_tid_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID(6),
      Q => s1_tid_reg(6),
      R => clear
    );
\s1_tid_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID(7),
      Q => s1_tid_reg(7),
      R => clear
    );
s1_tlast_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TLAST,
      Q => s1_tlast_reg,
      R => clear
    );
s1_tvalid_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FB080000"
    )
        port map (
      I0 => s1_tvalid_reg,
      I1 => \^mo_tlast_reg_reg_0\,
      I2 => MO_AXIS_TREADY,
      I3 => SD_AXIS_TVALID,
      I4 => ARESETN,
      O => s1_tvalid_reg_i_1_n_0
    );
s1_tvalid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => s1_tvalid_reg_i_1_n_0,
      Q => s1_tvalid_reg,
      R => '0'
    );
s2_accum_active_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080CC8C88888888"
    )
        port map (
      I0 => s2_accum_active,
      I1 => ARESETN,
      I2 => \^mo_tlast_reg_reg_0\,
      I3 => MO_AXIS_TREADY,
      I4 => s1_tlast_reg,
      I5 => s1_tvalid_reg,
      O => s2_accum_active_i_1_n_0
    );
s2_accum_active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => s2_accum_active_i_1_n_0,
      Q => s2_accum_active,
      R => '0'
    );
\s2_accumulated_value[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => \^mo_tlast_reg_reg_0\,
      I1 => MO_AXIS_TREADY,
      I2 => s1_tvalid_reg,
      O => s2_accum_active1_out
    );
\s2_accumulated_value[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(3),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[0]_i_3_n_0\
    );
\s2_accumulated_value[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(2),
      I1 => s2_accumulated_value_reg(2),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[0]_i_4_n_0\
    );
\s2_accumulated_value[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(1),
      I1 => s2_accumulated_value_reg(1),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[0]_i_5_n_0\
    );
\s2_accumulated_value[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(0),
      I1 => s2_accumulated_value_reg(0),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[0]_i_6_n_0\
    );
\s2_accumulated_value[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(15),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[12]_i_2_n_0\
    );
\s2_accumulated_value[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(14),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[12]_i_3_n_0\
    );
\s2_accumulated_value[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(13),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[12]_i_4_n_0\
    );
\s2_accumulated_value[12]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(12),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[12]_i_5_n_0\
    );
\s2_accumulated_value[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(19),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[16]_i_2_n_0\
    );
\s2_accumulated_value[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(18),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[16]_i_3_n_0\
    );
\s2_accumulated_value[16]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(17),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[16]_i_4_n_0\
    );
\s2_accumulated_value[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(16),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[16]_i_5_n_0\
    );
\s2_accumulated_value[20]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(23),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[20]_i_2_n_0\
    );
\s2_accumulated_value[20]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(22),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[20]_i_3_n_0\
    );
\s2_accumulated_value[20]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(21),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[20]_i_4_n_0\
    );
\s2_accumulated_value[20]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(20),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[20]_i_5_n_0\
    );
\s2_accumulated_value[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(27),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[24]_i_2_n_0\
    );
\s2_accumulated_value[24]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(26),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[24]_i_3_n_0\
    );
\s2_accumulated_value[24]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(25),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[24]_i_4_n_0\
    );
\s2_accumulated_value[24]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(24),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[24]_i_5_n_0\
    );
\s2_accumulated_value[28]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(31),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[28]_i_2_n_0\
    );
\s2_accumulated_value[28]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(30),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[28]_i_3_n_0\
    );
\s2_accumulated_value[28]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(29),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[28]_i_4_n_0\
    );
\s2_accumulated_value[28]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(28),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[28]_i_5_n_0\
    );
\s2_accumulated_value[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(7),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[4]_i_2_n_0\
    );
\s2_accumulated_value[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(6),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[4]_i_3_n_0\
    );
\s2_accumulated_value[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(5),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[4]_i_4_n_0\
    );
\s2_accumulated_value[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(4),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[4]_i_5_n_0\
    );
\s2_accumulated_value[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(11),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[8]_i_2_n_0\
    );
\s2_accumulated_value[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(10),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[8]_i_3_n_0\
    );
\s2_accumulated_value[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(9),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[8]_i_4_n_0\
    );
\s2_accumulated_value[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => s1_product_reg(3),
      I1 => s2_accumulated_value_reg(8),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[8]_i_5_n_0\
    );
\s2_accumulated_value_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[0]_i_2_n_7\,
      Q => s2_accumulated_value_reg(0),
      R => clear
    );
\s2_accumulated_value_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \s2_accumulated_value_reg[0]_i_2_n_0\,
      CO(2) => \s2_accumulated_value_reg[0]_i_2_n_1\,
      CO(1) => \s2_accumulated_value_reg[0]_i_2_n_2\,
      CO(0) => \s2_accumulated_value_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => s1_product_reg(3 downto 0),
      O(3) => \s2_accumulated_value_reg[0]_i_2_n_4\,
      O(2) => \s2_accumulated_value_reg[0]_i_2_n_5\,
      O(1) => \s2_accumulated_value_reg[0]_i_2_n_6\,
      O(0) => \s2_accumulated_value_reg[0]_i_2_n_7\,
      S(3) => \s2_accumulated_value[0]_i_3_n_0\,
      S(2) => \s2_accumulated_value[0]_i_4_n_0\,
      S(1) => \s2_accumulated_value[0]_i_5_n_0\,
      S(0) => \s2_accumulated_value[0]_i_6_n_0\
    );
\s2_accumulated_value_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[8]_i_1_n_5\,
      Q => s2_accumulated_value_reg(10),
      R => clear
    );
\s2_accumulated_value_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[8]_i_1_n_4\,
      Q => s2_accumulated_value_reg(11),
      R => clear
    );
\s2_accumulated_value_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[12]_i_1_n_7\,
      Q => s2_accumulated_value_reg(12),
      R => clear
    );
\s2_accumulated_value_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[8]_i_1_n_0\,
      CO(3) => \s2_accumulated_value_reg[12]_i_1_n_0\,
      CO(2) => \s2_accumulated_value_reg[12]_i_1_n_1\,
      CO(1) => \s2_accumulated_value_reg[12]_i_1_n_2\,
      CO(0) => \s2_accumulated_value_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => s1_product_reg(3),
      DI(2) => s1_product_reg(3),
      DI(1) => s1_product_reg(3),
      DI(0) => s1_product_reg(3),
      O(3) => \s2_accumulated_value_reg[12]_i_1_n_4\,
      O(2) => \s2_accumulated_value_reg[12]_i_1_n_5\,
      O(1) => \s2_accumulated_value_reg[12]_i_1_n_6\,
      O(0) => \s2_accumulated_value_reg[12]_i_1_n_7\,
      S(3) => \s2_accumulated_value[12]_i_2_n_0\,
      S(2) => \s2_accumulated_value[12]_i_3_n_0\,
      S(1) => \s2_accumulated_value[12]_i_4_n_0\,
      S(0) => \s2_accumulated_value[12]_i_5_n_0\
    );
\s2_accumulated_value_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[12]_i_1_n_6\,
      Q => s2_accumulated_value_reg(13),
      R => clear
    );
\s2_accumulated_value_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[12]_i_1_n_5\,
      Q => s2_accumulated_value_reg(14),
      R => clear
    );
\s2_accumulated_value_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[12]_i_1_n_4\,
      Q => s2_accumulated_value_reg(15),
      R => clear
    );
\s2_accumulated_value_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[16]_i_1_n_7\,
      Q => s2_accumulated_value_reg(16),
      R => clear
    );
\s2_accumulated_value_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[12]_i_1_n_0\,
      CO(3) => \s2_accumulated_value_reg[16]_i_1_n_0\,
      CO(2) => \s2_accumulated_value_reg[16]_i_1_n_1\,
      CO(1) => \s2_accumulated_value_reg[16]_i_1_n_2\,
      CO(0) => \s2_accumulated_value_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => s1_product_reg(3),
      DI(2) => s1_product_reg(3),
      DI(1) => s1_product_reg(3),
      DI(0) => s1_product_reg(3),
      O(3) => \s2_accumulated_value_reg[16]_i_1_n_4\,
      O(2) => \s2_accumulated_value_reg[16]_i_1_n_5\,
      O(1) => \s2_accumulated_value_reg[16]_i_1_n_6\,
      O(0) => \s2_accumulated_value_reg[16]_i_1_n_7\,
      S(3) => \s2_accumulated_value[16]_i_2_n_0\,
      S(2) => \s2_accumulated_value[16]_i_3_n_0\,
      S(1) => \s2_accumulated_value[16]_i_4_n_0\,
      S(0) => \s2_accumulated_value[16]_i_5_n_0\
    );
\s2_accumulated_value_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[16]_i_1_n_6\,
      Q => s2_accumulated_value_reg(17),
      R => clear
    );
\s2_accumulated_value_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[16]_i_1_n_5\,
      Q => s2_accumulated_value_reg(18),
      R => clear
    );
\s2_accumulated_value_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[16]_i_1_n_4\,
      Q => s2_accumulated_value_reg(19),
      R => clear
    );
\s2_accumulated_value_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[0]_i_2_n_6\,
      Q => s2_accumulated_value_reg(1),
      R => clear
    );
\s2_accumulated_value_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[20]_i_1_n_7\,
      Q => s2_accumulated_value_reg(20),
      R => clear
    );
\s2_accumulated_value_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[16]_i_1_n_0\,
      CO(3) => \s2_accumulated_value_reg[20]_i_1_n_0\,
      CO(2) => \s2_accumulated_value_reg[20]_i_1_n_1\,
      CO(1) => \s2_accumulated_value_reg[20]_i_1_n_2\,
      CO(0) => \s2_accumulated_value_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => s1_product_reg(3),
      DI(2) => s1_product_reg(3),
      DI(1) => s1_product_reg(3),
      DI(0) => s1_product_reg(3),
      O(3) => \s2_accumulated_value_reg[20]_i_1_n_4\,
      O(2) => \s2_accumulated_value_reg[20]_i_1_n_5\,
      O(1) => \s2_accumulated_value_reg[20]_i_1_n_6\,
      O(0) => \s2_accumulated_value_reg[20]_i_1_n_7\,
      S(3) => \s2_accumulated_value[20]_i_2_n_0\,
      S(2) => \s2_accumulated_value[20]_i_3_n_0\,
      S(1) => \s2_accumulated_value[20]_i_4_n_0\,
      S(0) => \s2_accumulated_value[20]_i_5_n_0\
    );
\s2_accumulated_value_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[20]_i_1_n_6\,
      Q => s2_accumulated_value_reg(21),
      R => clear
    );
\s2_accumulated_value_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[20]_i_1_n_5\,
      Q => s2_accumulated_value_reg(22),
      R => clear
    );
\s2_accumulated_value_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[20]_i_1_n_4\,
      Q => s2_accumulated_value_reg(23),
      R => clear
    );
\s2_accumulated_value_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[24]_i_1_n_7\,
      Q => s2_accumulated_value_reg(24),
      R => clear
    );
\s2_accumulated_value_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[20]_i_1_n_0\,
      CO(3) => \s2_accumulated_value_reg[24]_i_1_n_0\,
      CO(2) => \s2_accumulated_value_reg[24]_i_1_n_1\,
      CO(1) => \s2_accumulated_value_reg[24]_i_1_n_2\,
      CO(0) => \s2_accumulated_value_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => s1_product_reg(3),
      DI(2) => s1_product_reg(3),
      DI(1) => s1_product_reg(3),
      DI(0) => s1_product_reg(3),
      O(3) => \s2_accumulated_value_reg[24]_i_1_n_4\,
      O(2) => \s2_accumulated_value_reg[24]_i_1_n_5\,
      O(1) => \s2_accumulated_value_reg[24]_i_1_n_6\,
      O(0) => \s2_accumulated_value_reg[24]_i_1_n_7\,
      S(3) => \s2_accumulated_value[24]_i_2_n_0\,
      S(2) => \s2_accumulated_value[24]_i_3_n_0\,
      S(1) => \s2_accumulated_value[24]_i_4_n_0\,
      S(0) => \s2_accumulated_value[24]_i_5_n_0\
    );
\s2_accumulated_value_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[24]_i_1_n_6\,
      Q => s2_accumulated_value_reg(25),
      R => clear
    );
\s2_accumulated_value_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[24]_i_1_n_5\,
      Q => s2_accumulated_value_reg(26),
      R => clear
    );
\s2_accumulated_value_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[24]_i_1_n_4\,
      Q => s2_accumulated_value_reg(27),
      R => clear
    );
\s2_accumulated_value_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[28]_i_1_n_7\,
      Q => s2_accumulated_value_reg(28),
      R => clear
    );
\s2_accumulated_value_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[24]_i_1_n_0\,
      CO(3) => \NLW_s2_accumulated_value_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \s2_accumulated_value_reg[28]_i_1_n_1\,
      CO(1) => \s2_accumulated_value_reg[28]_i_1_n_2\,
      CO(0) => \s2_accumulated_value_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => s1_product_reg(3),
      DI(1) => s1_product_reg(3),
      DI(0) => s1_product_reg(3),
      O(3) => \s2_accumulated_value_reg[28]_i_1_n_4\,
      O(2) => \s2_accumulated_value_reg[28]_i_1_n_5\,
      O(1) => \s2_accumulated_value_reg[28]_i_1_n_6\,
      O(0) => \s2_accumulated_value_reg[28]_i_1_n_7\,
      S(3) => \s2_accumulated_value[28]_i_2_n_0\,
      S(2) => \s2_accumulated_value[28]_i_3_n_0\,
      S(1) => \s2_accumulated_value[28]_i_4_n_0\,
      S(0) => \s2_accumulated_value[28]_i_5_n_0\
    );
\s2_accumulated_value_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[28]_i_1_n_6\,
      Q => s2_accumulated_value_reg(29),
      R => clear
    );
\s2_accumulated_value_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[0]_i_2_n_5\,
      Q => s2_accumulated_value_reg(2),
      R => clear
    );
\s2_accumulated_value_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[28]_i_1_n_5\,
      Q => s2_accumulated_value_reg(30),
      R => clear
    );
\s2_accumulated_value_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[28]_i_1_n_4\,
      Q => s2_accumulated_value_reg(31),
      R => clear
    );
\s2_accumulated_value_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[0]_i_2_n_4\,
      Q => s2_accumulated_value_reg(3),
      R => clear
    );
\s2_accumulated_value_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[4]_i_1_n_7\,
      Q => s2_accumulated_value_reg(4),
      R => clear
    );
\s2_accumulated_value_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[0]_i_2_n_0\,
      CO(3) => \s2_accumulated_value_reg[4]_i_1_n_0\,
      CO(2) => \s2_accumulated_value_reg[4]_i_1_n_1\,
      CO(1) => \s2_accumulated_value_reg[4]_i_1_n_2\,
      CO(0) => \s2_accumulated_value_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => s1_product_reg(3),
      DI(2) => s1_product_reg(3),
      DI(1) => s1_product_reg(3),
      DI(0) => s1_product_reg(3),
      O(3) => \s2_accumulated_value_reg[4]_i_1_n_4\,
      O(2) => \s2_accumulated_value_reg[4]_i_1_n_5\,
      O(1) => \s2_accumulated_value_reg[4]_i_1_n_6\,
      O(0) => \s2_accumulated_value_reg[4]_i_1_n_7\,
      S(3) => \s2_accumulated_value[4]_i_2_n_0\,
      S(2) => \s2_accumulated_value[4]_i_3_n_0\,
      S(1) => \s2_accumulated_value[4]_i_4_n_0\,
      S(0) => \s2_accumulated_value[4]_i_5_n_0\
    );
\s2_accumulated_value_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[4]_i_1_n_6\,
      Q => s2_accumulated_value_reg(5),
      R => clear
    );
\s2_accumulated_value_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[4]_i_1_n_5\,
      Q => s2_accumulated_value_reg(6),
      R => clear
    );
\s2_accumulated_value_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[4]_i_1_n_4\,
      Q => s2_accumulated_value_reg(7),
      R => clear
    );
\s2_accumulated_value_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[8]_i_1_n_7\,
      Q => s2_accumulated_value_reg(8),
      R => clear
    );
\s2_accumulated_value_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[4]_i_1_n_0\,
      CO(3) => \s2_accumulated_value_reg[8]_i_1_n_0\,
      CO(2) => \s2_accumulated_value_reg[8]_i_1_n_1\,
      CO(1) => \s2_accumulated_value_reg[8]_i_1_n_2\,
      CO(0) => \s2_accumulated_value_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => s1_product_reg(3),
      DI(2) => s1_product_reg(3),
      DI(1) => s1_product_reg(3),
      DI(0) => s1_product_reg(3),
      O(3) => \s2_accumulated_value_reg[8]_i_1_n_4\,
      O(2) => \s2_accumulated_value_reg[8]_i_1_n_5\,
      O(1) => \s2_accumulated_value_reg[8]_i_1_n_6\,
      O(0) => \s2_accumulated_value_reg[8]_i_1_n_7\,
      S(3) => \s2_accumulated_value[8]_i_2_n_0\,
      S(2) => \s2_accumulated_value[8]_i_3_n_0\,
      S(1) => \s2_accumulated_value[8]_i_4_n_0\,
      S(0) => \s2_accumulated_value[8]_i_5_n_0\
    );
\s2_accumulated_value_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[8]_i_1_n_6\,
      Q => s2_accumulated_value_reg(9),
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity staged_mac_bd_piped_mac_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    SD_AXIS_TREADY : out STD_LOGIC;
    SD_AXIS_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
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
  attribute NotValidForBitStream of staged_mac_bd_piped_mac_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of staged_mac_bd_piped_mac_0_0 : entity is "staged_mac_bd_piped_mac_0_0,piped_mac,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of staged_mac_bd_piped_mac_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of staged_mac_bd_piped_mac_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of staged_mac_bd_piped_mac_0_0 : entity is "piped_mac,Vivado 2020.1";
end staged_mac_bd_piped_mac_0_0;

architecture STRUCTURE of staged_mac_bd_piped_mac_0_0 is
  signal \^mo_axis_tvalid\ : STD_LOGIC;
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
  attribute X_INTERFACE_PARAMETER of SD_AXIS_TID : signal is "XIL_INTERFACENAME SD_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN staged_mac_bd_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
begin
  MO_AXIS_TLAST <= \^mo_axis_tvalid\;
  MO_AXIS_TVALID <= \^mo_axis_tvalid\;
inst: entity work.staged_mac_bd_piped_mac_0_0_piped_mac
     port map (
      ACLK => ACLK,
      ARESETN => ARESETN,
      MO_AXIS_TDATA(31 downto 0) => MO_AXIS_TDATA(31 downto 0),
      MO_AXIS_TID(7 downto 0) => MO_AXIS_TID(7 downto 0),
      MO_AXIS_TREADY => MO_AXIS_TREADY,
      SD_AXIS_TDATA(3 downto 0) => SD_AXIS_TDATA(3 downto 0),
      SD_AXIS_TID(7 downto 0) => SD_AXIS_TID(7 downto 0),
      SD_AXIS_TLAST => SD_AXIS_TLAST,
      SD_AXIS_TREADY => SD_AXIS_TREADY,
      SD_AXIS_TUSER => SD_AXIS_TUSER,
      SD_AXIS_TVALID => SD_AXIS_TVALID,
      mo_tlast_reg_reg_0 => \^mo_axis_tvalid\
    );
end STRUCTURE;
