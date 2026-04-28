-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Mon Oct 27 16:13:17 2025
-- Host        : co2050-04.ece.iastate.edu running 64-bit unknown
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/cam2022/CPRE-487_git/CPRE-4870/Lab4/hw/piped_mac_4bit/vivado/tc_piped_mac/tc_piped_mac.sim/sim_1/impl/func/xsim/piped_mac_func_impl.vhd
-- Design      : piped_mac
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity piped_mac is
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
  attribute NotValidForBitStream of piped_mac : entity is true;
  attribute C_DATA_WIDTH : integer;
  attribute C_DATA_WIDTH of piped_mac : entity is 4;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of piped_mac : entity is "621ff571";
end piped_mac;

architecture STRUCTURE of piped_mac is
  signal ACLK_IBUF : STD_LOGIC;
  signal ACLK_IBUF_BUFG : STD_LOGIC;
  signal ARESETN_IBUF : STD_LOGIC;
  signal MO_AXIS_TDATA_OBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MO_AXIS_TID_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MO_AXIS_TLAST_OBUF : STD_LOGIC;
  signal MO_AXIS_TREADY_IBUF : STD_LOGIC;
  signal SD_AXIS_TDATA_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal SD_AXIS_TID_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal SD_AXIS_TLAST_IBUF : STD_LOGIC;
  signal SD_AXIS_TREADY_OBUF : STD_LOGIC;
  signal SD_AXIS_TUSER_IBUF : STD_LOGIC;
  signal SD_AXIS_TVALID_IBUF : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \mo_tdata_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[11]_i_3_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[11]_i_4_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[11]_i_5_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[11]_i_6_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[11]_i_7_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[11]_i_8_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[11]_i_9_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[15]_i_2_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[15]_i_3_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[15]_i_4_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[15]_i_5_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[15]_i_6_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[15]_i_7_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[15]_i_8_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[15]_i_9_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[19]_i_2_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[19]_i_3_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[19]_i_4_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[19]_i_5_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[19]_i_6_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[19]_i_7_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[19]_i_8_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[19]_i_9_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[23]_i_2_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[23]_i_3_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[23]_i_4_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[23]_i_5_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[23]_i_6_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[23]_i_7_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[23]_i_8_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[23]_i_9_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[27]_i_2_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[27]_i_3_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[27]_i_4_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[27]_i_5_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[27]_i_6_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[27]_i_7_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[27]_i_8_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[27]_i_9_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[31]_i_3_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[31]_i_4_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[31]_i_5_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[31]_i_6_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[31]_i_7_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[31]_i_8_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[31]_i_9_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[7]_i_4_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg[7]_i_5_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \mo_tdata_reg_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal mo_tlast_reg_i_1_n_0 : STD_LOGIC;
  signal multiplied_value : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \s1_product_reg[5]_i_10_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_11_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_12_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_14_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_15_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_16_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_17_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_18_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_19_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_4_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_5_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_6_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_7_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_8_n_0\ : STD_LOGIC;
  signal \s1_product_reg[5]_i_9_n_0\ : STD_LOGIC;
  signal \s1_product_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \s1_product_reg[7]_i_4_n_0\ : STD_LOGIC;
  signal \s1_product_reg[7]_i_5_n_0\ : STD_LOGIC;
  signal \s1_product_reg[7]_i_6_n_0\ : STD_LOGIC;
  signal \s1_product_reg[7]_i_7_n_0\ : STD_LOGIC;
  signal \s1_product_reg[7]_i_8_n_0\ : STD_LOGIC;
  signal \s1_product_reg[7]_i_9_n_0\ : STD_LOGIC;
  signal \s1_product_reg_reg[5]_i_13_n_0\ : STD_LOGIC;
  signal \s1_product_reg_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \s1_product_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \s1_product_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \s1_product_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \s1_product_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \s1_product_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \s1_product_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \s1_product_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \s1_product_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal s1_tid_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s1_tlast_reg : STD_LOGIC;
  signal s1_tlast_reg3_out : STD_LOGIC;
  signal s1_tvalid_reg : STD_LOGIC;
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
  signal \s2_accumulated_value_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \s2_accumulated_value_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_mo_tdata_reg_reg[11]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_mo_tdata_reg_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_mo_tdata_reg_reg[19]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_mo_tdata_reg_reg[23]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_mo_tdata_reg_reg[27]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_mo_tdata_reg_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_mo_tdata_reg_reg[3]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_mo_tdata_reg_reg[7]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_s1_product_reg_reg[5]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_s1_product_reg_reg[7]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s1_product_reg_reg[7]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_s2_accumulated_value_reg[0]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_s2_accumulated_value_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_s2_accumulated_value_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_s2_accumulated_value_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_s2_accumulated_value_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_s2_accumulated_value_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s2_accumulated_value_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_s2_accumulated_value_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute sigis : string;
  attribute sigis of ACLK_IBUF_inst : label is "Clk";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \mo_tdata_reg_reg[11]_i_1\ : label is 35;
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \mo_tdata_reg_reg[11]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \mo_tdata_reg_reg[15]_i_1\ : label is 35;
  attribute OPT_MODIFIED of \mo_tdata_reg_reg[15]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \mo_tdata_reg_reg[19]_i_1\ : label is 35;
  attribute OPT_MODIFIED of \mo_tdata_reg_reg[19]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \mo_tdata_reg_reg[23]_i_1\ : label is 35;
  attribute OPT_MODIFIED of \mo_tdata_reg_reg[23]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \mo_tdata_reg_reg[27]_i_1\ : label is 35;
  attribute OPT_MODIFIED of \mo_tdata_reg_reg[27]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \mo_tdata_reg_reg[31]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \mo_tdata_reg_reg[31]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \mo_tdata_reg_reg[3]_i_1\ : label is 35;
  attribute OPT_MODIFIED of \mo_tdata_reg_reg[3]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \mo_tdata_reg_reg[7]_i_1\ : label is 35;
  attribute OPT_MODIFIED of \mo_tdata_reg_reg[7]_i_1\ : label is "SWEEP";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \s1_product_reg[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \s1_product_reg[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \s1_product_reg[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \s1_product_reg[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \s1_product_reg[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \s1_product_reg[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \s1_product_reg[6]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s1_product_reg[7]_i_1\ : label is "soft_lutpair1";
  attribute OPT_MODIFIED of \s1_product_reg_reg[5]_i_2\ : label is "PROPCONST SWEEP";
  attribute OPT_MODIFIED of \s1_product_reg_reg[7]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[0]_i_2\ : label is 11;
  attribute OPT_MODIFIED of \s2_accumulated_value_reg[0]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[12]_i_1\ : label is 11;
  attribute OPT_MODIFIED of \s2_accumulated_value_reg[12]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[16]_i_1\ : label is 11;
  attribute OPT_MODIFIED of \s2_accumulated_value_reg[16]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[20]_i_1\ : label is 11;
  attribute OPT_MODIFIED of \s2_accumulated_value_reg[20]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[24]_i_1\ : label is 11;
  attribute OPT_MODIFIED of \s2_accumulated_value_reg[24]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[28]_i_1\ : label is 11;
  attribute OPT_MODIFIED of \s2_accumulated_value_reg[28]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[4]_i_1\ : label is 11;
  attribute OPT_MODIFIED of \s2_accumulated_value_reg[4]_i_1\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \s2_accumulated_value_reg[8]_i_1\ : label is 11;
  attribute OPT_MODIFIED of \s2_accumulated_value_reg[8]_i_1\ : label is "SWEEP";
  attribute sigis of ACLK : signal is "Clk";
begin
ACLK_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => ACLK_IBUF,
      O => ACLK_IBUF_BUFG
    );
ACLK_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => ACLK,
      O => ACLK_IBUF
    );
ARESETN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => ARESETN,
      O => ARESETN_IBUF
    );
\MO_AXIS_TDATA_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(0),
      O => MO_AXIS_TDATA(0)
    );
\MO_AXIS_TDATA_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(10),
      O => MO_AXIS_TDATA(10)
    );
\MO_AXIS_TDATA_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(11),
      O => MO_AXIS_TDATA(11)
    );
\MO_AXIS_TDATA_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(12),
      O => MO_AXIS_TDATA(12)
    );
\MO_AXIS_TDATA_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(13),
      O => MO_AXIS_TDATA(13)
    );
\MO_AXIS_TDATA_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(14),
      O => MO_AXIS_TDATA(14)
    );
\MO_AXIS_TDATA_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(15),
      O => MO_AXIS_TDATA(15)
    );
\MO_AXIS_TDATA_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(16),
      O => MO_AXIS_TDATA(16)
    );
\MO_AXIS_TDATA_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(17),
      O => MO_AXIS_TDATA(17)
    );
\MO_AXIS_TDATA_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(18),
      O => MO_AXIS_TDATA(18)
    );
\MO_AXIS_TDATA_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(19),
      O => MO_AXIS_TDATA(19)
    );
\MO_AXIS_TDATA_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(1),
      O => MO_AXIS_TDATA(1)
    );
\MO_AXIS_TDATA_OBUF[20]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(20),
      O => MO_AXIS_TDATA(20)
    );
\MO_AXIS_TDATA_OBUF[21]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(21),
      O => MO_AXIS_TDATA(21)
    );
\MO_AXIS_TDATA_OBUF[22]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(22),
      O => MO_AXIS_TDATA(22)
    );
\MO_AXIS_TDATA_OBUF[23]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(23),
      O => MO_AXIS_TDATA(23)
    );
\MO_AXIS_TDATA_OBUF[24]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(24),
      O => MO_AXIS_TDATA(24)
    );
\MO_AXIS_TDATA_OBUF[25]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(25),
      O => MO_AXIS_TDATA(25)
    );
\MO_AXIS_TDATA_OBUF[26]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(26),
      O => MO_AXIS_TDATA(26)
    );
\MO_AXIS_TDATA_OBUF[27]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(27),
      O => MO_AXIS_TDATA(27)
    );
\MO_AXIS_TDATA_OBUF[28]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(28),
      O => MO_AXIS_TDATA(28)
    );
\MO_AXIS_TDATA_OBUF[29]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(29),
      O => MO_AXIS_TDATA(29)
    );
\MO_AXIS_TDATA_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(2),
      O => MO_AXIS_TDATA(2)
    );
\MO_AXIS_TDATA_OBUF[30]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(30),
      O => MO_AXIS_TDATA(30)
    );
\MO_AXIS_TDATA_OBUF[31]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(31),
      O => MO_AXIS_TDATA(31)
    );
\MO_AXIS_TDATA_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(3),
      O => MO_AXIS_TDATA(3)
    );
\MO_AXIS_TDATA_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(4),
      O => MO_AXIS_TDATA(4)
    );
\MO_AXIS_TDATA_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(5),
      O => MO_AXIS_TDATA(5)
    );
\MO_AXIS_TDATA_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(6),
      O => MO_AXIS_TDATA(6)
    );
\MO_AXIS_TDATA_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(7),
      O => MO_AXIS_TDATA(7)
    );
\MO_AXIS_TDATA_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(8),
      O => MO_AXIS_TDATA(8)
    );
\MO_AXIS_TDATA_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TDATA_OBUF(9),
      O => MO_AXIS_TDATA(9)
    );
\MO_AXIS_TID_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TID_OBUF(0),
      O => MO_AXIS_TID(0)
    );
\MO_AXIS_TID_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TID_OBUF(1),
      O => MO_AXIS_TID(1)
    );
\MO_AXIS_TID_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TID_OBUF(2),
      O => MO_AXIS_TID(2)
    );
\MO_AXIS_TID_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TID_OBUF(3),
      O => MO_AXIS_TID(3)
    );
\MO_AXIS_TID_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TID_OBUF(4),
      O => MO_AXIS_TID(4)
    );
\MO_AXIS_TID_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TID_OBUF(5),
      O => MO_AXIS_TID(5)
    );
\MO_AXIS_TID_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TID_OBUF(6),
      O => MO_AXIS_TID(6)
    );
\MO_AXIS_TID_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TID_OBUF(7),
      O => MO_AXIS_TID(7)
    );
MO_AXIS_TLAST_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TLAST_OBUF,
      O => MO_AXIS_TLAST
    );
MO_AXIS_TREADY_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => MO_AXIS_TREADY,
      O => MO_AXIS_TREADY_IBUF
    );
MO_AXIS_TVALID_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TLAST_OBUF,
      O => MO_AXIS_TVALID
    );
\SD_AXIS_TDATA_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(0),
      O => SD_AXIS_TDATA_IBUF(0)
    );
\SD_AXIS_TDATA_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(1),
      O => SD_AXIS_TDATA_IBUF(1)
    );
\SD_AXIS_TDATA_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(2),
      O => SD_AXIS_TDATA_IBUF(2)
    );
\SD_AXIS_TDATA_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(3),
      O => SD_AXIS_TDATA_IBUF(3)
    );
\SD_AXIS_TDATA_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(4),
      O => SD_AXIS_TDATA_IBUF(4)
    );
\SD_AXIS_TDATA_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(5),
      O => SD_AXIS_TDATA_IBUF(5)
    );
\SD_AXIS_TDATA_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(6),
      O => SD_AXIS_TDATA_IBUF(6)
    );
\SD_AXIS_TDATA_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(7),
      O => SD_AXIS_TDATA_IBUF(7)
    );
\SD_AXIS_TID_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TID(0),
      O => SD_AXIS_TID_IBUF(0)
    );
\SD_AXIS_TID_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TID(1),
      O => SD_AXIS_TID_IBUF(1)
    );
\SD_AXIS_TID_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TID(2),
      O => SD_AXIS_TID_IBUF(2)
    );
\SD_AXIS_TID_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TID(3),
      O => SD_AXIS_TID_IBUF(3)
    );
\SD_AXIS_TID_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TID(4),
      O => SD_AXIS_TID_IBUF(4)
    );
\SD_AXIS_TID_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TID(5),
      O => SD_AXIS_TID_IBUF(5)
    );
\SD_AXIS_TID_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TID(6),
      O => SD_AXIS_TID_IBUF(6)
    );
\SD_AXIS_TID_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TID(7),
      O => SD_AXIS_TID_IBUF(7)
    );
SD_AXIS_TLAST_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TLAST,
      O => SD_AXIS_TLAST_IBUF
    );
SD_AXIS_TREADY_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => SD_AXIS_TREADY_OBUF,
      O => SD_AXIS_TREADY
    );
SD_AXIS_TREADY_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => MO_AXIS_TREADY_IBUF,
      I1 => MO_AXIS_TLAST_OBUF,
      O => SD_AXIS_TREADY_OBUF
    );
SD_AXIS_TUSER_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TUSER,
      O => SD_AXIS_TUSER_IBUF
    );
SD_AXIS_TVALID_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TVALID,
      O => SD_AXIS_TVALID_IBUF
    );
\mo_tdata_reg[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(10),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[11]_i_2_n_0\
    );
\mo_tdata_reg[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(9),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[11]_i_3_n_0\
    );
\mo_tdata_reg[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(8),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[11]_i_4_n_0\
    );
\mo_tdata_reg[11]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      O => \mo_tdata_reg[11]_i_5_n_0\
    );
\mo_tdata_reg[11]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(10),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(11),
      O => \mo_tdata_reg[11]_i_6_n_0\
    );
\mo_tdata_reg[11]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(9),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(10),
      O => \mo_tdata_reg[11]_i_7_n_0\
    );
\mo_tdata_reg[11]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(8),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(9),
      O => \mo_tdata_reg[11]_i_8_n_0\
    );
\mo_tdata_reg[11]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(8),
      O => \mo_tdata_reg[11]_i_9_n_0\
    );
\mo_tdata_reg[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(14),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[15]_i_2_n_0\
    );
\mo_tdata_reg[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(13),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[15]_i_3_n_0\
    );
\mo_tdata_reg[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(12),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[15]_i_4_n_0\
    );
\mo_tdata_reg[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(11),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[15]_i_5_n_0\
    );
\mo_tdata_reg[15]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(14),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(15),
      O => \mo_tdata_reg[15]_i_6_n_0\
    );
\mo_tdata_reg[15]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(13),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(14),
      O => \mo_tdata_reg[15]_i_7_n_0\
    );
\mo_tdata_reg[15]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(12),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(13),
      O => \mo_tdata_reg[15]_i_8_n_0\
    );
\mo_tdata_reg[15]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(11),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(12),
      O => \mo_tdata_reg[15]_i_9_n_0\
    );
\mo_tdata_reg[19]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(18),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[19]_i_2_n_0\
    );
\mo_tdata_reg[19]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(17),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[19]_i_3_n_0\
    );
\mo_tdata_reg[19]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(16),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[19]_i_4_n_0\
    );
\mo_tdata_reg[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(15),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[19]_i_5_n_0\
    );
\mo_tdata_reg[19]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(18),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(19),
      O => \mo_tdata_reg[19]_i_6_n_0\
    );
\mo_tdata_reg[19]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(17),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(18),
      O => \mo_tdata_reg[19]_i_7_n_0\
    );
\mo_tdata_reg[19]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(16),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(17),
      O => \mo_tdata_reg[19]_i_8_n_0\
    );
\mo_tdata_reg[19]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(15),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(16),
      O => \mo_tdata_reg[19]_i_9_n_0\
    );
\mo_tdata_reg[23]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(22),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[23]_i_2_n_0\
    );
\mo_tdata_reg[23]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(21),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[23]_i_3_n_0\
    );
\mo_tdata_reg[23]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(20),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[23]_i_4_n_0\
    );
\mo_tdata_reg[23]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(19),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[23]_i_5_n_0\
    );
\mo_tdata_reg[23]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(22),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(23),
      O => \mo_tdata_reg[23]_i_6_n_0\
    );
\mo_tdata_reg[23]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(21),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(22),
      O => \mo_tdata_reg[23]_i_7_n_0\
    );
\mo_tdata_reg[23]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(20),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(21),
      O => \mo_tdata_reg[23]_i_8_n_0\
    );
\mo_tdata_reg[23]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(19),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(20),
      O => \mo_tdata_reg[23]_i_9_n_0\
    );
\mo_tdata_reg[27]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(26),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[27]_i_2_n_0\
    );
\mo_tdata_reg[27]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(25),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[27]_i_3_n_0\
    );
\mo_tdata_reg[27]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(24),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[27]_i_4_n_0\
    );
\mo_tdata_reg[27]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(23),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[27]_i_5_n_0\
    );
\mo_tdata_reg[27]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(26),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(27),
      O => \mo_tdata_reg[27]_i_6_n_0\
    );
\mo_tdata_reg[27]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(25),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(26),
      O => \mo_tdata_reg[27]_i_7_n_0\
    );
\mo_tdata_reg[27]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(24),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(25),
      O => \mo_tdata_reg[27]_i_8_n_0\
    );
\mo_tdata_reg[27]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(23),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(24),
      O => \mo_tdata_reg[27]_i_9_n_0\
    );
\mo_tdata_reg[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D000"
    )
        port map (
      I0 => MO_AXIS_TLAST_OBUF,
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => s1_tvalid_reg,
      I3 => s1_tlast_reg,
      O => \mo_tdata_reg[31]_i_1_n_0\
    );
\mo_tdata_reg[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(29),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[31]_i_3_n_0\
    );
\mo_tdata_reg[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(28),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[31]_i_4_n_0\
    );
\mo_tdata_reg[31]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s2_accumulated_value_reg(27),
      I1 => s2_accum_active,
      O => \mo_tdata_reg[31]_i_5_n_0\
    );
\mo_tdata_reg[31]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(30),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(31),
      O => \mo_tdata_reg[31]_i_6_n_0\
    );
\mo_tdata_reg[31]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(29),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(30),
      O => \mo_tdata_reg[31]_i_7_n_0\
    );
\mo_tdata_reg[31]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(28),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(29),
      O => \mo_tdata_reg[31]_i_8_n_0\
    );
\mo_tdata_reg[31]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => s2_accumulated_value_reg(27),
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(28),
      O => \mo_tdata_reg[31]_i_9_n_0\
    );
\mo_tdata_reg[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => s2_accum_active,
      I1 => s2_accumulated_value_reg(3),
      I2 => \s1_product_reg_reg_n_0_[3]\,
      O => \mo_tdata_reg[3]_i_2_n_0\
    );
\mo_tdata_reg[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => s2_accum_active,
      I1 => s2_accumulated_value_reg(2),
      I2 => \s1_product_reg_reg_n_0_[2]\,
      O => \mo_tdata_reg[3]_i_3_n_0\
    );
\mo_tdata_reg[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => s2_accum_active,
      I1 => s2_accumulated_value_reg(1),
      I2 => \s1_product_reg_reg_n_0_[1]\,
      O => \mo_tdata_reg[3]_i_4_n_0\
    );
\mo_tdata_reg[3]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => s2_accum_active,
      I1 => s2_accumulated_value_reg(0),
      I2 => \s1_product_reg_reg_n_0_[0]\,
      O => \mo_tdata_reg[3]_i_5_n_0\
    );
\mo_tdata_reg[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accum_active,
      I2 => s2_accumulated_value_reg(7),
      O => \mo_tdata_reg[7]_i_2_n_0\
    );
\mo_tdata_reg[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => s2_accum_active,
      I1 => s2_accumulated_value_reg(6),
      I2 => \s1_product_reg_reg_n_0_[6]\,
      O => \mo_tdata_reg[7]_i_3_n_0\
    );
\mo_tdata_reg[7]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => s2_accum_active,
      I1 => s2_accumulated_value_reg(5),
      I2 => \s1_product_reg_reg_n_0_[5]\,
      O => \mo_tdata_reg[7]_i_4_n_0\
    );
\mo_tdata_reg[7]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => s2_accum_active,
      I1 => s2_accumulated_value_reg(4),
      I2 => \s1_product_reg_reg_n_0_[4]\,
      O => \mo_tdata_reg[7]_i_5_n_0\
    );
\mo_tdata_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(0),
      Q => MO_AXIS_TDATA_OBUF(0),
      R => clear
    );
\mo_tdata_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(10),
      Q => MO_AXIS_TDATA_OBUF(10),
      R => clear
    );
\mo_tdata_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(11),
      Q => MO_AXIS_TDATA_OBUF(11),
      R => clear
    );
\mo_tdata_reg_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mo_tdata_reg_reg[7]_i_1_n_0\,
      CO(3) => \mo_tdata_reg_reg[11]_i_1_n_0\,
      CO(2 downto 0) => \NLW_mo_tdata_reg_reg[11]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \mo_tdata_reg[11]_i_2_n_0\,
      DI(2) => \mo_tdata_reg[11]_i_3_n_0\,
      DI(1) => \mo_tdata_reg[11]_i_4_n_0\,
      DI(0) => \mo_tdata_reg[11]_i_5_n_0\,
      O(3 downto 0) => p_0_in(11 downto 8),
      S(3) => \mo_tdata_reg[11]_i_6_n_0\,
      S(2) => \mo_tdata_reg[11]_i_7_n_0\,
      S(1) => \mo_tdata_reg[11]_i_8_n_0\,
      S(0) => \mo_tdata_reg[11]_i_9_n_0\
    );
\mo_tdata_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(12),
      Q => MO_AXIS_TDATA_OBUF(12),
      R => clear
    );
\mo_tdata_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(13),
      Q => MO_AXIS_TDATA_OBUF(13),
      R => clear
    );
\mo_tdata_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(14),
      Q => MO_AXIS_TDATA_OBUF(14),
      R => clear
    );
\mo_tdata_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(15),
      Q => MO_AXIS_TDATA_OBUF(15),
      R => clear
    );
\mo_tdata_reg_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mo_tdata_reg_reg[11]_i_1_n_0\,
      CO(3) => \mo_tdata_reg_reg[15]_i_1_n_0\,
      CO(2 downto 0) => \NLW_mo_tdata_reg_reg[15]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \mo_tdata_reg[15]_i_2_n_0\,
      DI(2) => \mo_tdata_reg[15]_i_3_n_0\,
      DI(1) => \mo_tdata_reg[15]_i_4_n_0\,
      DI(0) => \mo_tdata_reg[15]_i_5_n_0\,
      O(3 downto 0) => p_0_in(15 downto 12),
      S(3) => \mo_tdata_reg[15]_i_6_n_0\,
      S(2) => \mo_tdata_reg[15]_i_7_n_0\,
      S(1) => \mo_tdata_reg[15]_i_8_n_0\,
      S(0) => \mo_tdata_reg[15]_i_9_n_0\
    );
\mo_tdata_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(16),
      Q => MO_AXIS_TDATA_OBUF(16),
      R => clear
    );
\mo_tdata_reg_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(17),
      Q => MO_AXIS_TDATA_OBUF(17),
      R => clear
    );
\mo_tdata_reg_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(18),
      Q => MO_AXIS_TDATA_OBUF(18),
      R => clear
    );
\mo_tdata_reg_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(19),
      Q => MO_AXIS_TDATA_OBUF(19),
      R => clear
    );
\mo_tdata_reg_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mo_tdata_reg_reg[15]_i_1_n_0\,
      CO(3) => \mo_tdata_reg_reg[19]_i_1_n_0\,
      CO(2 downto 0) => \NLW_mo_tdata_reg_reg[19]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \mo_tdata_reg[19]_i_2_n_0\,
      DI(2) => \mo_tdata_reg[19]_i_3_n_0\,
      DI(1) => \mo_tdata_reg[19]_i_4_n_0\,
      DI(0) => \mo_tdata_reg[19]_i_5_n_0\,
      O(3 downto 0) => p_0_in(19 downto 16),
      S(3) => \mo_tdata_reg[19]_i_6_n_0\,
      S(2) => \mo_tdata_reg[19]_i_7_n_0\,
      S(1) => \mo_tdata_reg[19]_i_8_n_0\,
      S(0) => \mo_tdata_reg[19]_i_9_n_0\
    );
\mo_tdata_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(1),
      Q => MO_AXIS_TDATA_OBUF(1),
      R => clear
    );
\mo_tdata_reg_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(20),
      Q => MO_AXIS_TDATA_OBUF(20),
      R => clear
    );
\mo_tdata_reg_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(21),
      Q => MO_AXIS_TDATA_OBUF(21),
      R => clear
    );
\mo_tdata_reg_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(22),
      Q => MO_AXIS_TDATA_OBUF(22),
      R => clear
    );
\mo_tdata_reg_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(23),
      Q => MO_AXIS_TDATA_OBUF(23),
      R => clear
    );
\mo_tdata_reg_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mo_tdata_reg_reg[19]_i_1_n_0\,
      CO(3) => \mo_tdata_reg_reg[23]_i_1_n_0\,
      CO(2 downto 0) => \NLW_mo_tdata_reg_reg[23]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \mo_tdata_reg[23]_i_2_n_0\,
      DI(2) => \mo_tdata_reg[23]_i_3_n_0\,
      DI(1) => \mo_tdata_reg[23]_i_4_n_0\,
      DI(0) => \mo_tdata_reg[23]_i_5_n_0\,
      O(3 downto 0) => p_0_in(23 downto 20),
      S(3) => \mo_tdata_reg[23]_i_6_n_0\,
      S(2) => \mo_tdata_reg[23]_i_7_n_0\,
      S(1) => \mo_tdata_reg[23]_i_8_n_0\,
      S(0) => \mo_tdata_reg[23]_i_9_n_0\
    );
\mo_tdata_reg_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(24),
      Q => MO_AXIS_TDATA_OBUF(24),
      R => clear
    );
\mo_tdata_reg_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(25),
      Q => MO_AXIS_TDATA_OBUF(25),
      R => clear
    );
\mo_tdata_reg_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(26),
      Q => MO_AXIS_TDATA_OBUF(26),
      R => clear
    );
\mo_tdata_reg_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(27),
      Q => MO_AXIS_TDATA_OBUF(27),
      R => clear
    );
\mo_tdata_reg_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mo_tdata_reg_reg[23]_i_1_n_0\,
      CO(3) => \mo_tdata_reg_reg[27]_i_1_n_0\,
      CO(2 downto 0) => \NLW_mo_tdata_reg_reg[27]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \mo_tdata_reg[27]_i_2_n_0\,
      DI(2) => \mo_tdata_reg[27]_i_3_n_0\,
      DI(1) => \mo_tdata_reg[27]_i_4_n_0\,
      DI(0) => \mo_tdata_reg[27]_i_5_n_0\,
      O(3 downto 0) => p_0_in(27 downto 24),
      S(3) => \mo_tdata_reg[27]_i_6_n_0\,
      S(2) => \mo_tdata_reg[27]_i_7_n_0\,
      S(1) => \mo_tdata_reg[27]_i_8_n_0\,
      S(0) => \mo_tdata_reg[27]_i_9_n_0\
    );
\mo_tdata_reg_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(28),
      Q => MO_AXIS_TDATA_OBUF(28),
      R => clear
    );
\mo_tdata_reg_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(29),
      Q => MO_AXIS_TDATA_OBUF(29),
      R => clear
    );
\mo_tdata_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(2),
      Q => MO_AXIS_TDATA_OBUF(2),
      R => clear
    );
\mo_tdata_reg_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(30),
      Q => MO_AXIS_TDATA_OBUF(30),
      R => clear
    );
\mo_tdata_reg_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(31),
      Q => MO_AXIS_TDATA_OBUF(31),
      R => clear
    );
\mo_tdata_reg_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \mo_tdata_reg_reg[27]_i_1_n_0\,
      CO(3 downto 0) => \NLW_mo_tdata_reg_reg[31]_i_2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \mo_tdata_reg[31]_i_3_n_0\,
      DI(1) => \mo_tdata_reg[31]_i_4_n_0\,
      DI(0) => \mo_tdata_reg[31]_i_5_n_0\,
      O(3 downto 0) => p_0_in(31 downto 28),
      S(3) => \mo_tdata_reg[31]_i_6_n_0\,
      S(2) => \mo_tdata_reg[31]_i_7_n_0\,
      S(1) => \mo_tdata_reg[31]_i_8_n_0\,
      S(0) => \mo_tdata_reg[31]_i_9_n_0\
    );
\mo_tdata_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(3),
      Q => MO_AXIS_TDATA_OBUF(3),
      R => clear
    );
\mo_tdata_reg_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \mo_tdata_reg_reg[3]_i_1_n_0\,
      CO(2 downto 0) => \NLW_mo_tdata_reg_reg[3]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \s1_product_reg_reg_n_0_[3]\,
      DI(2) => \s1_product_reg_reg_n_0_[2]\,
      DI(1) => \s1_product_reg_reg_n_0_[1]\,
      DI(0) => \s1_product_reg_reg_n_0_[0]\,
      O(3 downto 0) => p_0_in(3 downto 0),
      S(3) => \mo_tdata_reg[3]_i_2_n_0\,
      S(2) => \mo_tdata_reg[3]_i_3_n_0\,
      S(1) => \mo_tdata_reg[3]_i_4_n_0\,
      S(0) => \mo_tdata_reg[3]_i_5_n_0\
    );
\mo_tdata_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(4),
      Q => MO_AXIS_TDATA_OBUF(4),
      R => clear
    );
\mo_tdata_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(5),
      Q => MO_AXIS_TDATA_OBUF(5),
      R => clear
    );
\mo_tdata_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(6),
      Q => MO_AXIS_TDATA_OBUF(6),
      R => clear
    );
\mo_tdata_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(7),
      Q => MO_AXIS_TDATA_OBUF(7),
      R => clear
    );
\mo_tdata_reg_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mo_tdata_reg_reg[3]_i_1_n_0\,
      CO(3) => \mo_tdata_reg_reg[7]_i_1_n_0\,
      CO(2 downto 0) => \NLW_mo_tdata_reg_reg[7]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \s1_product_reg_reg_n_0_[7]\,
      DI(2) => \s1_product_reg_reg_n_0_[6]\,
      DI(1) => \s1_product_reg_reg_n_0_[5]\,
      DI(0) => \s1_product_reg_reg_n_0_[4]\,
      O(3 downto 0) => p_0_in(7 downto 4),
      S(3) => \mo_tdata_reg[7]_i_2_n_0\,
      S(2) => \mo_tdata_reg[7]_i_3_n_0\,
      S(1) => \mo_tdata_reg[7]_i_4_n_0\,
      S(0) => \mo_tdata_reg[7]_i_5_n_0\
    );
\mo_tdata_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(8),
      Q => MO_AXIS_TDATA_OBUF(8),
      R => clear
    );
\mo_tdata_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => p_0_in(9),
      Q => MO_AXIS_TDATA_OBUF(9),
      R => clear
    );
\mo_tid_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => s1_tid_reg(0),
      Q => MO_AXIS_TID_OBUF(0),
      R => clear
    );
\mo_tid_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => s1_tid_reg(1),
      Q => MO_AXIS_TID_OBUF(1),
      R => clear
    );
\mo_tid_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => s1_tid_reg(2),
      Q => MO_AXIS_TID_OBUF(2),
      R => clear
    );
\mo_tid_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => s1_tid_reg(3),
      Q => MO_AXIS_TID_OBUF(3),
      R => clear
    );
\mo_tid_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => s1_tid_reg(4),
      Q => MO_AXIS_TID_OBUF(4),
      R => clear
    );
\mo_tid_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => s1_tid_reg(5),
      Q => MO_AXIS_TID_OBUF(5),
      R => clear
    );
\mo_tid_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => s1_tid_reg(6),
      Q => MO_AXIS_TID_OBUF(6),
      R => clear
    );
\mo_tid_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => \mo_tdata_reg[31]_i_1_n_0\,
      D => s1_tid_reg(7),
      Q => MO_AXIS_TID_OBUF(7),
      R => clear
    );
mo_tlast_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F3A00000"
    )
        port map (
      I0 => s1_tlast_reg,
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => s1_tvalid_reg,
      I3 => MO_AXIS_TLAST_OBUF,
      I4 => ARESETN_IBUF,
      O => mo_tlast_reg_i_1_n_0
    );
mo_tlast_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => '1',
      D => mo_tlast_reg_i_1_n_0,
      Q => MO_AXIS_TLAST_OBUF,
      R => '0'
    );
\s1_product_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C8"
    )
        port map (
      I0 => SD_AXIS_TUSER_IBUF,
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(4),
      O => p_1_in(0)
    );
\s1_product_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9DC8C8C8"
    )
        port map (
      I0 => SD_AXIS_TUSER_IBUF,
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(4),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TDATA_IBUF(0),
      O => p_1_in(1)
    );
\s1_product_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => multiplied_value(2),
      O => p_1_in(2)
    );
\s1_product_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(3),
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => multiplied_value(3),
      O => p_1_in(3)
    );
\s1_product_reg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => multiplied_value(4),
      O => p_1_in(4)
    );
\s1_product_reg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(5),
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => multiplied_value(5),
      O => p_1_in(5)
    );
\s1_product_reg[5]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E000008008000000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(6),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TDATA_IBUF(1),
      I5 => SD_AXIS_TDATA_IBUF(2),
      O => \s1_product_reg[5]_i_10_n_0\
    );
\s1_product_reg[5]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CA80800080000000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(6),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TDATA_IBUF(1),
      I5 => SD_AXIS_TDATA_IBUF(2),
      O => \s1_product_reg[5]_i_11_n_0\
    );
\s1_product_reg[5]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"37484F3FB03F4F3F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(5),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(6),
      I5 => SD_AXIS_TDATA_IBUF(1),
      O => \s1_product_reg[5]_i_12_n_0\
    );
\s1_product_reg[5]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0FF00000F800F00"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(5),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(1),
      I5 => SD_AXIS_TDATA_IBUF(6),
      O => \s1_product_reg[5]_i_14_n_0\
    );
\s1_product_reg[5]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFFF0F0C0F0"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(4),
      I2 => SD_AXIS_TDATA_IBUF(6),
      I3 => SD_AXIS_TDATA_IBUF(1),
      I4 => SD_AXIS_TDATA_IBUF(5),
      I5 => SD_AXIS_TDATA_IBUF(2),
      O => \s1_product_reg[5]_i_15_n_0\
    );
\s1_product_reg[5]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8409FBFB73F3F3F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(2),
      I2 => SD_AXIS_TDATA_IBUF(5),
      I3 => SD_AXIS_TDATA_IBUF(0),
      I4 => SD_AXIS_TDATA_IBUF(6),
      I5 => SD_AXIS_TDATA_IBUF(1),
      O => \s1_product_reg[5]_i_16_n_0\
    );
\s1_product_reg[5]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"12EA35151D959595"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(2),
      I2 => SD_AXIS_TDATA_IBUF(5),
      I3 => SD_AXIS_TDATA_IBUF(0),
      I4 => SD_AXIS_TDATA_IBUF(6),
      I5 => SD_AXIS_TDATA_IBUF(1),
      O => \s1_product_reg[5]_i_17_n_0\
    );
\s1_product_reg[5]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1FFFFF00F080F000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(5),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(1),
      I5 => SD_AXIS_TDATA_IBUF(6),
      O => \s1_product_reg[5]_i_18_n_0\
    );
\s1_product_reg[5]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00400000F0F0C0F0"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(4),
      I2 => SD_AXIS_TDATA_IBUF(6),
      I3 => SD_AXIS_TDATA_IBUF(1),
      I4 => SD_AXIS_TDATA_IBUF(5),
      I5 => SD_AXIS_TDATA_IBUF(2),
      O => \s1_product_reg[5]_i_19_n_0\
    );
\s1_product_reg[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1DE2"
    )
        port map (
      I0 => \s1_product_reg[5]_i_10_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => \s1_product_reg[5]_i_11_n_0\,
      I3 => \s1_product_reg[5]_i_12_n_0\,
      O => \s1_product_reg[5]_i_3_n_0\
    );
\s1_product_reg[5]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \s1_product_reg[5]_i_3_n_0\,
      O => \s1_product_reg[5]_i_4_n_0\
    );
\s1_product_reg[5]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(7),
      O => \s1_product_reg[5]_i_5_n_0\
    );
\s1_product_reg[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"565656A6A6A656A6"
    )
        port map (
      I0 => \s1_product_reg[5]_i_3_n_0\,
      I1 => \s1_product_reg_reg[5]_i_13_n_0\,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \s1_product_reg[5]_i_14_n_0\,
      I4 => SD_AXIS_TDATA_IBUF(3),
      I5 => \s1_product_reg[5]_i_15_n_0\,
      O => \s1_product_reg[5]_i_6_n_0\
    );
\s1_product_reg[5]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg[5]_i_3_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(7),
      I2 => SD_AXIS_TDATA_IBUF(1),
      O => \s1_product_reg[5]_i_7_n_0\
    );
\s1_product_reg[5]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88877787"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(7),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => \s1_product_reg[5]_i_16_n_0\,
      I3 => SD_AXIS_TDATA_IBUF(3),
      I4 => \s1_product_reg[5]_i_17_n_0\,
      O => \s1_product_reg[5]_i_8_n_0\
    );
\s1_product_reg[5]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4B77788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => SD_AXIS_TDATA_IBUF(4),
      I2 => SD_AXIS_TDATA_IBUF(6),
      I3 => SD_AXIS_TDATA_IBUF(0),
      I4 => SD_AXIS_TDATA_IBUF(5),
      I5 => SD_AXIS_TDATA_IBUF(1),
      O => \s1_product_reg[5]_i_9_n_0\
    );
\s1_product_reg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(6),
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => multiplied_value(6),
      O => p_1_in(6)
    );
\s1_product_reg[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(7),
      I1 => multiplied_value(7),
      I2 => SD_AXIS_TUSER_IBUF,
      O => p_1_in(7)
    );
\s1_product_reg[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \s1_product_reg[7]_i_5_n_0\,
      I1 => \s1_product_reg[7]_i_6_n_0\,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \s1_product_reg[7]_i_7_n_0\,
      I4 => SD_AXIS_TDATA_IBUF(3),
      I5 => \s1_product_reg[7]_i_8_n_0\,
      O => \s1_product_reg[7]_i_3_n_0\
    );
\s1_product_reg[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"569A"
    )
        port map (
      I0 => \s1_product_reg[7]_i_3_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => \s1_product_reg[7]_i_9_n_0\,
      I3 => SD_AXIS_TDATA_IBUF(7),
      O => \s1_product_reg[7]_i_4_n_0\
    );
\s1_product_reg[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00003373"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(1),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TDATA_IBUF(2),
      O => \s1_product_reg[7]_i_5_n_0\
    );
\s1_product_reg[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000FF7FFF"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(5),
      I2 => SD_AXIS_TDATA_IBUF(4),
      I3 => SD_AXIS_TDATA_IBUF(1),
      I4 => SD_AXIS_TDATA_IBUF(6),
      I5 => SD_AXIS_TDATA_IBUF(2),
      O => \s1_product_reg[7]_i_6_n_0\
    );
\s1_product_reg[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF0F0F3F0F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(4),
      I2 => SD_AXIS_TDATA_IBUF(6),
      I3 => SD_AXIS_TDATA_IBUF(1),
      I4 => SD_AXIS_TDATA_IBUF(5),
      I5 => SD_AXIS_TDATA_IBUF(2),
      O => \s1_product_reg[7]_i_7_n_0\
    );
\s1_product_reg[7]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0000F7F00FF0FFF"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(5),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(6),
      I5 => SD_AXIS_TDATA_IBUF(1),
      O => \s1_product_reg[7]_i_8_n_0\
    );
\s1_product_reg[7]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF00F080F000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(4),
      I2 => SD_AXIS_TDATA_IBUF(5),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(1),
      I5 => SD_AXIS_TDATA_IBUF(6),
      O => \s1_product_reg[7]_i_9_n_0\
    );
\s1_product_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => p_1_in(0),
      Q => \s1_product_reg_reg_n_0_[0]\,
      R => clear
    );
\s1_product_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => p_1_in(1),
      Q => \s1_product_reg_reg_n_0_[1]\,
      R => clear
    );
\s1_product_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => p_1_in(2),
      Q => \s1_product_reg_reg_n_0_[2]\,
      R => clear
    );
\s1_product_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => p_1_in(3),
      Q => \s1_product_reg_reg_n_0_[3]\,
      R => clear
    );
\s1_product_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => p_1_in(4),
      Q => \s1_product_reg_reg_n_0_[4]\,
      R => clear
    );
\s1_product_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => p_1_in(5),
      Q => \s1_product_reg_reg_n_0_[5]\,
      R => clear
    );
\s1_product_reg_reg[5]_i_13\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s1_product_reg[5]_i_18_n_0\,
      I1 => \s1_product_reg[5]_i_19_n_0\,
      O => \s1_product_reg_reg[5]_i_13_n_0\,
      S => SD_AXIS_TDATA_IBUF(3)
    );
\s1_product_reg_reg[5]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \s1_product_reg_reg[5]_i_2_n_0\,
      CO(2 downto 0) => \NLW_s1_product_reg_reg[5]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \s1_product_reg[5]_i_3_n_0\,
      DI(2) => \s1_product_reg[5]_i_4_n_0\,
      DI(1) => \s1_product_reg[5]_i_5_n_0\,
      DI(0) => '0',
      O(3 downto 0) => multiplied_value(5 downto 2),
      S(3) => \s1_product_reg[5]_i_6_n_0\,
      S(2) => \s1_product_reg[5]_i_7_n_0\,
      S(1) => \s1_product_reg[5]_i_8_n_0\,
      S(0) => \s1_product_reg[5]_i_9_n_0\
    );
\s1_product_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => p_1_in(6),
      Q => \s1_product_reg_reg_n_0_[6]\,
      R => clear
    );
\s1_product_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => p_1_in(7),
      Q => \s1_product_reg_reg_n_0_[7]\,
      R => clear
    );
\s1_product_reg_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \s1_product_reg_reg[5]_i_2_n_0\,
      CO(3 downto 0) => \NLW_s1_product_reg_reg[7]_i_2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \s1_product_reg[7]_i_3_n_0\,
      O(3 downto 2) => \NLW_s1_product_reg_reg[7]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => multiplied_value(7 downto 6),
      S(3 downto 1) => B"001",
      S(0) => \s1_product_reg[7]_i_4_n_0\
    );
\s1_tid_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID_IBUF(0),
      Q => s1_tid_reg(0),
      R => clear
    );
\s1_tid_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID_IBUF(1),
      Q => s1_tid_reg(1),
      R => clear
    );
\s1_tid_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID_IBUF(2),
      Q => s1_tid_reg(2),
      R => clear
    );
\s1_tid_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID_IBUF(3),
      Q => s1_tid_reg(3),
      R => clear
    );
\s1_tid_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID_IBUF(4),
      Q => s1_tid_reg(4),
      R => clear
    );
\s1_tid_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID_IBUF(5),
      Q => s1_tid_reg(5),
      R => clear
    );
\s1_tid_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID_IBUF(6),
      Q => s1_tid_reg(6),
      R => clear
    );
\s1_tid_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TID_IBUF(7),
      Q => s1_tid_reg(7),
      R => clear
    );
s1_tlast_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => MO_AXIS_TLAST_OBUF,
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => SD_AXIS_TVALID_IBUF,
      O => s1_tlast_reg3_out
    );
s1_tlast_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s1_tlast_reg3_out,
      D => SD_AXIS_TLAST_IBUF,
      Q => s1_tlast_reg,
      R => clear
    );
s1_tvalid_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ARESETN_IBUF,
      O => clear
    );
s1_tvalid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => SD_AXIS_TREADY_OBUF,
      D => SD_AXIS_TVALID_IBUF,
      Q => s1_tvalid_reg,
      R => clear
    );
s2_accum_active_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00808888CC8C8888"
    )
        port map (
      I0 => s2_accum_active,
      I1 => ARESETN_IBUF,
      I2 => MO_AXIS_TLAST_OBUF,
      I3 => MO_AXIS_TREADY_IBUF,
      I4 => s1_tvalid_reg,
      I5 => s1_tlast_reg,
      O => s2_accum_active_i_1_n_0
    );
s2_accum_active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
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
      I0 => MO_AXIS_TLAST_OBUF,
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => s1_tvalid_reg,
      O => s2_accum_active1_out
    );
\s2_accumulated_value[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[3]\,
      I1 => s2_accumulated_value_reg(3),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[0]_i_3_n_0\
    );
\s2_accumulated_value[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[2]\,
      I1 => s2_accumulated_value_reg(2),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[0]_i_4_n_0\
    );
\s2_accumulated_value[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[1]\,
      I1 => s2_accumulated_value_reg(1),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[0]_i_5_n_0\
    );
\s2_accumulated_value[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[0]\,
      I1 => s2_accumulated_value_reg(0),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[0]_i_6_n_0\
    );
\s2_accumulated_value[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(15),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[12]_i_2_n_0\
    );
\s2_accumulated_value[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(14),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[12]_i_3_n_0\
    );
\s2_accumulated_value[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(13),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[12]_i_4_n_0\
    );
\s2_accumulated_value[12]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(12),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[12]_i_5_n_0\
    );
\s2_accumulated_value[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(19),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[16]_i_2_n_0\
    );
\s2_accumulated_value[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(18),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[16]_i_3_n_0\
    );
\s2_accumulated_value[16]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(17),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[16]_i_4_n_0\
    );
\s2_accumulated_value[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(16),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[16]_i_5_n_0\
    );
\s2_accumulated_value[20]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(23),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[20]_i_2_n_0\
    );
\s2_accumulated_value[20]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(22),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[20]_i_3_n_0\
    );
\s2_accumulated_value[20]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(21),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[20]_i_4_n_0\
    );
\s2_accumulated_value[20]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(20),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[20]_i_5_n_0\
    );
\s2_accumulated_value[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(27),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[24]_i_2_n_0\
    );
\s2_accumulated_value[24]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(26),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[24]_i_3_n_0\
    );
\s2_accumulated_value[24]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(25),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[24]_i_4_n_0\
    );
\s2_accumulated_value[24]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(24),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[24]_i_5_n_0\
    );
\s2_accumulated_value[28]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(31),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[28]_i_2_n_0\
    );
\s2_accumulated_value[28]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(30),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[28]_i_3_n_0\
    );
\s2_accumulated_value[28]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(29),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[28]_i_4_n_0\
    );
\s2_accumulated_value[28]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(28),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[28]_i_5_n_0\
    );
\s2_accumulated_value[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(7),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[4]_i_2_n_0\
    );
\s2_accumulated_value[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[6]\,
      I1 => s2_accumulated_value_reg(6),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[4]_i_3_n_0\
    );
\s2_accumulated_value[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[5]\,
      I1 => s2_accumulated_value_reg(5),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[4]_i_4_n_0\
    );
\s2_accumulated_value[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[4]\,
      I1 => s2_accumulated_value_reg(4),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[4]_i_5_n_0\
    );
\s2_accumulated_value[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(11),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[8]_i_2_n_0\
    );
\s2_accumulated_value[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(10),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[8]_i_3_n_0\
    );
\s2_accumulated_value[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(9),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[8]_i_4_n_0\
    );
\s2_accumulated_value[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \s1_product_reg_reg_n_0_[7]\,
      I1 => s2_accumulated_value_reg(8),
      I2 => s2_accum_active,
      O => \s2_accumulated_value[8]_i_5_n_0\
    );
\s2_accumulated_value_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[0]_i_2_n_7\,
      Q => s2_accumulated_value_reg(0),
      R => clear
    );
\s2_accumulated_value_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \s2_accumulated_value_reg[0]_i_2_n_0\,
      CO(2 downto 0) => \NLW_s2_accumulated_value_reg[0]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \s1_product_reg_reg_n_0_[3]\,
      DI(2) => \s1_product_reg_reg_n_0_[2]\,
      DI(1) => \s1_product_reg_reg_n_0_[1]\,
      DI(0) => \s1_product_reg_reg_n_0_[0]\,
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
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[8]_i_1_n_5\,
      Q => s2_accumulated_value_reg(10),
      R => clear
    );
\s2_accumulated_value_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[8]_i_1_n_4\,
      Q => s2_accumulated_value_reg(11),
      R => clear
    );
\s2_accumulated_value_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[12]_i_1_n_7\,
      Q => s2_accumulated_value_reg(12),
      R => clear
    );
\s2_accumulated_value_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[8]_i_1_n_0\,
      CO(3) => \s2_accumulated_value_reg[12]_i_1_n_0\,
      CO(2 downto 0) => \NLW_s2_accumulated_value_reg[12]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \s1_product_reg_reg_n_0_[7]\,
      DI(2) => \s1_product_reg_reg_n_0_[7]\,
      DI(1) => \s1_product_reg_reg_n_0_[7]\,
      DI(0) => \s1_product_reg_reg_n_0_[7]\,
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
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[12]_i_1_n_6\,
      Q => s2_accumulated_value_reg(13),
      R => clear
    );
\s2_accumulated_value_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[12]_i_1_n_5\,
      Q => s2_accumulated_value_reg(14),
      R => clear
    );
\s2_accumulated_value_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[12]_i_1_n_4\,
      Q => s2_accumulated_value_reg(15),
      R => clear
    );
\s2_accumulated_value_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[16]_i_1_n_7\,
      Q => s2_accumulated_value_reg(16),
      R => clear
    );
\s2_accumulated_value_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[12]_i_1_n_0\,
      CO(3) => \s2_accumulated_value_reg[16]_i_1_n_0\,
      CO(2 downto 0) => \NLW_s2_accumulated_value_reg[16]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \s1_product_reg_reg_n_0_[7]\,
      DI(2) => \s1_product_reg_reg_n_0_[7]\,
      DI(1) => \s1_product_reg_reg_n_0_[7]\,
      DI(0) => \s1_product_reg_reg_n_0_[7]\,
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
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[16]_i_1_n_6\,
      Q => s2_accumulated_value_reg(17),
      R => clear
    );
\s2_accumulated_value_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[16]_i_1_n_5\,
      Q => s2_accumulated_value_reg(18),
      R => clear
    );
\s2_accumulated_value_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[16]_i_1_n_4\,
      Q => s2_accumulated_value_reg(19),
      R => clear
    );
\s2_accumulated_value_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[0]_i_2_n_6\,
      Q => s2_accumulated_value_reg(1),
      R => clear
    );
\s2_accumulated_value_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[20]_i_1_n_7\,
      Q => s2_accumulated_value_reg(20),
      R => clear
    );
\s2_accumulated_value_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[16]_i_1_n_0\,
      CO(3) => \s2_accumulated_value_reg[20]_i_1_n_0\,
      CO(2 downto 0) => \NLW_s2_accumulated_value_reg[20]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \s1_product_reg_reg_n_0_[7]\,
      DI(2) => \s1_product_reg_reg_n_0_[7]\,
      DI(1) => \s1_product_reg_reg_n_0_[7]\,
      DI(0) => \s1_product_reg_reg_n_0_[7]\,
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
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[20]_i_1_n_6\,
      Q => s2_accumulated_value_reg(21),
      R => clear
    );
\s2_accumulated_value_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[20]_i_1_n_5\,
      Q => s2_accumulated_value_reg(22),
      R => clear
    );
\s2_accumulated_value_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[20]_i_1_n_4\,
      Q => s2_accumulated_value_reg(23),
      R => clear
    );
\s2_accumulated_value_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[24]_i_1_n_7\,
      Q => s2_accumulated_value_reg(24),
      R => clear
    );
\s2_accumulated_value_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[20]_i_1_n_0\,
      CO(3) => \s2_accumulated_value_reg[24]_i_1_n_0\,
      CO(2 downto 0) => \NLW_s2_accumulated_value_reg[24]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \s1_product_reg_reg_n_0_[7]\,
      DI(2) => \s1_product_reg_reg_n_0_[7]\,
      DI(1) => \s1_product_reg_reg_n_0_[7]\,
      DI(0) => \s1_product_reg_reg_n_0_[7]\,
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
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[24]_i_1_n_6\,
      Q => s2_accumulated_value_reg(25),
      R => clear
    );
\s2_accumulated_value_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[24]_i_1_n_5\,
      Q => s2_accumulated_value_reg(26),
      R => clear
    );
\s2_accumulated_value_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[24]_i_1_n_4\,
      Q => s2_accumulated_value_reg(27),
      R => clear
    );
\s2_accumulated_value_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[28]_i_1_n_7\,
      Q => s2_accumulated_value_reg(28),
      R => clear
    );
\s2_accumulated_value_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[24]_i_1_n_0\,
      CO(3 downto 0) => \NLW_s2_accumulated_value_reg[28]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \s1_product_reg_reg_n_0_[7]\,
      DI(1) => \s1_product_reg_reg_n_0_[7]\,
      DI(0) => \s1_product_reg_reg_n_0_[7]\,
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
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[28]_i_1_n_6\,
      Q => s2_accumulated_value_reg(29),
      R => clear
    );
\s2_accumulated_value_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[0]_i_2_n_5\,
      Q => s2_accumulated_value_reg(2),
      R => clear
    );
\s2_accumulated_value_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[28]_i_1_n_5\,
      Q => s2_accumulated_value_reg(30),
      R => clear
    );
\s2_accumulated_value_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[28]_i_1_n_4\,
      Q => s2_accumulated_value_reg(31),
      R => clear
    );
\s2_accumulated_value_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[0]_i_2_n_4\,
      Q => s2_accumulated_value_reg(3),
      R => clear
    );
\s2_accumulated_value_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[4]_i_1_n_7\,
      Q => s2_accumulated_value_reg(4),
      R => clear
    );
\s2_accumulated_value_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[0]_i_2_n_0\,
      CO(3) => \s2_accumulated_value_reg[4]_i_1_n_0\,
      CO(2 downto 0) => \NLW_s2_accumulated_value_reg[4]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \s1_product_reg_reg_n_0_[7]\,
      DI(2) => \s1_product_reg_reg_n_0_[6]\,
      DI(1) => \s1_product_reg_reg_n_0_[5]\,
      DI(0) => \s1_product_reg_reg_n_0_[4]\,
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
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[4]_i_1_n_6\,
      Q => s2_accumulated_value_reg(5),
      R => clear
    );
\s2_accumulated_value_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[4]_i_1_n_5\,
      Q => s2_accumulated_value_reg(6),
      R => clear
    );
\s2_accumulated_value_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[4]_i_1_n_4\,
      Q => s2_accumulated_value_reg(7),
      R => clear
    );
\s2_accumulated_value_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[8]_i_1_n_7\,
      Q => s2_accumulated_value_reg(8),
      R => clear
    );
\s2_accumulated_value_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s2_accumulated_value_reg[4]_i_1_n_0\,
      CO(3) => \s2_accumulated_value_reg[8]_i_1_n_0\,
      CO(2 downto 0) => \NLW_s2_accumulated_value_reg[8]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \s1_product_reg_reg_n_0_[7]\,
      DI(2) => \s1_product_reg_reg_n_0_[7]\,
      DI(1) => \s1_product_reg_reg_n_0_[7]\,
      DI(0) => \s1_product_reg_reg_n_0_[7]\,
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
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => s2_accum_active1_out,
      D => \s2_accumulated_value_reg[8]_i_1_n_6\,
      Q => s2_accumulated_value_reg(9),
      R => clear
    );
end STRUCTURE;
