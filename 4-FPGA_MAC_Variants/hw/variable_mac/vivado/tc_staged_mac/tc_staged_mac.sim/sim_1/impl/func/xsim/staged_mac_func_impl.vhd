-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Wed Oct 29 20:57:26 2025
-- Host        : co2050-04.ece.iastate.edu running 64-bit unknown
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/cam2022/CPRE-487_git/CPRE-4870/Lab4/hw/variable_mac/vivado/tc_staged_mac/tc_staged_mac.sim/sim_1/impl/func/xsim/staged_mac_func_impl.vhd
-- Design      : staged_mac
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity staged_mac is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    SD_AXIS_TREADY : out STD_LOGIC;
    SD_AXIS_TDATA : in STD_LOGIC_VECTOR ( 19 downto 0 );
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
  attribute NotValidForBitStream of staged_mac : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of staged_mac : entity is "6798c9a2";
end staged_mac;

architecture STRUCTURE of staged_mac is
  signal ACLK_IBUF : STD_LOGIC;
  signal ACLK_IBUF_BUFG : STD_LOGIC;
  signal ARESETN_IBUF : STD_LOGIC;
  signal ARG : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MO_AXIS_TDATA0 : STD_LOGIC;
  signal MO_AXIS_TDATA_OBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MO_AXIS_TLAST_OBUF : STD_LOGIC;
  signal MO_AXIS_TREADY_IBUF : STD_LOGIC;
  signal MO_AXIS_TVALID0 : STD_LOGIC;
  signal MO_AXIS_TVALID_i_2_n_0 : STD_LOGIC;
  signal MO_AXIS_TVALID_reg_lopt_replica_1 : STD_LOGIC;
  signal SD_AXIS_TDATA_IBUF : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal SD_AXIS_TLAST_IBUF : STD_LOGIC;
  signal SD_AXIS_TREADY_OBUF : STD_LOGIC;
  signal SD_AXIS_TREADY_i_1_n_0 : STD_LOGIC;
  signal SD_AXIS_TREADY_i_2_n_0 : STD_LOGIC;
  signal SD_AXIS_TUSER_IBUF : STD_LOGIC;
  signal SD_AXIS_TVALID_IBUF : STD_LOGIC;
  signal accumulated_value : STD_LOGIC;
  signal \accumulated_value[0]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_10_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_11_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_15_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_16_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_17_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_18_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_19_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_20_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_21_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_22_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_23_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_24_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_25_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_26_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_27_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_28_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_29_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_30_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_31_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_32_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_33_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_34_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_35_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_36_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_37_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_38_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_39_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_40_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_41_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_8_n_0\ : STD_LOGIC;
  signal \accumulated_value[10]_i_9_n_0\ : STD_LOGIC;
  signal \accumulated_value[11]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[11]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[11]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[11]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[11]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value[12]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[13]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_10_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_14_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_15_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_16_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_17_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_18_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_19_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_20_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_21_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_22_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_23_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_24_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_25_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_26_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_27_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_28_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_29_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_30_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_31_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_32_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_33_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_8_n_0\ : STD_LOGIC;
  signal \accumulated_value[14]_i_9_n_0\ : STD_LOGIC;
  signal \accumulated_value[15]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[15]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[15]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[15]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[19]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[19]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[19]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[19]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[19]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value[1]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[1]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[1]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[1]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[23]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[23]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[23]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[23]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[27]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[27]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[27]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[27]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[2]_i_10_n_0\ : STD_LOGIC;
  signal \accumulated_value[2]_i_11_n_0\ : STD_LOGIC;
  signal \accumulated_value[2]_i_12_n_0\ : STD_LOGIC;
  signal \accumulated_value[2]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[2]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[2]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[2]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[2]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value[2]_i_8_n_0\ : STD_LOGIC;
  signal \accumulated_value[2]_i_9_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_10_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_11_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_12_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_13_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_14_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_16_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_17_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_19_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_20_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_21_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_22_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_23_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_24_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_25_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_26_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_27_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_28_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_9_n_0\ : STD_LOGIC;
  signal \accumulated_value[3]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[3]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[3]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[3]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[3]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value[4]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_10_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_11_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_12_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_13_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_14_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_15_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_8_n_0\ : STD_LOGIC;
  signal \accumulated_value[5]_i_9_n_0\ : STD_LOGIC;
  signal \accumulated_value[6]_i_10_n_0\ : STD_LOGIC;
  signal \accumulated_value[6]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[6]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[6]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[6]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[6]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value[6]_i_8_n_0\ : STD_LOGIC;
  signal \accumulated_value[6]_i_9_n_0\ : STD_LOGIC;
  signal \accumulated_value[7]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[7]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[7]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[7]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[7]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value[8]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value[9]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_12_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_12_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_12_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_12_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_12_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_13_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_13_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_13_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_13_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_13_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_14_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_14_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_14_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_14_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_14_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_3_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_3_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_3_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[10]_i_3_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[11]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_11_n_1\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_11_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_11_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_12_n_1\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_12_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_12_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_13_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_13_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_13_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_13_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_13_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_3_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_3_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_3_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[14]_i_3_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[15]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[19]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[23]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[27]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[2]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[2]_i_4_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[2]_i_4_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[2]_i_4_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[2]_i_4_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_15_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_15_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_18_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_18_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_18_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_18_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_18_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_7_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[5]_i_3_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[5]_i_3_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[5]_i_3_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[5]_i_3_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[6]_i_3_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[6]_i_3_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[6]_i_3_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[6]_i_3_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[0]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[10]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[11]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[12]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[13]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[14]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[15]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[16]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[17]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[18]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[19]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[1]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[20]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[21]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[22]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[23]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[24]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[25]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[26]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[27]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[28]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[29]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[2]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[30]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[31]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[3]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[4]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[5]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[6]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[7]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[8]\ : STD_LOGIC;
  signal \accumulated_value_reg_n_0_[9]\ : STD_LOGIC;
  signal currentState : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \currentState[1]_i_2_n_0\ : STD_LOGIC;
  signal nextState : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal outputOccurred : STD_LOGIC;
  signal outputOccurred_i_1_n_0 : STD_LOGIC;
  signal outputOccurred_i_2_n_0 : STD_LOGIC;
  signal p_0_out0 : STD_LOGIC;
  signal p_0_out0_in0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_accumulated_value_reg[10]_i_12_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[10]_i_13_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[10]_i_14_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[10]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[11]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[14]_i_11_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_accumulated_value_reg[14]_i_11_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_accumulated_value_reg[14]_i_12_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_accumulated_value_reg[14]_i_12_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_accumulated_value_reg[14]_i_13_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[14]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[15]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[19]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[23]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[27]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[2]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[31]_i_15_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_accumulated_value_reg[31]_i_15_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_accumulated_value_reg[31]_i_18_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[31]_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_accumulated_value_reg[31]_i_7_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_accumulated_value_reg[31]_i_7_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_accumulated_value_reg[31]_i_8_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_accumulated_value_reg[31]_i_8_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_accumulated_value_reg[3]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[5]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[6]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[7]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute sigis : string;
  attribute sigis of ACLK_IBUF_inst : label is "Clk";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of MO_AXIS_TLAST_OBUF_inst : label is "SWEEP";
  attribute OPT_MODIFIED of MO_AXIS_TVALID_OBUF_inst : label is "SWEEP";
  attribute OPT_INSERTED_REPDRIVER : boolean;
  attribute OPT_INSERTED_REPDRIVER of MO_AXIS_TVALID_reg_lopt_replica : label is std.standard.true;
  attribute OPT_MODIFIED of MO_AXIS_TVALID_reg_lopt_replica : label is "SWEEP";
  attribute HLUTNM : string;
  attribute HLUTNM of \accumulated_value[10]_i_10\ : label is "lutpair3";
  attribute HLUTNM of \accumulated_value[10]_i_11\ : label is "lutpair2";
  attribute HLUTNM of \accumulated_value[10]_i_5\ : label is "lutpair3";
  attribute HLUTNM of \accumulated_value[10]_i_6\ : label is "lutpair2";
  attribute HLUTNM of \accumulated_value[10]_i_7\ : label is "lutpair1";
  attribute HLUTNM of \accumulated_value[6]_i_4\ : label is "lutpair0";
  attribute HLUTNM of \accumulated_value[6]_i_7\ : label is "lutpair1";
  attribute HLUTNM of \accumulated_value[6]_i_8\ : label is "lutpair0";
  attribute OPT_MODIFIED of \accumulated_value_reg[10]_i_12\ : label is "PROPCONST SWEEP";
  attribute OPT_MODIFIED of \accumulated_value_reg[10]_i_13\ : label is "SWEEP";
  attribute OPT_MODIFIED of \accumulated_value_reg[10]_i_14\ : label is "PROPCONST SWEEP";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \accumulated_value_reg[10]_i_3\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[10]_i_3\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[11]_i_3\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[11]_i_3\ : label is "SWEEP";
  attribute OPT_MODIFIED of \accumulated_value_reg[14]_i_11\ : label is "SWEEP";
  attribute OPT_MODIFIED of \accumulated_value_reg[14]_i_12\ : label is "SWEEP";
  attribute OPT_MODIFIED of \accumulated_value_reg[14]_i_13\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[14]_i_3\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[14]_i_3\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[15]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[15]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[19]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[19]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[23]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[23]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[27]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[27]_i_2\ : label is "SWEEP";
  attribute OPT_MODIFIED of \accumulated_value_reg[2]_i_4\ : label is "PROPCONST SWEEP";
  attribute OPT_MODIFIED of \accumulated_value_reg[31]_i_15\ : label is "SWEEP";
  attribute OPT_MODIFIED of \accumulated_value_reg[31]_i_18\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[31]_i_5\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[31]_i_5\ : label is "SWEEP";
  attribute OPT_MODIFIED of \accumulated_value_reg[31]_i_7\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[31]_i_8\ : label is 35;
  attribute ADDER_THRESHOLD of \accumulated_value_reg[3]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[3]_i_2\ : label is "SWEEP";
  attribute OPT_MODIFIED of \accumulated_value_reg[5]_i_3\ : label is "PROPCONST SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[6]_i_3\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[6]_i_3\ : label is "PROPCONST SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[7]_i_3\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[7]_i_3\ : label is "SWEEP";
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
\MO_AXIS_TDATA[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => currentState(0),
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => currentState(1),
      I3 => ARESETN_IBUF,
      O => MO_AXIS_TDATA0
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
\MO_AXIS_TDATA_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[0]\,
      Q => MO_AXIS_TDATA_OBUF(0),
      R => '0'
    );
\MO_AXIS_TDATA_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[10]\,
      Q => MO_AXIS_TDATA_OBUF(10),
      R => '0'
    );
\MO_AXIS_TDATA_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[11]\,
      Q => MO_AXIS_TDATA_OBUF(11),
      R => '0'
    );
\MO_AXIS_TDATA_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[12]\,
      Q => MO_AXIS_TDATA_OBUF(12),
      R => '0'
    );
\MO_AXIS_TDATA_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[13]\,
      Q => MO_AXIS_TDATA_OBUF(13),
      R => '0'
    );
\MO_AXIS_TDATA_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[14]\,
      Q => MO_AXIS_TDATA_OBUF(14),
      R => '0'
    );
\MO_AXIS_TDATA_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[15]\,
      Q => MO_AXIS_TDATA_OBUF(15),
      R => '0'
    );
\MO_AXIS_TDATA_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[16]\,
      Q => MO_AXIS_TDATA_OBUF(16),
      R => '0'
    );
\MO_AXIS_TDATA_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[17]\,
      Q => MO_AXIS_TDATA_OBUF(17),
      R => '0'
    );
\MO_AXIS_TDATA_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[18]\,
      Q => MO_AXIS_TDATA_OBUF(18),
      R => '0'
    );
\MO_AXIS_TDATA_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[19]\,
      Q => MO_AXIS_TDATA_OBUF(19),
      R => '0'
    );
\MO_AXIS_TDATA_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[1]\,
      Q => MO_AXIS_TDATA_OBUF(1),
      R => '0'
    );
\MO_AXIS_TDATA_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[20]\,
      Q => MO_AXIS_TDATA_OBUF(20),
      R => '0'
    );
\MO_AXIS_TDATA_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[21]\,
      Q => MO_AXIS_TDATA_OBUF(21),
      R => '0'
    );
\MO_AXIS_TDATA_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[22]\,
      Q => MO_AXIS_TDATA_OBUF(22),
      R => '0'
    );
\MO_AXIS_TDATA_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[23]\,
      Q => MO_AXIS_TDATA_OBUF(23),
      R => '0'
    );
\MO_AXIS_TDATA_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[24]\,
      Q => MO_AXIS_TDATA_OBUF(24),
      R => '0'
    );
\MO_AXIS_TDATA_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[25]\,
      Q => MO_AXIS_TDATA_OBUF(25),
      R => '0'
    );
\MO_AXIS_TDATA_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[26]\,
      Q => MO_AXIS_TDATA_OBUF(26),
      R => '0'
    );
\MO_AXIS_TDATA_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[27]\,
      Q => MO_AXIS_TDATA_OBUF(27),
      R => '0'
    );
\MO_AXIS_TDATA_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[28]\,
      Q => MO_AXIS_TDATA_OBUF(28),
      R => '0'
    );
\MO_AXIS_TDATA_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[29]\,
      Q => MO_AXIS_TDATA_OBUF(29),
      R => '0'
    );
\MO_AXIS_TDATA_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[2]\,
      Q => MO_AXIS_TDATA_OBUF(2),
      R => '0'
    );
\MO_AXIS_TDATA_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[30]\,
      Q => MO_AXIS_TDATA_OBUF(30),
      R => '0'
    );
\MO_AXIS_TDATA_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[31]\,
      Q => MO_AXIS_TDATA_OBUF(31),
      R => '0'
    );
\MO_AXIS_TDATA_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[3]\,
      Q => MO_AXIS_TDATA_OBUF(3),
      R => '0'
    );
\MO_AXIS_TDATA_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[4]\,
      Q => MO_AXIS_TDATA_OBUF(4),
      R => '0'
    );
\MO_AXIS_TDATA_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[5]\,
      Q => MO_AXIS_TDATA_OBUF(5),
      R => '0'
    );
\MO_AXIS_TDATA_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[6]\,
      Q => MO_AXIS_TDATA_OBUF(6),
      R => '0'
    );
\MO_AXIS_TDATA_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[7]\,
      Q => MO_AXIS_TDATA_OBUF(7),
      R => '0'
    );
\MO_AXIS_TDATA_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[8]\,
      Q => MO_AXIS_TDATA_OBUF(8),
      R => '0'
    );
\MO_AXIS_TDATA_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TDATA0,
      D => \accumulated_value_reg_n_0_[9]\,
      Q => MO_AXIS_TDATA_OBUF(9),
      R => '0'
    );
\MO_AXIS_TID_OBUF[0]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => MO_AXIS_TID(0),
      T => '1'
    );
\MO_AXIS_TID_OBUF[1]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => MO_AXIS_TID(1),
      T => '1'
    );
\MO_AXIS_TID_OBUF[2]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => MO_AXIS_TID(2),
      T => '1'
    );
\MO_AXIS_TID_OBUF[3]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => MO_AXIS_TID(3),
      T => '1'
    );
\MO_AXIS_TID_OBUF[4]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => MO_AXIS_TID(4),
      T => '1'
    );
\MO_AXIS_TID_OBUF[5]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => MO_AXIS_TID(5),
      T => '1'
    );
\MO_AXIS_TID_OBUF[6]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => MO_AXIS_TID(6),
      T => '1'
    );
\MO_AXIS_TID_OBUF[7]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => MO_AXIS_TID(7),
      T => '1'
    );
MO_AXIS_TLAST_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => MO_AXIS_TVALID_reg_lopt_replica_1,
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
MO_AXIS_TVALID_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => ARESETN_IBUF,
      I1 => currentState(1),
      I2 => currentState(0),
      O => MO_AXIS_TVALID0
    );
MO_AXIS_TVALID_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => currentState(1),
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => currentState(0),
      O => MO_AXIS_TVALID_i_2_n_0
    );
MO_AXIS_TVALID_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TVALID0,
      D => MO_AXIS_TVALID_i_2_n_0,
      Q => MO_AXIS_TLAST_OBUF,
      R => '0'
    );
MO_AXIS_TVALID_reg_lopt_replica: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => MO_AXIS_TVALID0,
      D => MO_AXIS_TVALID_i_2_n_0,
      Q => MO_AXIS_TVALID_reg_lopt_replica_1,
      R => '0'
    );
\SD_AXIS_TDATA_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(0),
      O => SD_AXIS_TDATA_IBUF(0)
    );
\SD_AXIS_TDATA_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(10),
      O => SD_AXIS_TDATA_IBUF(10)
    );
\SD_AXIS_TDATA_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(11),
      O => SD_AXIS_TDATA_IBUF(11)
    );
\SD_AXIS_TDATA_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(12),
      O => SD_AXIS_TDATA_IBUF(12)
    );
\SD_AXIS_TDATA_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(13),
      O => SD_AXIS_TDATA_IBUF(13)
    );
\SD_AXIS_TDATA_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(14),
      O => SD_AXIS_TDATA_IBUF(14)
    );
\SD_AXIS_TDATA_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(15),
      O => SD_AXIS_TDATA_IBUF(15)
    );
\SD_AXIS_TDATA_IBUF[16]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(16),
      O => SD_AXIS_TDATA_IBUF(16)
    );
\SD_AXIS_TDATA_IBUF[17]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(17),
      O => SD_AXIS_TDATA_IBUF(17)
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
\SD_AXIS_TDATA_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(8),
      O => SD_AXIS_TDATA_IBUF(8)
    );
\SD_AXIS_TDATA_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SD_AXIS_TDATA(9),
      O => SD_AXIS_TDATA_IBUF(9)
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
SD_AXIS_TREADY_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => currentState(1),
      I1 => currentState(0),
      O => SD_AXIS_TREADY_i_1_n_0
    );
SD_AXIS_TREADY_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => currentState(0),
      I1 => currentState(1),
      I2 => MO_AXIS_TREADY_IBUF,
      O => SD_AXIS_TREADY_i_2_n_0
    );
SD_AXIS_TREADY_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => SD_AXIS_TREADY_i_1_n_0,
      D => SD_AXIS_TREADY_i_2_n_0,
      PRE => \currentState[1]_i_2_n_0\,
      Q => SD_AXIS_TREADY_OBUF
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
\accumulated_value[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CACAC0CFCACA"
    )
        port map (
      I0 => ARG(0),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TUSER_IBUF,
      I3 => \accumulated_value[0]_i_2_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value[31]_i_4_n_0\,
      O => p_1_in(0)
    );
\accumulated_value[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001DFFDDFF1DFFDD"
    )
        port map (
      I0 => \accumulated_value_reg[2]_i_4_n_7\,
      I1 => SD_AXIS_TDATA_IBUF(17),
      I2 => SD_AXIS_TDATA_IBUF(4),
      I3 => SD_AXIS_TDATA_IBUF(16),
      I4 => SD_AXIS_TDATA_IBUF(0),
      I5 => SD_AXIS_TDATA_IBUF(2),
      O => \accumulated_value[0]_i_2_n_0\
    );
\accumulated_value[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[10]_i_2_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(10),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(10),
      O => p_1_in(10)
    );
\accumulated_value[10]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_12_n_5\,
      I1 => \accumulated_value_reg[14]_i_12_n_7\,
      I2 => \accumulated_value_reg[14]_i_13_n_6\,
      I3 => \accumulated_value[10]_i_6_n_0\,
      O => \accumulated_value[10]_i_10_n_0\
    );
\accumulated_value[10]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_12_n_6\,
      I1 => \accumulated_value_reg[10]_i_13_n_4\,
      I2 => \accumulated_value_reg[14]_i_13_n_7\,
      I3 => \accumulated_value[10]_i_7_n_0\,
      O => \accumulated_value[10]_i_11_n_0\
    );
\accumulated_value[10]_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(15),
      I1 => SD_AXIS_TDATA_IBUF(1),
      O => \accumulated_value[10]_i_15_n_0\
    );
\accumulated_value[10]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(1),
      I1 => SD_AXIS_TDATA_IBUF(15),
      O => \accumulated_value[10]_i_16_n_0\
    );
\accumulated_value[10]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(15),
      O => \accumulated_value[10]_i_17_n_0\
    );
\accumulated_value[10]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"956AC0C0"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(1),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(15),
      O => \accumulated_value[10]_i_18_n_0\
    );
\accumulated_value[10]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(15),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(2),
      O => \accumulated_value[10]_i_19_n_0\
    );
\accumulated_value[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[10]_i_3_n_4\,
      O => \accumulated_value[10]_i_2_n_0\
    );
\accumulated_value[10]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8777"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(15),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(1),
      O => \accumulated_value[10]_i_20_n_0\
    );
\accumulated_value[10]_i_21\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(14),
      O => \accumulated_value[10]_i_21_n_0\
    );
\accumulated_value[10]_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(10),
      I1 => SD_AXIS_TDATA_IBUF(4),
      I2 => SD_AXIS_TDATA_IBUF(9),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TDATA_IBUF(8),
      I5 => SD_AXIS_TDATA_IBUF(6),
      O => \accumulated_value[10]_i_22_n_0\
    );
\accumulated_value[10]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(10),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(9),
      I3 => SD_AXIS_TDATA_IBUF(4),
      I4 => SD_AXIS_TDATA_IBUF(8),
      I5 => SD_AXIS_TDATA_IBUF(5),
      O => \accumulated_value[10]_i_23_n_0\
    );
\accumulated_value[10]_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(10),
      I1 => SD_AXIS_TDATA_IBUF(2),
      I2 => SD_AXIS_TDATA_IBUF(9),
      I3 => SD_AXIS_TDATA_IBUF(3),
      I4 => SD_AXIS_TDATA_IBUF(8),
      I5 => SD_AXIS_TDATA_IBUF(4),
      O => \accumulated_value[10]_i_24_n_0\
    );
\accumulated_value[10]_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(10),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(9),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(8),
      I5 => SD_AXIS_TDATA_IBUF(3),
      O => \accumulated_value[10]_i_25_n_0\
    );
\accumulated_value[10]_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A6A6A959595"
    )
        port map (
      I0 => \accumulated_value[10]_i_22_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(9),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TDATA_IBUF(10),
      I5 => \accumulated_value[10]_i_37_n_0\,
      O => \accumulated_value[10]_i_26_n_0\
    );
\accumulated_value[10]_i_27\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \accumulated_value[10]_i_23_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(10),
      I2 => SD_AXIS_TDATA_IBUF(4),
      I3 => \accumulated_value[10]_i_38_n_0\,
      I4 => SD_AXIS_TDATA_IBUF(8),
      I5 => SD_AXIS_TDATA_IBUF(6),
      O => \accumulated_value[10]_i_27_n_0\
    );
\accumulated_value[10]_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \accumulated_value[10]_i_24_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(10),
      I2 => SD_AXIS_TDATA_IBUF(3),
      I3 => \accumulated_value[10]_i_39_n_0\,
      I4 => SD_AXIS_TDATA_IBUF(8),
      I5 => SD_AXIS_TDATA_IBUF(5),
      O => \accumulated_value[10]_i_28_n_0\
    );
\accumulated_value[10]_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \accumulated_value[10]_i_25_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(10),
      I2 => SD_AXIS_TDATA_IBUF(2),
      I3 => \accumulated_value[10]_i_40_n_0\,
      I4 => SD_AXIS_TDATA_IBUF(8),
      I5 => SD_AXIS_TDATA_IBUF(4),
      O => \accumulated_value[10]_i_29_n_0\
    );
\accumulated_value[10]_i_30\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(11),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(2),
      I3 => SD_AXIS_TDATA_IBUF(12),
      I4 => SD_AXIS_TDATA_IBUF(1),
      I5 => SD_AXIS_TDATA_IBUF(13),
      O => \accumulated_value[10]_i_30_n_0\
    );
\accumulated_value[10]_i_31\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(12),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(13),
      I3 => SD_AXIS_TDATA_IBUF(0),
      O => \accumulated_value[10]_i_31_n_0\
    );
\accumulated_value[10]_i_32\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(12),
      O => \accumulated_value[10]_i_32_n_0\
    );
\accumulated_value[10]_i_33\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A953F3F6A6AC0C0"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(11),
      I3 => SD_AXIS_TDATA_IBUF(0),
      I4 => SD_AXIS_TDATA_IBUF(12),
      I5 => \accumulated_value[10]_i_41_n_0\,
      O => \accumulated_value[10]_i_33_n_0\
    );
\accumulated_value[10]_i_34\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(13),
      I2 => SD_AXIS_TDATA_IBUF(1),
      I3 => SD_AXIS_TDATA_IBUF(12),
      I4 => SD_AXIS_TDATA_IBUF(11),
      I5 => SD_AXIS_TDATA_IBUF(2),
      O => \accumulated_value[10]_i_34_n_0\
    );
\accumulated_value[10]_i_35\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(11),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(12),
      I3 => SD_AXIS_TDATA_IBUF(0),
      O => \accumulated_value[10]_i_35_n_0\
    );
\accumulated_value[10]_i_36\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(11),
      O => \accumulated_value[10]_i_36_n_0\
    );
\accumulated_value[10]_i_37\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(8),
      I1 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[10]_i_37_n_0\
    );
\accumulated_value[10]_i_38\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(5),
      I1 => SD_AXIS_TDATA_IBUF(9),
      O => \accumulated_value[10]_i_38_n_0\
    );
\accumulated_value[10]_i_39\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(9),
      O => \accumulated_value[10]_i_39_n_0\
    );
\accumulated_value[10]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_12_n_4\,
      I1 => \accumulated_value_reg[14]_i_12_n_6\,
      I2 => \accumulated_value_reg[14]_i_13_n_5\,
      O => \accumulated_value[10]_i_4_n_0\
    );
\accumulated_value[10]_i_40\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(3),
      I1 => SD_AXIS_TDATA_IBUF(9),
      O => \accumulated_value[10]_i_40_n_0\
    );
\accumulated_value[10]_i_41\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(1),
      I1 => SD_AXIS_TDATA_IBUF(13),
      O => \accumulated_value[10]_i_41_n_0\
    );
\accumulated_value[10]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_12_n_5\,
      I1 => \accumulated_value_reg[14]_i_12_n_7\,
      I2 => \accumulated_value_reg[14]_i_13_n_6\,
      O => \accumulated_value[10]_i_5_n_0\
    );
\accumulated_value[10]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_12_n_6\,
      I1 => \accumulated_value_reg[10]_i_13_n_4\,
      I2 => \accumulated_value_reg[14]_i_13_n_7\,
      O => \accumulated_value[10]_i_6_n_0\
    );
\accumulated_value[10]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_12_n_7\,
      I1 => \accumulated_value_reg[10]_i_13_n_5\,
      I2 => \accumulated_value_reg[10]_i_14_n_4\,
      O => \accumulated_value[10]_i_7_n_0\
    );
\accumulated_value[10]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \accumulated_value[10]_i_4_n_0\,
      I1 => \accumulated_value_reg[31]_i_18_n_7\,
      I2 => \accumulated_value_reg[14]_i_12_n_1\,
      I3 => \accumulated_value_reg[14]_i_13_n_4\,
      O => \accumulated_value[10]_i_8_n_0\
    );
\accumulated_value[10]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_12_n_4\,
      I1 => \accumulated_value_reg[14]_i_12_n_6\,
      I2 => \accumulated_value_reg[14]_i_13_n_5\,
      I3 => \accumulated_value[10]_i_5_n_0\,
      O => \accumulated_value[10]_i_9_n_0\
    );
\accumulated_value[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[11]_i_2_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(11),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(11),
      O => p_1_in(11)
    );
\accumulated_value[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[14]_i_3_n_7\,
      O => \accumulated_value[11]_i_2_n_0\
    );
\accumulated_value[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[11]\,
      I1 => \accumulated_value_reg[14]_i_3_n_7\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => p_0_out0_in0,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[11]_i_4_n_0\
    );
\accumulated_value[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[10]\,
      I1 => \accumulated_value_reg[10]_i_3_n_4\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => p_0_out0_in0,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[11]_i_5_n_0\
    );
\accumulated_value[11]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[9]\,
      I1 => \accumulated_value_reg[10]_i_3_n_5\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => p_0_out0_in0,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[11]_i_6_n_0\
    );
\accumulated_value[11]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[8]\,
      I1 => \accumulated_value_reg[10]_i_3_n_6\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => p_0_out0_in0,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[11]_i_7_n_0\
    );
\accumulated_value[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[12]_i_2_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(12),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(12),
      O => p_1_in(12)
    );
\accumulated_value[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[14]_i_3_n_6\,
      O => \accumulated_value[12]_i_2_n_0\
    );
\accumulated_value[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[13]_i_2_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(13),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(13),
      O => p_1_in(13)
    );
\accumulated_value[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[14]_i_3_n_5\,
      O => \accumulated_value[13]_i_2_n_0\
    );
\accumulated_value[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[14]_i_2_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(14),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(14),
      O => p_1_in(14)
    );
\accumulated_value[14]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E81717E8"
    )
        port map (
      I0 => \accumulated_value_reg[14]_i_13_n_4\,
      I1 => \accumulated_value_reg[14]_i_12_n_1\,
      I2 => \accumulated_value_reg[31]_i_18_n_7\,
      I3 => \accumulated_value_reg[14]_i_11_n_7\,
      I4 => \accumulated_value_reg[31]_i_18_n_6\,
      O => \accumulated_value[14]_i_10_n_0\
    );
\accumulated_value[14]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(13),
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(12),
      I3 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[14]_i_14_n_0\
    );
\accumulated_value[14]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000EAC0EAC0EAC0"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(12),
      I1 => SD_AXIS_TDATA_IBUF(5),
      I2 => SD_AXIS_TDATA_IBUF(13),
      I3 => SD_AXIS_TDATA_IBUF(6),
      I4 => SD_AXIS_TDATA_IBUF(7),
      I5 => SD_AXIS_TDATA_IBUF(11),
      O => \accumulated_value[14]_i_15_n_0\
    );
\accumulated_value[14]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F3F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(12),
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(13),
      I3 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[14]_i_16_n_0\
    );
\accumulated_value[14]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"25404FBFF03FCF3F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(11),
      I1 => SD_AXIS_TDATA_IBUF(5),
      I2 => SD_AXIS_TDATA_IBUF(13),
      I3 => SD_AXIS_TDATA_IBUF(6),
      I4 => SD_AXIS_TDATA_IBUF(12),
      I5 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[14]_i_17_n_0\
    );
\accumulated_value[14]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(10),
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(9),
      I3 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[14]_i_18_n_0\
    );
\accumulated_value[14]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000EAC0EAC0EAC0"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(9),
      I1 => SD_AXIS_TDATA_IBUF(5),
      I2 => SD_AXIS_TDATA_IBUF(10),
      I3 => SD_AXIS_TDATA_IBUF(6),
      I4 => SD_AXIS_TDATA_IBUF(8),
      I5 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[14]_i_19_n_0\
    );
\accumulated_value[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[14]_i_3_n_4\,
      O => \accumulated_value[14]_i_2_n_0\
    );
\accumulated_value[14]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F3F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(9),
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(10),
      I3 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[14]_i_20_n_0\
    );
\accumulated_value[14]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"25404FBFF03FCF3F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(8),
      I1 => SD_AXIS_TDATA_IBUF(5),
      I2 => SD_AXIS_TDATA_IBUF(10),
      I3 => SD_AXIS_TDATA_IBUF(6),
      I4 => SD_AXIS_TDATA_IBUF(9),
      I5 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[14]_i_21_n_0\
    );
\accumulated_value[14]_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(13),
      I1 => SD_AXIS_TDATA_IBUF(4),
      I2 => SD_AXIS_TDATA_IBUF(12),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TDATA_IBUF(6),
      I5 => SD_AXIS_TDATA_IBUF(11),
      O => \accumulated_value[14]_i_22_n_0\
    );
\accumulated_value[14]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(13),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(12),
      I3 => SD_AXIS_TDATA_IBUF(4),
      I4 => SD_AXIS_TDATA_IBUF(5),
      I5 => SD_AXIS_TDATA_IBUF(11),
      O => \accumulated_value[14]_i_23_n_0\
    );
\accumulated_value[14]_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(13),
      I1 => SD_AXIS_TDATA_IBUF(2),
      I2 => SD_AXIS_TDATA_IBUF(12),
      I3 => SD_AXIS_TDATA_IBUF(3),
      I4 => SD_AXIS_TDATA_IBUF(4),
      I5 => SD_AXIS_TDATA_IBUF(11),
      O => \accumulated_value[14]_i_24_n_0\
    );
\accumulated_value[14]_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(13),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(12),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(3),
      I5 => SD_AXIS_TDATA_IBUF(11),
      O => \accumulated_value[14]_i_25_n_0\
    );
\accumulated_value[14]_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A6A6A959595"
    )
        port map (
      I0 => \accumulated_value[14]_i_22_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(12),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TDATA_IBUF(13),
      I5 => \accumulated_value[14]_i_30_n_0\,
      O => \accumulated_value[14]_i_26_n_0\
    );
\accumulated_value[14]_i_27\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \accumulated_value[14]_i_23_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(13),
      I2 => SD_AXIS_TDATA_IBUF(4),
      I3 => \accumulated_value[14]_i_31_n_0\,
      I4 => SD_AXIS_TDATA_IBUF(6),
      I5 => SD_AXIS_TDATA_IBUF(11),
      O => \accumulated_value[14]_i_27_n_0\
    );
\accumulated_value[14]_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \accumulated_value[14]_i_24_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(13),
      I2 => SD_AXIS_TDATA_IBUF(3),
      I3 => \accumulated_value[14]_i_32_n_0\,
      I4 => SD_AXIS_TDATA_IBUF(5),
      I5 => SD_AXIS_TDATA_IBUF(11),
      O => \accumulated_value[14]_i_28_n_0\
    );
\accumulated_value[14]_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \accumulated_value[14]_i_25_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(13),
      I2 => SD_AXIS_TDATA_IBUF(2),
      I3 => \accumulated_value[14]_i_33_n_0\,
      I4 => SD_AXIS_TDATA_IBUF(4),
      I5 => SD_AXIS_TDATA_IBUF(11),
      O => \accumulated_value[14]_i_29_n_0\
    );
\accumulated_value[14]_i_30\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(7),
      I1 => SD_AXIS_TDATA_IBUF(11),
      O => \accumulated_value[14]_i_30_n_0\
    );
\accumulated_value[14]_i_31\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(5),
      I1 => SD_AXIS_TDATA_IBUF(12),
      O => \accumulated_value[14]_i_31_n_0\
    );
\accumulated_value[14]_i_32\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(12),
      O => \accumulated_value[14]_i_32_n_0\
    );
\accumulated_value[14]_i_33\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(3),
      I1 => SD_AXIS_TDATA_IBUF(12),
      O => \accumulated_value[14]_i_33_n_0\
    );
\accumulated_value[14]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \accumulated_value_reg[31]_i_18_n_5\,
      I1 => \accumulated_value_reg[14]_i_11_n_6\,
      O => \accumulated_value[14]_i_4_n_0\
    );
\accumulated_value[14]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \accumulated_value_reg[31]_i_18_n_6\,
      I1 => \accumulated_value_reg[14]_i_11_n_7\,
      O => \accumulated_value[14]_i_5_n_0\
    );
\accumulated_value[14]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \accumulated_value_reg[31]_i_18_n_7\,
      I1 => \accumulated_value_reg[14]_i_12_n_1\,
      I2 => \accumulated_value_reg[14]_i_13_n_4\,
      O => \accumulated_value[14]_i_6_n_0\
    );
\accumulated_value[14]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \accumulated_value_reg[14]_i_11_n_1\,
      I1 => \accumulated_value_reg[31]_i_18_n_4\,
      I2 => \accumulated_value_reg[31]_i_15_n_7\,
      O => \accumulated_value[14]_i_7_n_0\
    );
\accumulated_value[14]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \accumulated_value_reg[14]_i_11_n_6\,
      I1 => \accumulated_value_reg[31]_i_18_n_5\,
      I2 => \accumulated_value_reg[14]_i_11_n_1\,
      I3 => \accumulated_value_reg[31]_i_18_n_4\,
      O => \accumulated_value[14]_i_8_n_0\
    );
\accumulated_value[14]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \accumulated_value_reg[14]_i_11_n_7\,
      I1 => \accumulated_value_reg[31]_i_18_n_6\,
      I2 => \accumulated_value_reg[14]_i_11_n_6\,
      I3 => \accumulated_value_reg[31]_i_18_n_5\,
      O => \accumulated_value[14]_i_9_n_0\
    );
\accumulated_value[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(15),
      O => p_1_in(15)
    );
\accumulated_value[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001DFF1DFFE200E2"
    )
        port map (
      I0 => p_0_out0,
      I1 => SD_AXIS_TDATA_IBUF(17),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(16),
      I4 => \accumulated_value[31]_i_6_n_0\,
      I5 => \accumulated_value_reg_n_0_[15]\,
      O => \accumulated_value[15]_i_3_n_0\
    );
\accumulated_value[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[14]\,
      I1 => \accumulated_value_reg[14]_i_3_n_4\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => p_0_out0_in0,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[15]_i_4_n_0\
    );
\accumulated_value[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[13]\,
      I1 => \accumulated_value_reg[14]_i_3_n_5\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => p_0_out0_in0,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[15]_i_5_n_0\
    );
\accumulated_value[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[12]\,
      I1 => \accumulated_value_reg[14]_i_3_n_6\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => p_0_out0_in0,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[15]_i_6_n_0\
    );
\accumulated_value[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(16),
      O => p_1_in(16)
    );
\accumulated_value[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(17),
      O => p_1_in(17)
    );
\accumulated_value[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(18),
      O => p_1_in(18)
    );
\accumulated_value[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(19),
      O => p_1_in(19)
    );
\accumulated_value[19]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"001DFF1D"
    )
        port map (
      I0 => p_0_out0,
      I1 => SD_AXIS_TDATA_IBUF(17),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(16),
      I4 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[19]_i_3_n_0\
    );
\accumulated_value[19]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[18]\,
      I1 => \accumulated_value_reg_n_0_[19]\,
      O => \accumulated_value[19]_i_4_n_0\
    );
\accumulated_value[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[17]\,
      I1 => \accumulated_value_reg_n_0_[18]\,
      O => \accumulated_value[19]_i_5_n_0\
    );
\accumulated_value[19]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[16]\,
      I1 => \accumulated_value_reg_n_0_[17]\,
      O => \accumulated_value[19]_i_6_n_0\
    );
\accumulated_value[19]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001DFF1DFFE200E2"
    )
        port map (
      I0 => p_0_out0,
      I1 => SD_AXIS_TDATA_IBUF(17),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(16),
      I4 => \accumulated_value[31]_i_6_n_0\,
      I5 => \accumulated_value_reg_n_0_[16]\,
      O => \accumulated_value[19]_i_7_n_0\
    );
\accumulated_value[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CACAC0CFCACA"
    )
        port map (
      I0 => ARG(1),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TUSER_IBUF,
      I3 => \accumulated_value[1]_i_2_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value[31]_i_4_n_0\,
      O => p_1_in(1)
    );
\accumulated_value[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB8888BB8B8B8B8B"
    )
        port map (
      I0 => \accumulated_value[1]_i_3_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => \accumulated_value_reg[2]_i_4_n_6\,
      I3 => \accumulated_value[1]_i_4_n_0\,
      I4 => \accumulated_value[1]_i_5_n_0\,
      I5 => SD_AXIS_TDATA_IBUF(17),
      O => \accumulated_value[1]_i_2_n_0\
    );
\accumulated_value[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8777"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(3),
      I3 => SD_AXIS_TDATA_IBUF(0),
      O => \accumulated_value[1]_i_3_n_0\
    );
\accumulated_value[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(1),
      I1 => SD_AXIS_TDATA_IBUF(4),
      O => \accumulated_value[1]_i_4_n_0\
    );
\accumulated_value[1]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(5),
      O => \accumulated_value[1]_i_5_n_0\
    );
\accumulated_value[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(20),
      O => p_1_in(20)
    );
\accumulated_value[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(21),
      O => p_1_in(21)
    );
\accumulated_value[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(22),
      O => p_1_in(22)
    );
\accumulated_value[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(23),
      O => p_1_in(23)
    );
\accumulated_value[23]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[22]\,
      I1 => \accumulated_value_reg_n_0_[23]\,
      O => \accumulated_value[23]_i_3_n_0\
    );
\accumulated_value[23]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[21]\,
      I1 => \accumulated_value_reg_n_0_[22]\,
      O => \accumulated_value[23]_i_4_n_0\
    );
\accumulated_value[23]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[20]\,
      I1 => \accumulated_value_reg_n_0_[21]\,
      O => \accumulated_value[23]_i_5_n_0\
    );
\accumulated_value[23]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[19]\,
      I1 => \accumulated_value_reg_n_0_[20]\,
      O => \accumulated_value[23]_i_6_n_0\
    );
\accumulated_value[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(24),
      O => p_1_in(24)
    );
\accumulated_value[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(25),
      O => p_1_in(25)
    );
\accumulated_value[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(26),
      O => p_1_in(26)
    );
\accumulated_value[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(27),
      O => p_1_in(27)
    );
\accumulated_value[27]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[26]\,
      I1 => \accumulated_value_reg_n_0_[27]\,
      O => \accumulated_value[27]_i_3_n_0\
    );
\accumulated_value[27]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[25]\,
      I1 => \accumulated_value_reg_n_0_[26]\,
      O => \accumulated_value[27]_i_4_n_0\
    );
\accumulated_value[27]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[24]\,
      I1 => \accumulated_value_reg_n_0_[25]\,
      O => \accumulated_value[27]_i_5_n_0\
    );
\accumulated_value[27]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[23]\,
      I1 => \accumulated_value_reg_n_0_[24]\,
      O => \accumulated_value[27]_i_6_n_0\
    );
\accumulated_value[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(28),
      O => p_1_in(28)
    );
\accumulated_value[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(29),
      O => p_1_in(29)
    );
\accumulated_value[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[2]_i_2_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(2),
      O => p_1_in(2)
    );
\accumulated_value[2]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(1),
      I1 => SD_AXIS_TDATA_IBUF(8),
      I2 => SD_AXIS_TDATA_IBUF(9),
      I3 => SD_AXIS_TDATA_IBUF(0),
      O => \accumulated_value[2]_i_10_n_0\
    );
\accumulated_value[2]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(8),
      I1 => SD_AXIS_TDATA_IBUF(0),
      O => \accumulated_value[2]_i_11_n_0\
    );
\accumulated_value[2]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(1),
      I1 => SD_AXIS_TDATA_IBUF(10),
      O => \accumulated_value[2]_i_12_n_0\
    );
\accumulated_value[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \accumulated_value[2]_i_3_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => \accumulated_value_reg[5]_i_3_n_7\,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[2]_i_4_n_5\,
      O => \accumulated_value[2]_i_2_n_0\
    );
\accumulated_value[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3848"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(1),
      I3 => SD_AXIS_TDATA_IBUF(2),
      O => \accumulated_value[2]_i_3_n_0\
    );
\accumulated_value[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(3),
      I1 => SD_AXIS_TDATA_IBUF(8),
      I2 => SD_AXIS_TDATA_IBUF(2),
      I3 => SD_AXIS_TDATA_IBUF(9),
      I4 => SD_AXIS_TDATA_IBUF(1),
      I5 => SD_AXIS_TDATA_IBUF(10),
      O => \accumulated_value[2]_i_5_n_0\
    );
\accumulated_value[2]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(9),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(10),
      I3 => SD_AXIS_TDATA_IBUF(0),
      O => \accumulated_value[2]_i_6_n_0\
    );
\accumulated_value[2]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(9),
      O => \accumulated_value[2]_i_7_n_0\
    );
\accumulated_value[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A953F3F6A6AC0C0"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => SD_AXIS_TDATA_IBUF(8),
      I2 => SD_AXIS_TDATA_IBUF(3),
      I3 => SD_AXIS_TDATA_IBUF(0),
      I4 => SD_AXIS_TDATA_IBUF(9),
      I5 => \accumulated_value[2]_i_12_n_0\,
      O => \accumulated_value[2]_i_8_n_0\
    );
\accumulated_value[2]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(10),
      I2 => SD_AXIS_TDATA_IBUF(1),
      I3 => SD_AXIS_TDATA_IBUF(9),
      I4 => SD_AXIS_TDATA_IBUF(2),
      I5 => SD_AXIS_TDATA_IBUF(8),
      O => \accumulated_value[2]_i_9_n_0\
    );
\accumulated_value[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(30),
      O => p_1_in(30)
    );
\accumulated_value[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5C0C"
    )
        port map (
      I0 => currentState(0),
      I1 => SD_AXIS_TVALID_IBUF,
      I2 => currentState(1),
      I3 => MO_AXIS_TREADY_IBUF,
      O => accumulated_value
    );
\accumulated_value[31]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[29]\,
      I1 => \accumulated_value_reg_n_0_[30]\,
      O => \accumulated_value[31]_i_10_n_0\
    );
\accumulated_value[31]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[28]\,
      I1 => \accumulated_value_reg_n_0_[29]\,
      O => \accumulated_value[31]_i_11_n_0\
    );
\accumulated_value[31]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[27]\,
      I1 => \accumulated_value_reg_n_0_[28]\,
      O => \accumulated_value[31]_i_12_n_0\
    );
\accumulated_value[31]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"70"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(7),
      I1 => SD_AXIS_TDATA_IBUF(2),
      I2 => \accumulated_value[31]_i_16_n_0\,
      O => \accumulated_value[31]_i_13_n_0\
    );
\accumulated_value[31]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFFFFFC3B3FF4FFF"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(5),
      I1 => SD_AXIS_TDATA_IBUF(2),
      I2 => SD_AXIS_TDATA_IBUF(3),
      I3 => SD_AXIS_TDATA_IBUF(6),
      I4 => \accumulated_value[31]_i_17_n_0\,
      I5 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[31]_i_14_n_0\
    );
\accumulated_value[31]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DA00A288A28825FF"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(3),
      I1 => SD_AXIS_TDATA_IBUF(5),
      I2 => SD_AXIS_TDATA_IBUF(2),
      I3 => SD_AXIS_TDATA_IBUF(6),
      I4 => \accumulated_value[5]_i_12_n_0\,
      I5 => \accumulated_value[5]_i_11_n_0\,
      O => \accumulated_value[31]_i_16_n_0\
    );
\accumulated_value[31]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8888EEE8EEE8EEE"
    )
        port map (
      I0 => \accumulated_value[5]_i_11_n_0\,
      I1 => \accumulated_value[5]_i_12_n_0\,
      I2 => SD_AXIS_TDATA_IBUF(6),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(5),
      I5 => SD_AXIS_TDATA_IBUF(3),
      O => \accumulated_value[31]_i_17_n_0\
    );
\accumulated_value[31]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0777"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(15),
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[31]_i_19_n_0\
    );
\accumulated_value[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[31]_i_3_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(15),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(31),
      O => p_1_in(31)
    );
\accumulated_value[31]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E53F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(14),
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(15),
      I3 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[31]_i_20_n_0\
    );
\accumulated_value[31]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(15),
      I1 => SD_AXIS_TDATA_IBUF(5),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(6),
      O => \accumulated_value[31]_i_21_n_0\
    );
\accumulated_value[31]_i_22\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(15),
      I1 => SD_AXIS_TDATA_IBUF(4),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(5),
      O => \accumulated_value[31]_i_22_n_0\
    );
\accumulated_value[31]_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(15),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(4),
      O => \accumulated_value[31]_i_23_n_0\
    );
\accumulated_value[31]_i_24\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(15),
      I1 => SD_AXIS_TDATA_IBUF(2),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(3),
      O => \accumulated_value[31]_i_24_n_0\
    );
\accumulated_value[31]_i_25\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6FC030C0"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(5),
      I1 => SD_AXIS_TDATA_IBUF(7),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(6),
      I4 => SD_AXIS_TDATA_IBUF(15),
      O => \accumulated_value[31]_i_25_n_0\
    );
\accumulated_value[31]_i_26\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"903FCF3F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TDATA_IBUF(15),
      O => \accumulated_value[31]_i_26_n_0\
    );
\accumulated_value[31]_i_27\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"903FCF3F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(3),
      I1 => SD_AXIS_TDATA_IBUF(5),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(4),
      I4 => SD_AXIS_TDATA_IBUF(15),
      O => \accumulated_value[31]_i_27_n_0\
    );
\accumulated_value[31]_i_28\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"903FCF3F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => SD_AXIS_TDATA_IBUF(4),
      I2 => SD_AXIS_TDATA_IBUF(14),
      I3 => SD_AXIS_TDATA_IBUF(3),
      I4 => SD_AXIS_TDATA_IBUF(15),
      O => \accumulated_value[31]_i_28_n_0\
    );
\accumulated_value[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => p_0_out0,
      O => \accumulated_value[31]_i_3_n_0\
    );
\accumulated_value[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF000000FFFFF0BB"
    )
        port map (
      I0 => outputOccurred,
      I1 => SD_AXIS_TLAST_IBUF,
      I2 => MO_AXIS_TREADY_IBUF,
      I3 => currentState(1),
      I4 => currentState(0),
      I5 => SD_AXIS_TVALID_IBUF,
      O => \accumulated_value[31]_i_4_n_0\
    );
\accumulated_value[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(1),
      I3 => SD_AXIS_TDATA_IBUF(2),
      O => \accumulated_value[31]_i_6_n_0\
    );
\accumulated_value[31]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[30]\,
      I1 => \accumulated_value_reg_n_0_[31]\,
      O => \accumulated_value[31]_i_9_n_0\
    );
\accumulated_value[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CACAC0CFCACA"
    )
        port map (
      I0 => ARG(3),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TUSER_IBUF,
      I3 => \accumulated_value[3]_i_3_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value[31]_i_4_n_0\,
      O => p_1_in(3)
    );
\accumulated_value[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47444777"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => \accumulated_value_reg[5]_i_3_n_6\,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[6]_i_3_n_7\,
      O => \accumulated_value[3]_i_3_n_0\
    );
\accumulated_value[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[3]\,
      I1 => \accumulated_value_reg[6]_i_3_n_7\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => \accumulated_value_reg[5]_i_3_n_6\,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[3]_i_4_n_0\
    );
\accumulated_value[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[2]\,
      I1 => \accumulated_value_reg[2]_i_4_n_5\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => \accumulated_value_reg[5]_i_3_n_7\,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[2]_i_3_n_0\,
      O => \accumulated_value[3]_i_5_n_0\
    );
\accumulated_value[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[1]\,
      I1 => \accumulated_value[1]_i_2_n_0\,
      O => \accumulated_value[3]_i_6_n_0\
    );
\accumulated_value[3]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[0]\,
      I1 => \accumulated_value[0]_i_2_n_0\,
      O => \accumulated_value[3]_i_7_n_0\
    );
\accumulated_value[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CACAC0CFCACA"
    )
        port map (
      I0 => ARG(4),
      I1 => SD_AXIS_TDATA_IBUF(4),
      I2 => SD_AXIS_TUSER_IBUF,
      I3 => \accumulated_value[4]_i_2_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value[31]_i_4_n_0\,
      O => p_1_in(4)
    );
\accumulated_value[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47444777"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => \accumulated_value_reg[5]_i_3_n_5\,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[6]_i_3_n_6\,
      O => \accumulated_value[4]_i_2_n_0\
    );
\accumulated_value[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CACAC0CFCACA"
    )
        port map (
      I0 => ARG(5),
      I1 => SD_AXIS_TDATA_IBUF(5),
      I2 => SD_AXIS_TUSER_IBUF,
      I3 => \accumulated_value[5]_i_2_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value[31]_i_4_n_0\,
      O => p_1_in(5)
    );
\accumulated_value[5]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"663C5AF066CCAA00"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TDATA_IBUF(1),
      I3 => SD_AXIS_TDATA_IBUF(4),
      I4 => SD_AXIS_TDATA_IBUF(0),
      I5 => SD_AXIS_TDATA_IBUF(5),
      O => \accumulated_value[5]_i_10_n_0\
    );
\accumulated_value[5]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40000000D5555555"
    )
        port map (
      I0 => \accumulated_value[5]_i_13_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(5),
      I3 => SD_AXIS_TDATA_IBUF(1),
      I4 => SD_AXIS_TDATA_IBUF(6),
      I5 => \accumulated_value[5]_i_15_n_0\,
      O => \accumulated_value[5]_i_11_n_0\
    );
\accumulated_value[5]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000EAC0EAC0EAC0"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(5),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(6),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(3),
      I5 => SD_AXIS_TDATA_IBUF(4),
      O => \accumulated_value[5]_i_12_n_0\
    );
\accumulated_value[5]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1F3FFFFF5FFF7FFF"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(5),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(4),
      I3 => SD_AXIS_TDATA_IBUF(1),
      I4 => SD_AXIS_TDATA_IBUF(2),
      I5 => SD_AXIS_TDATA_IBUF(6),
      O => \accumulated_value[5]_i_13_n_0\
    );
\accumulated_value[5]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(6),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(5),
      I3 => SD_AXIS_TDATA_IBUF(0),
      O => \accumulated_value[5]_i_14_n_0\
    );
\accumulated_value[5]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(4),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(2),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TDATA_IBUF(1),
      I5 => SD_AXIS_TDATA_IBUF(6),
      O => \accumulated_value[5]_i_15_n_0\
    );
\accumulated_value[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47444777"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => \accumulated_value_reg[5]_i_3_n_4\,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[6]_i_3_n_5\,
      O => \accumulated_value[5]_i_2_n_0\
    );
\accumulated_value[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9666699969996999"
    )
        port map (
      I0 => \accumulated_value[5]_i_11_n_0\,
      I1 => \accumulated_value[5]_i_12_n_0\,
      I2 => SD_AXIS_TDATA_IBUF(6),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TDATA_IBUF(5),
      I5 => SD_AXIS_TDATA_IBUF(3),
      O => \accumulated_value[5]_i_4_n_0\
    );
\accumulated_value[5]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \accumulated_value[5]_i_4_n_0\,
      O => \accumulated_value[5]_i_5_n_0\
    );
\accumulated_value[5]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(0),
      I1 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[5]_i_6_n_0\
    );
\accumulated_value[5]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6999"
    )
        port map (
      I0 => \accumulated_value[5]_i_4_n_0\,
      I1 => \accumulated_value[31]_i_16_n_0\,
      I2 => SD_AXIS_TDATA_IBUF(2),
      I3 => SD_AXIS_TDATA_IBUF(7),
      O => \accumulated_value[5]_i_7_n_0\
    );
\accumulated_value[5]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \accumulated_value[5]_i_4_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(7),
      I2 => SD_AXIS_TDATA_IBUF(1),
      O => \accumulated_value[5]_i_8_n_0\
    );
\accumulated_value[5]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \accumulated_value[5]_i_6_n_0\,
      I1 => \accumulated_value[5]_i_13_n_0\,
      I2 => \accumulated_value[5]_i_14_n_0\,
      I3 => \accumulated_value[5]_i_15_n_0\,
      O => \accumulated_value[5]_i_9_n_0\
    );
\accumulated_value[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CACAC0CFCACA"
    )
        port map (
      I0 => ARG(6),
      I1 => SD_AXIS_TDATA_IBUF(6),
      I2 => SD_AXIS_TUSER_IBUF,
      I3 => \accumulated_value[6]_i_2_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value[31]_i_4_n_0\,
      O => p_1_in(6)
    );
\accumulated_value[6]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \accumulated_value_reg[2]_i_4_n_4\,
      I1 => \accumulated_value_reg[10]_i_14_n_7\,
      O => \accumulated_value[6]_i_10_n_0\
    );
\accumulated_value[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47444777"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => \accumulated_value_reg[31]_i_7_n_7\,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[6]_i_3_n_4\,
      O => \accumulated_value[6]_i_2_n_0\
    );
\accumulated_value[6]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_14_n_5\,
      I1 => \accumulated_value_reg[10]_i_13_n_6\,
      O => \accumulated_value[6]_i_4_n_0\
    );
\accumulated_value[6]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_14_n_6\,
      I1 => \accumulated_value_reg[10]_i_13_n_7\,
      O => \accumulated_value[6]_i_5_n_0\
    );
\accumulated_value[6]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \accumulated_value_reg[2]_i_4_n_4\,
      I1 => \accumulated_value_reg[10]_i_14_n_7\,
      O => \accumulated_value[6]_i_6_n_0\
    );
\accumulated_value[6]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_12_n_7\,
      I1 => \accumulated_value_reg[10]_i_13_n_5\,
      I2 => \accumulated_value_reg[10]_i_14_n_4\,
      I3 => \accumulated_value[6]_i_4_n_0\,
      O => \accumulated_value[6]_i_7_n_0\
    );
\accumulated_value[6]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9666"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_14_n_5\,
      I1 => \accumulated_value_reg[10]_i_13_n_6\,
      I2 => \accumulated_value_reg[10]_i_13_n_7\,
      I3 => \accumulated_value_reg[10]_i_14_n_6\,
      O => \accumulated_value[6]_i_8_n_0\
    );
\accumulated_value[6]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \accumulated_value_reg[10]_i_14_n_7\,
      I1 => \accumulated_value_reg[2]_i_4_n_4\,
      I2 => \accumulated_value_reg[10]_i_13_n_7\,
      I3 => \accumulated_value_reg[10]_i_14_n_6\,
      O => \accumulated_value[6]_i_9_n_0\
    );
\accumulated_value[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[7]_i_2_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(7),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(7),
      O => p_1_in(7)
    );
\accumulated_value[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[10]_i_3_n_7\,
      O => \accumulated_value[7]_i_2_n_0\
    );
\accumulated_value[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[7]\,
      I1 => \accumulated_value_reg[10]_i_3_n_7\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => p_0_out0_in0,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[7]_i_4_n_0\
    );
\accumulated_value[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[6]\,
      I1 => \accumulated_value_reg[6]_i_3_n_4\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => \accumulated_value_reg[31]_i_7_n_7\,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[7]_i_5_n_0\
    );
\accumulated_value[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[5]\,
      I1 => \accumulated_value_reg[6]_i_3_n_5\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => \accumulated_value_reg[5]_i_3_n_4\,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[7]_i_6_n_0\
    );
\accumulated_value[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[4]\,
      I1 => \accumulated_value_reg[6]_i_3_n_6\,
      I2 => SD_AXIS_TDATA_IBUF(17),
      I3 => \accumulated_value_reg[5]_i_3_n_5\,
      I4 => SD_AXIS_TDATA_IBUF(16),
      I5 => \accumulated_value[31]_i_6_n_0\,
      O => \accumulated_value[7]_i_7_n_0\
    );
\accumulated_value[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[8]_i_2_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(8),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(8),
      O => p_1_in(8)
    );
\accumulated_value[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[10]_i_3_n_6\,
      O => \accumulated_value[8]_i_2_n_0\
    );
\accumulated_value[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F002F2F3F002020"
    )
        port map (
      I0 => \accumulated_value[9]_i_2_n_0\,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(9),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => ARG(9),
      O => p_1_in(9)
    );
\accumulated_value[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \accumulated_value[31]_i_6_n_0\,
      I1 => SD_AXIS_TDATA_IBUF(16),
      I2 => p_0_out0_in0,
      I3 => SD_AXIS_TDATA_IBUF(17),
      I4 => \accumulated_value_reg[10]_i_3_n_5\,
      O => \accumulated_value[9]_i_2_n_0\
    );
\accumulated_value_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(0),
      Q => \accumulated_value_reg_n_0_[0]\
    );
\accumulated_value_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(10),
      Q => \accumulated_value_reg_n_0_[10]\
    );
\accumulated_value_reg[10]_i_12\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \accumulated_value_reg[10]_i_12_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[10]_i_12_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value[10]_i_15_n_0\,
      DI(2) => \accumulated_value[10]_i_16_n_0\,
      DI(1) => \accumulated_value[10]_i_17_n_0\,
      DI(0) => '0',
      O(3) => \accumulated_value_reg[10]_i_12_n_4\,
      O(2) => \accumulated_value_reg[10]_i_12_n_5\,
      O(1) => \accumulated_value_reg[10]_i_12_n_6\,
      O(0) => \accumulated_value_reg[10]_i_12_n_7\,
      S(3) => \accumulated_value[10]_i_18_n_0\,
      S(2) => \accumulated_value[10]_i_19_n_0\,
      S(1) => \accumulated_value[10]_i_20_n_0\,
      S(0) => \accumulated_value[10]_i_21_n_0\
    );
\accumulated_value_reg[10]_i_13\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[2]_i_4_n_0\,
      CO(3) => \accumulated_value_reg[10]_i_13_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[10]_i_13_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value[10]_i_22_n_0\,
      DI(2) => \accumulated_value[10]_i_23_n_0\,
      DI(1) => \accumulated_value[10]_i_24_n_0\,
      DI(0) => \accumulated_value[10]_i_25_n_0\,
      O(3) => \accumulated_value_reg[10]_i_13_n_4\,
      O(2) => \accumulated_value_reg[10]_i_13_n_5\,
      O(1) => \accumulated_value_reg[10]_i_13_n_6\,
      O(0) => \accumulated_value_reg[10]_i_13_n_7\,
      S(3) => \accumulated_value[10]_i_26_n_0\,
      S(2) => \accumulated_value[10]_i_27_n_0\,
      S(1) => \accumulated_value[10]_i_28_n_0\,
      S(0) => \accumulated_value[10]_i_29_n_0\
    );
\accumulated_value_reg[10]_i_14\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \accumulated_value_reg[10]_i_14_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[10]_i_14_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value[10]_i_30_n_0\,
      DI(2) => \accumulated_value[10]_i_31_n_0\,
      DI(1) => \accumulated_value[10]_i_32_n_0\,
      DI(0) => '0',
      O(3) => \accumulated_value_reg[10]_i_14_n_4\,
      O(2) => \accumulated_value_reg[10]_i_14_n_5\,
      O(1) => \accumulated_value_reg[10]_i_14_n_6\,
      O(0) => \accumulated_value_reg[10]_i_14_n_7\,
      S(3) => \accumulated_value[10]_i_33_n_0\,
      S(2) => \accumulated_value[10]_i_34_n_0\,
      S(1) => \accumulated_value[10]_i_35_n_0\,
      S(0) => \accumulated_value[10]_i_36_n_0\
    );
\accumulated_value_reg[10]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[6]_i_3_n_0\,
      CO(3) => \accumulated_value_reg[10]_i_3_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[10]_i_3_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value[10]_i_4_n_0\,
      DI(2) => \accumulated_value[10]_i_5_n_0\,
      DI(1) => \accumulated_value[10]_i_6_n_0\,
      DI(0) => \accumulated_value[10]_i_7_n_0\,
      O(3) => \accumulated_value_reg[10]_i_3_n_4\,
      O(2) => \accumulated_value_reg[10]_i_3_n_5\,
      O(1) => \accumulated_value_reg[10]_i_3_n_6\,
      O(0) => \accumulated_value_reg[10]_i_3_n_7\,
      S(3) => \accumulated_value[10]_i_8_n_0\,
      S(2) => \accumulated_value[10]_i_9_n_0\,
      S(1) => \accumulated_value[10]_i_10_n_0\,
      S(0) => \accumulated_value[10]_i_11_n_0\
    );
\accumulated_value_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(11),
      Q => \accumulated_value_reg_n_0_[11]\
    );
\accumulated_value_reg[11]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[7]_i_3_n_0\,
      CO(3) => \accumulated_value_reg[11]_i_3_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[11]_i_3_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value_reg_n_0_[11]\,
      DI(2) => \accumulated_value_reg_n_0_[10]\,
      DI(1) => \accumulated_value_reg_n_0_[9]\,
      DI(0) => \accumulated_value_reg_n_0_[8]\,
      O(3 downto 0) => ARG(11 downto 8),
      S(3) => \accumulated_value[11]_i_4_n_0\,
      S(2) => \accumulated_value[11]_i_5_n_0\,
      S(1) => \accumulated_value[11]_i_6_n_0\,
      S(0) => \accumulated_value[11]_i_7_n_0\
    );
\accumulated_value_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(12),
      Q => \accumulated_value_reg_n_0_[12]\
    );
\accumulated_value_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(13),
      Q => \accumulated_value_reg_n_0_[13]\
    );
\accumulated_value_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(14),
      Q => \accumulated_value_reg_n_0_[14]\
    );
\accumulated_value_reg[14]_i_11\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[14]_i_13_n_0\,
      CO(3) => \NLW_accumulated_value_reg[14]_i_11_CO_UNCONNECTED\(3),
      CO(2) => \accumulated_value_reg[14]_i_11_n_1\,
      CO(1 downto 0) => \NLW_accumulated_value_reg[14]_i_11_CO_UNCONNECTED\(1 downto 0),
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \accumulated_value[14]_i_14_n_0\,
      DI(0) => \accumulated_value[14]_i_15_n_0\,
      O(3 downto 2) => \NLW_accumulated_value_reg[14]_i_11_O_UNCONNECTED\(3 downto 2),
      O(1) => \accumulated_value_reg[14]_i_11_n_6\,
      O(0) => \accumulated_value_reg[14]_i_11_n_7\,
      S(3 downto 2) => B"01",
      S(1) => \accumulated_value[14]_i_16_n_0\,
      S(0) => \accumulated_value[14]_i_17_n_0\
    );
\accumulated_value_reg[14]_i_12\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[10]_i_13_n_0\,
      CO(3) => \NLW_accumulated_value_reg[14]_i_12_CO_UNCONNECTED\(3),
      CO(2) => \accumulated_value_reg[14]_i_12_n_1\,
      CO(1 downto 0) => \NLW_accumulated_value_reg[14]_i_12_CO_UNCONNECTED\(1 downto 0),
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \accumulated_value[14]_i_18_n_0\,
      DI(0) => \accumulated_value[14]_i_19_n_0\,
      O(3 downto 2) => \NLW_accumulated_value_reg[14]_i_12_O_UNCONNECTED\(3 downto 2),
      O(1) => \accumulated_value_reg[14]_i_12_n_6\,
      O(0) => \accumulated_value_reg[14]_i_12_n_7\,
      S(3 downto 2) => B"01",
      S(1) => \accumulated_value[14]_i_20_n_0\,
      S(0) => \accumulated_value[14]_i_21_n_0\
    );
\accumulated_value_reg[14]_i_13\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[10]_i_14_n_0\,
      CO(3) => \accumulated_value_reg[14]_i_13_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[14]_i_13_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value[14]_i_22_n_0\,
      DI(2) => \accumulated_value[14]_i_23_n_0\,
      DI(1) => \accumulated_value[14]_i_24_n_0\,
      DI(0) => \accumulated_value[14]_i_25_n_0\,
      O(3) => \accumulated_value_reg[14]_i_13_n_4\,
      O(2) => \accumulated_value_reg[14]_i_13_n_5\,
      O(1) => \accumulated_value_reg[14]_i_13_n_6\,
      O(0) => \accumulated_value_reg[14]_i_13_n_7\,
      S(3) => \accumulated_value[14]_i_26_n_0\,
      S(2) => \accumulated_value[14]_i_27_n_0\,
      S(1) => \accumulated_value[14]_i_28_n_0\,
      S(0) => \accumulated_value[14]_i_29_n_0\
    );
\accumulated_value_reg[14]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[10]_i_3_n_0\,
      CO(3) => \accumulated_value_reg[14]_i_3_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[14]_i_3_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value_reg[31]_i_15_n_7\,
      DI(2) => \accumulated_value[14]_i_4_n_0\,
      DI(1) => \accumulated_value[14]_i_5_n_0\,
      DI(0) => \accumulated_value[14]_i_6_n_0\,
      O(3) => \accumulated_value_reg[14]_i_3_n_4\,
      O(2) => \accumulated_value_reg[14]_i_3_n_5\,
      O(1) => \accumulated_value_reg[14]_i_3_n_6\,
      O(0) => \accumulated_value_reg[14]_i_3_n_7\,
      S(3) => \accumulated_value[14]_i_7_n_0\,
      S(2) => \accumulated_value[14]_i_8_n_0\,
      S(1) => \accumulated_value[14]_i_9_n_0\,
      S(0) => \accumulated_value[14]_i_10_n_0\
    );
\accumulated_value_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(15),
      Q => \accumulated_value_reg_n_0_[15]\
    );
\accumulated_value_reg[15]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[11]_i_3_n_0\,
      CO(3) => \accumulated_value_reg[15]_i_2_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[15]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value[31]_i_3_n_0\,
      DI(2) => \accumulated_value_reg_n_0_[14]\,
      DI(1) => \accumulated_value_reg_n_0_[13]\,
      DI(0) => \accumulated_value_reg_n_0_[12]\,
      O(3 downto 0) => ARG(15 downto 12),
      S(3) => \accumulated_value[15]_i_3_n_0\,
      S(2) => \accumulated_value[15]_i_4_n_0\,
      S(1) => \accumulated_value[15]_i_5_n_0\,
      S(0) => \accumulated_value[15]_i_6_n_0\
    );
\accumulated_value_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(16),
      Q => \accumulated_value_reg_n_0_[16]\
    );
\accumulated_value_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(17),
      Q => \accumulated_value_reg_n_0_[17]\
    );
\accumulated_value_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(18),
      Q => \accumulated_value_reg_n_0_[18]\
    );
\accumulated_value_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(19),
      Q => \accumulated_value_reg_n_0_[19]\
    );
\accumulated_value_reg[19]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[15]_i_2_n_0\,
      CO(3) => \accumulated_value_reg[19]_i_2_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[19]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value_reg_n_0_[18]\,
      DI(2) => \accumulated_value_reg_n_0_[17]\,
      DI(1) => \accumulated_value_reg_n_0_[16]\,
      DI(0) => \accumulated_value[19]_i_3_n_0\,
      O(3 downto 0) => ARG(19 downto 16),
      S(3) => \accumulated_value[19]_i_4_n_0\,
      S(2) => \accumulated_value[19]_i_5_n_0\,
      S(1) => \accumulated_value[19]_i_6_n_0\,
      S(0) => \accumulated_value[19]_i_7_n_0\
    );
\accumulated_value_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(1),
      Q => \accumulated_value_reg_n_0_[1]\
    );
\accumulated_value_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(20),
      Q => \accumulated_value_reg_n_0_[20]\
    );
\accumulated_value_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(21),
      Q => \accumulated_value_reg_n_0_[21]\
    );
\accumulated_value_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(22),
      Q => \accumulated_value_reg_n_0_[22]\
    );
\accumulated_value_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(23),
      Q => \accumulated_value_reg_n_0_[23]\
    );
\accumulated_value_reg[23]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[19]_i_2_n_0\,
      CO(3) => \accumulated_value_reg[23]_i_2_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[23]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value_reg_n_0_[22]\,
      DI(2) => \accumulated_value_reg_n_0_[21]\,
      DI(1) => \accumulated_value_reg_n_0_[20]\,
      DI(0) => \accumulated_value_reg_n_0_[19]\,
      O(3 downto 0) => ARG(23 downto 20),
      S(3) => \accumulated_value[23]_i_3_n_0\,
      S(2) => \accumulated_value[23]_i_4_n_0\,
      S(1) => \accumulated_value[23]_i_5_n_0\,
      S(0) => \accumulated_value[23]_i_6_n_0\
    );
\accumulated_value_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(24),
      Q => \accumulated_value_reg_n_0_[24]\
    );
\accumulated_value_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(25),
      Q => \accumulated_value_reg_n_0_[25]\
    );
\accumulated_value_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(26),
      Q => \accumulated_value_reg_n_0_[26]\
    );
\accumulated_value_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(27),
      Q => \accumulated_value_reg_n_0_[27]\
    );
\accumulated_value_reg[27]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[23]_i_2_n_0\,
      CO(3) => \accumulated_value_reg[27]_i_2_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[27]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value_reg_n_0_[26]\,
      DI(2) => \accumulated_value_reg_n_0_[25]\,
      DI(1) => \accumulated_value_reg_n_0_[24]\,
      DI(0) => \accumulated_value_reg_n_0_[23]\,
      O(3 downto 0) => ARG(27 downto 24),
      S(3) => \accumulated_value[27]_i_3_n_0\,
      S(2) => \accumulated_value[27]_i_4_n_0\,
      S(1) => \accumulated_value[27]_i_5_n_0\,
      S(0) => \accumulated_value[27]_i_6_n_0\
    );
\accumulated_value_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(28),
      Q => \accumulated_value_reg_n_0_[28]\
    );
\accumulated_value_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(29),
      Q => \accumulated_value_reg_n_0_[29]\
    );
\accumulated_value_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(2),
      Q => \accumulated_value_reg_n_0_[2]\
    );
\accumulated_value_reg[2]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \accumulated_value_reg[2]_i_4_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[2]_i_4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value[2]_i_5_n_0\,
      DI(2) => \accumulated_value[2]_i_6_n_0\,
      DI(1) => \accumulated_value[2]_i_7_n_0\,
      DI(0) => '0',
      O(3) => \accumulated_value_reg[2]_i_4_n_4\,
      O(2) => \accumulated_value_reg[2]_i_4_n_5\,
      O(1) => \accumulated_value_reg[2]_i_4_n_6\,
      O(0) => \accumulated_value_reg[2]_i_4_n_7\,
      S(3) => \accumulated_value[2]_i_8_n_0\,
      S(2) => \accumulated_value[2]_i_9_n_0\,
      S(1) => \accumulated_value[2]_i_10_n_0\,
      S(0) => \accumulated_value[2]_i_11_n_0\
    );
\accumulated_value_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(30),
      Q => \accumulated_value_reg_n_0_[30]\
    );
\accumulated_value_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(31),
      Q => \accumulated_value_reg_n_0_[31]\
    );
\accumulated_value_reg[31]_i_15\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[31]_i_18_n_0\,
      CO(3 downto 0) => \NLW_accumulated_value_reg[31]_i_15_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \accumulated_value[31]_i_19_n_0\,
      O(3 downto 2) => \NLW_accumulated_value_reg[31]_i_15_O_UNCONNECTED\(3 downto 2),
      O(1) => \accumulated_value_reg[31]_i_15_n_6\,
      O(0) => \accumulated_value_reg[31]_i_15_n_7\,
      S(3 downto 1) => B"001",
      S(0) => \accumulated_value[31]_i_20_n_0\
    );
\accumulated_value_reg[31]_i_18\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[10]_i_12_n_0\,
      CO(3) => \accumulated_value_reg[31]_i_18_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[31]_i_18_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value[31]_i_21_n_0\,
      DI(2) => \accumulated_value[31]_i_22_n_0\,
      DI(1) => \accumulated_value[31]_i_23_n_0\,
      DI(0) => \accumulated_value[31]_i_24_n_0\,
      O(3) => \accumulated_value_reg[31]_i_18_n_4\,
      O(2) => \accumulated_value_reg[31]_i_18_n_5\,
      O(1) => \accumulated_value_reg[31]_i_18_n_6\,
      O(0) => \accumulated_value_reg[31]_i_18_n_7\,
      S(3) => \accumulated_value[31]_i_25_n_0\,
      S(2) => \accumulated_value[31]_i_26_n_0\,
      S(1) => \accumulated_value[31]_i_27_n_0\,
      S(0) => \accumulated_value[31]_i_28_n_0\
    );
\accumulated_value_reg[31]_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[27]_i_2_n_0\,
      CO(3 downto 0) => \NLW_accumulated_value_reg[31]_i_5_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \accumulated_value_reg_n_0_[29]\,
      DI(1) => \accumulated_value_reg_n_0_[28]\,
      DI(0) => \accumulated_value_reg_n_0_[27]\,
      O(3 downto 0) => ARG(31 downto 28),
      S(3) => \accumulated_value[31]_i_9_n_0\,
      S(2) => \accumulated_value[31]_i_10_n_0\,
      S(1) => \accumulated_value[31]_i_11_n_0\,
      S(0) => \accumulated_value[31]_i_12_n_0\
    );
\accumulated_value_reg[31]_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[5]_i_3_n_0\,
      CO(3 downto 0) => \NLW_accumulated_value_reg[31]_i_7_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \accumulated_value[31]_i_13_n_0\,
      O(3 downto 2) => \NLW_accumulated_value_reg[31]_i_7_O_UNCONNECTED\(3 downto 2),
      O(1) => p_0_out0_in0,
      O(0) => \accumulated_value_reg[31]_i_7_n_7\,
      S(3 downto 1) => B"001",
      S(0) => \accumulated_value[31]_i_14_n_0\
    );
\accumulated_value_reg[31]_i_8\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[14]_i_3_n_0\,
      CO(3 downto 0) => \NLW_accumulated_value_reg[31]_i_8_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_accumulated_value_reg[31]_i_8_O_UNCONNECTED\(3 downto 1),
      O(0) => p_0_out0,
      S(3 downto 1) => B"000",
      S(0) => \accumulated_value_reg[31]_i_15_n_6\
    );
\accumulated_value_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(3),
      Q => \accumulated_value_reg_n_0_[3]\
    );
\accumulated_value_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \accumulated_value_reg[3]_i_2_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[3]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value_reg_n_0_[3]\,
      DI(2) => \accumulated_value_reg_n_0_[2]\,
      DI(1) => \accumulated_value_reg_n_0_[1]\,
      DI(0) => \accumulated_value_reg_n_0_[0]\,
      O(3 downto 0) => ARG(3 downto 0),
      S(3) => \accumulated_value[3]_i_4_n_0\,
      S(2) => \accumulated_value[3]_i_5_n_0\,
      S(1) => \accumulated_value[3]_i_6_n_0\,
      S(0) => \accumulated_value[3]_i_7_n_0\
    );
\accumulated_value_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(4),
      Q => \accumulated_value_reg_n_0_[4]\
    );
\accumulated_value_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(5),
      Q => \accumulated_value_reg_n_0_[5]\
    );
\accumulated_value_reg[5]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \accumulated_value_reg[5]_i_3_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[5]_i_3_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value[5]_i_4_n_0\,
      DI(2) => \accumulated_value[5]_i_5_n_0\,
      DI(1) => \accumulated_value[5]_i_6_n_0\,
      DI(0) => '0',
      O(3) => \accumulated_value_reg[5]_i_3_n_4\,
      O(2) => \accumulated_value_reg[5]_i_3_n_5\,
      O(1) => \accumulated_value_reg[5]_i_3_n_6\,
      O(0) => \accumulated_value_reg[5]_i_3_n_7\,
      S(3) => \accumulated_value[5]_i_7_n_0\,
      S(2) => \accumulated_value[5]_i_8_n_0\,
      S(1) => \accumulated_value[5]_i_9_n_0\,
      S(0) => \accumulated_value[5]_i_10_n_0\
    );
\accumulated_value_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(6),
      Q => \accumulated_value_reg_n_0_[6]\
    );
\accumulated_value_reg[6]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \accumulated_value_reg[6]_i_3_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[6]_i_3_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value[6]_i_4_n_0\,
      DI(2) => \accumulated_value[6]_i_5_n_0\,
      DI(1) => \accumulated_value[6]_i_6_n_0\,
      DI(0) => '0',
      O(3) => \accumulated_value_reg[6]_i_3_n_4\,
      O(2) => \accumulated_value_reg[6]_i_3_n_5\,
      O(1) => \accumulated_value_reg[6]_i_3_n_6\,
      O(0) => \accumulated_value_reg[6]_i_3_n_7\,
      S(3) => \accumulated_value[6]_i_7_n_0\,
      S(2) => \accumulated_value[6]_i_8_n_0\,
      S(1) => \accumulated_value[6]_i_9_n_0\,
      S(0) => \accumulated_value[6]_i_10_n_0\
    );
\accumulated_value_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(7),
      Q => \accumulated_value_reg_n_0_[7]\
    );
\accumulated_value_reg[7]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[3]_i_2_n_0\,
      CO(3) => \accumulated_value_reg[7]_i_3_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[7]_i_3_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value_reg_n_0_[7]\,
      DI(2) => \accumulated_value_reg_n_0_[6]\,
      DI(1) => \accumulated_value_reg_n_0_[5]\,
      DI(0) => \accumulated_value_reg_n_0_[4]\,
      O(3 downto 0) => ARG(7 downto 4),
      S(3) => \accumulated_value[7]_i_4_n_0\,
      S(2) => \accumulated_value[7]_i_5_n_0\,
      S(1) => \accumulated_value[7]_i_6_n_0\,
      S(0) => \accumulated_value[7]_i_7_n_0\
    );
\accumulated_value_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(8),
      Q => \accumulated_value_reg_n_0_[8]\
    );
\accumulated_value_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => accumulated_value,
      CLR => \currentState[1]_i_2_n_0\,
      D => p_1_in(9),
      Q => \accumulated_value_reg_n_0_[9]\
    );
\currentState[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002A0A"
    )
        port map (
      I0 => SD_AXIS_TVALID_IBUF,
      I1 => currentState(0),
      I2 => currentState(1),
      I3 => MO_AXIS_TREADY_IBUF,
      I4 => SD_AXIS_TLAST_IBUF,
      O => nextState(0)
    );
\currentState[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F3F040704040404"
    )
        port map (
      I0 => MO_AXIS_TREADY_IBUF,
      I1 => currentState(1),
      I2 => currentState(0),
      I3 => outputOccurred,
      I4 => SD_AXIS_TVALID_IBUF,
      I5 => SD_AXIS_TLAST_IBUF,
      O => nextState(1)
    );
\currentState[1]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ARESETN_IBUF,
      O => \currentState[1]_i_2_n_0\
    );
\currentState_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => '1',
      CLR => \currentState[1]_i_2_n_0\,
      D => nextState(0),
      Q => currentState(0)
    );
\currentState_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => '1',
      CLR => \currentState[1]_i_2_n_0\,
      D => nextState(1),
      Q => currentState(1)
    );
outputOccurred_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00002000"
    )
        port map (
      I0 => ARESETN_IBUF,
      I1 => currentState(0),
      I2 => outputOccurred_i_2_n_0,
      I3 => currentState(1),
      I4 => nextState(0),
      I5 => outputOccurred,
      O => outputOccurred_i_1_n_0
    );
outputOccurred_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF777775FF007775"
    )
        port map (
      I0 => SD_AXIS_TLAST_IBUF,
      I1 => SD_AXIS_TVALID_IBUF,
      I2 => outputOccurred,
      I3 => currentState(0),
      I4 => currentState(1),
      I5 => MO_AXIS_TREADY_IBUF,
      O => outputOccurred_i_2_n_0
    );
outputOccurred_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK_IBUF_BUFG,
      CE => '1',
      D => outputOccurred_i_1_n_0,
      Q => outputOccurred,
      R => '0'
    );
end STRUCTURE;
