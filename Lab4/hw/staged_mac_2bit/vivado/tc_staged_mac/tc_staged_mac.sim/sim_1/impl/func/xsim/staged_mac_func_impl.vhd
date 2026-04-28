-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Mon Oct 27 17:35:54 2025
-- Host        : co2050-04.ece.iastate.edu running 64-bit unknown
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/cam2022/CPRE-487_git/CPRE-4870/Lab4/hw/staged_mac_2bit/vivado/tc_staged_mac/tc_staged_mac.sim/sim_1/impl/func/xsim/staged_mac_func_impl.vhd
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
  attribute NotValidForBitStream of staged_mac : entity is true;
  attribute C_DATA_WIDTH : integer;
  attribute C_DATA_WIDTH of staged_mac : entity is 2;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of staged_mac : entity is "4d7df86f";
end staged_mac;

architecture STRUCTURE of staged_mac is
  signal ACLK_IBUF : STD_LOGIC;
  signal ACLK_IBUF_BUFG : STD_LOGIC;
  signal ARESETN_IBUF : STD_LOGIC;
  signal MO_AXIS_TDATA0 : STD_LOGIC;
  signal \MO_AXIS_TDATA[31]_i_2_n_0\ : STD_LOGIC;
  signal MO_AXIS_TDATA_OBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MO_AXIS_TLAST_OBUF : STD_LOGIC;
  signal MO_AXIS_TREADY_IBUF : STD_LOGIC;
  signal MO_AXIS_TVALID0 : STD_LOGIC;
  signal MO_AXIS_TVALID_i_2_n_0 : STD_LOGIC;
  signal MO_AXIS_TVALID_reg_lopt_replica_1 : STD_LOGIC;
  signal RESIZE : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal SD_AXIS_TDATA_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal SD_AXIS_TLAST_IBUF : STD_LOGIC;
  signal SD_AXIS_TREADY_OBUF : STD_LOGIC;
  signal SD_AXIS_TREADY_i_1_n_0 : STD_LOGIC;
  signal SD_AXIS_TREADY_i_2_n_0 : STD_LOGIC;
  signal SD_AXIS_TUSER_IBUF : STD_LOGIC;
  signal SD_AXIS_TVALID_IBUF : STD_LOGIC;
  signal accumulated_value : STD_LOGIC;
  signal \accumulated_value[11]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[11]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[11]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[11]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[15]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[15]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[15]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[15]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[19]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[19]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[19]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[19]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[23]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[23]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[23]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[23]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[27]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[27]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[27]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[27]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_8_n_0\ : STD_LOGIC;
  signal \accumulated_value[31]_i_9_n_0\ : STD_LOGIC;
  signal \accumulated_value[3]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[3]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[3]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[3]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[7]_i_3_n_0\ : STD_LOGIC;
  signal \accumulated_value[7]_i_4_n_0\ : STD_LOGIC;
  signal \accumulated_value[7]_i_5_n_0\ : STD_LOGIC;
  signal \accumulated_value[7]_i_6_n_0\ : STD_LOGIC;
  signal \accumulated_value[7]_i_7_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[11]_i_2_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[11]_i_2_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[11]_i_2_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[11]_i_2_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[15]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[15]_i_2_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[15]_i_2_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[15]_i_2_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[15]_i_2_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[19]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[19]_i_2_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[19]_i_2_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[19]_i_2_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[19]_i_2_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[23]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[23]_i_2_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[23]_i_2_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[23]_i_2_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[23]_i_2_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[27]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[27]_i_2_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[27]_i_2_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[27]_i_2_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[27]_i_2_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_5_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_5_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[31]_i_5_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[3]_i_2_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[3]_i_2_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[3]_i_2_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[3]_i_2_n_7\ : STD_LOGIC;
  signal \accumulated_value_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \accumulated_value_reg[7]_i_2_n_4\ : STD_LOGIC;
  signal \accumulated_value_reg[7]_i_2_n_5\ : STD_LOGIC;
  signal \accumulated_value_reg[7]_i_2_n_6\ : STD_LOGIC;
  signal \accumulated_value_reg[7]_i_2_n_7\ : STD_LOGIC;
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
  signal p_0_in0 : STD_LOGIC;
  signal p_0_out0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_accumulated_value_reg[11]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[15]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[19]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[23]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[27]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[31]_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_accumulated_value_reg[3]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_accumulated_value_reg[7]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute sigis : string;
  attribute sigis of ACLK_IBUF_inst : label is "Clk";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of MO_AXIS_TLAST_OBUF_inst : label is "SWEEP";
  attribute OPT_MODIFIED of MO_AXIS_TVALID_OBUF_inst : label is "SWEEP";
  attribute OPT_INSERTED_REPDRIVER : boolean;
  attribute OPT_INSERTED_REPDRIVER of MO_AXIS_TVALID_reg_lopt_replica : label is std.standard.true;
  attribute OPT_MODIFIED of MO_AXIS_TVALID_reg_lopt_replica : label is "SWEEP";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \accumulated_value_reg[11]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[11]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[15]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[15]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[19]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[19]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[23]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[23]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[27]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[27]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[31]_i_5\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[31]_i_5\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[3]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[3]_i_2\ : label is "SWEEP";
  attribute ADDER_THRESHOLD of \accumulated_value_reg[7]_i_2\ : label is 35;
  attribute OPT_MODIFIED of \accumulated_value_reg[7]_i_2\ : label is "SWEEP";
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
      INIT => X"2000"
    )
        port map (
      I0 => ARESETN_IBUF,
      I1 => currentState(0),
      I2 => \MO_AXIS_TDATA[31]_i_2_n_0\,
      I3 => currentState(1),
      O => MO_AXIS_TDATA0
    );
\MO_AXIS_TDATA[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCCCFCFEFCFFFCFF"
    )
        port map (
      I0 => outputOccurred,
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => currentState(0),
      I3 => currentState(1),
      I4 => SD_AXIS_TVALID_IBUF,
      I5 => SD_AXIS_TLAST_IBUF,
      O => \MO_AXIS_TDATA[31]_i_2_n_0\
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
      I1 => currentState(0),
      I2 => currentState(1),
      O => MO_AXIS_TVALID0
    );
MO_AXIS_TVALID_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => currentState(0),
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => currentState(1),
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
      INIT => X"EF"
    )
        port map (
      I0 => currentState(0),
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => currentState(1),
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
      INIT => X"CF008F0FCF008000"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(0),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => \accumulated_value_reg[3]_i_2_n_7\,
      O => p_1_in(0)
    );
\accumulated_value[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[11]_i_2_n_5\,
      O => p_1_in(10)
    );
\accumulated_value[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[11]_i_2_n_4\,
      O => p_1_in(11)
    );
\accumulated_value[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[10]\,
      I1 => \accumulated_value_reg_n_0_[11]\,
      O => \accumulated_value[11]_i_3_n_0\
    );
\accumulated_value[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[9]\,
      I1 => \accumulated_value_reg_n_0_[10]\,
      O => \accumulated_value[11]_i_4_n_0\
    );
\accumulated_value[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[8]\,
      I1 => \accumulated_value_reg_n_0_[9]\,
      O => \accumulated_value[11]_i_5_n_0\
    );
\accumulated_value[11]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[7]\,
      I1 => \accumulated_value_reg_n_0_[8]\,
      O => \accumulated_value[11]_i_6_n_0\
    );
\accumulated_value[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[15]_i_2_n_7\,
      O => p_1_in(12)
    );
\accumulated_value[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[15]_i_2_n_6\,
      O => p_1_in(13)
    );
\accumulated_value[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[15]_i_2_n_5\,
      O => p_1_in(14)
    );
\accumulated_value[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[15]_i_2_n_4\,
      O => p_1_in(15)
    );
\accumulated_value[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[14]\,
      I1 => \accumulated_value_reg_n_0_[15]\,
      O => \accumulated_value[15]_i_3_n_0\
    );
\accumulated_value[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[13]\,
      I1 => \accumulated_value_reg_n_0_[14]\,
      O => \accumulated_value[15]_i_4_n_0\
    );
\accumulated_value[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[12]\,
      I1 => \accumulated_value_reg_n_0_[13]\,
      O => \accumulated_value[15]_i_5_n_0\
    );
\accumulated_value[15]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[11]\,
      I1 => \accumulated_value_reg_n_0_[12]\,
      O => \accumulated_value[15]_i_6_n_0\
    );
\accumulated_value[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[19]_i_2_n_7\,
      O => p_1_in(16)
    );
\accumulated_value[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[19]_i_2_n_6\,
      O => p_1_in(17)
    );
\accumulated_value[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[19]_i_2_n_5\,
      O => p_1_in(18)
    );
\accumulated_value[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[19]_i_2_n_4\,
      O => p_1_in(19)
    );
\accumulated_value[19]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[18]\,
      I1 => \accumulated_value_reg_n_0_[19]\,
      O => \accumulated_value[19]_i_3_n_0\
    );
\accumulated_value[19]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[17]\,
      I1 => \accumulated_value_reg_n_0_[18]\,
      O => \accumulated_value[19]_i_4_n_0\
    );
\accumulated_value[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[16]\,
      I1 => \accumulated_value_reg_n_0_[17]\,
      O => \accumulated_value[19]_i_5_n_0\
    );
\accumulated_value[19]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[15]\,
      I1 => \accumulated_value_reg_n_0_[16]\,
      O => \accumulated_value[19]_i_6_n_0\
    );
\accumulated_value[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CF008F8FCF008080"
    )
        port map (
      I0 => RESIZE(1),
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(1),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => \accumulated_value_reg[3]_i_2_n_6\,
      O => p_1_in(1)
    );
\accumulated_value[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(3),
      I3 => SD_AXIS_TDATA_IBUF(0),
      O => RESIZE(1)
    );
\accumulated_value[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[23]_i_2_n_7\,
      O => p_1_in(20)
    );
\accumulated_value[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[23]_i_2_n_6\,
      O => p_1_in(21)
    );
\accumulated_value[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[23]_i_2_n_5\,
      O => p_1_in(22)
    );
\accumulated_value[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[23]_i_2_n_4\,
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
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[27]_i_2_n_7\,
      O => p_1_in(24)
    );
\accumulated_value[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[27]_i_2_n_6\,
      O => p_1_in(25)
    );
\accumulated_value[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[27]_i_2_n_5\,
      O => p_1_in(26)
    );
\accumulated_value[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[27]_i_2_n_4\,
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
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[31]_i_5_n_7\,
      O => p_1_in(28)
    );
\accumulated_value[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[31]_i_5_n_6\,
      O => p_1_in(29)
    );
\accumulated_value[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CF008F8FCF008080"
    )
        port map (
      I0 => RESIZE(2),
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => \accumulated_value_reg[3]_i_2_n_5\,
      O => p_1_in(2)
    );
\accumulated_value[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1AC0"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(3),
      I3 => SD_AXIS_TDATA_IBUF(1),
      O => RESIZE(2)
    );
\accumulated_value[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[31]_i_5_n_5\,
      O => p_1_in(30)
    );
\accumulated_value[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44F0"
    )
        port map (
      I0 => currentState(0),
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => SD_AXIS_TVALID_IBUF,
      I3 => currentState(1),
      O => accumulated_value
    );
\accumulated_value[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => p_0_out0,
      O => p_1_in(31)
    );
\accumulated_value[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6240"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(1),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(0),
      I3 => SD_AXIS_TDATA_IBUF(2),
      O => p_0_in0
    );
\accumulated_value[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F000F0F0F4FFF4"
    )
        port map (
      I0 => outputOccurred,
      I1 => SD_AXIS_TLAST_IBUF,
      I2 => SD_AXIS_TVALID_IBUF,
      I3 => currentState(1),
      I4 => MO_AXIS_TREADY_IBUF,
      I5 => currentState(0),
      O => \accumulated_value[31]_i_4_n_0\
    );
\accumulated_value[31]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[30]\,
      I1 => \accumulated_value_reg_n_0_[31]\,
      O => \accumulated_value[31]_i_6_n_0\
    );
\accumulated_value[31]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[29]\,
      I1 => \accumulated_value_reg_n_0_[30]\,
      O => \accumulated_value[31]_i_7_n_0\
    );
\accumulated_value[31]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[28]\,
      I1 => \accumulated_value_reg_n_0_[29]\,
      O => \accumulated_value[31]_i_8_n_0\
    );
\accumulated_value[31]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[27]\,
      I1 => \accumulated_value_reg_n_0_[28]\,
      O => \accumulated_value[31]_i_9_n_0\
    );
\accumulated_value[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CF008F8FCF008080"
    )
        port map (
      I0 => p_0_in0,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(3),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => \accumulated_value_reg[3]_i_2_n_4\,
      O => p_1_in(3)
    );
\accumulated_value[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9DBF6240"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(1),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(0),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => \accumulated_value_reg_n_0_[3]\,
      O => \accumulated_value[3]_i_3_n_0\
    );
\accumulated_value[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96A69A6A"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[2]\,
      I1 => SD_AXIS_TDATA_IBUF(1),
      I2 => SD_AXIS_TDATA_IBUF(3),
      I3 => SD_AXIS_TDATA_IBUF(0),
      I4 => SD_AXIS_TDATA_IBUF(2),
      O => \accumulated_value[3]_i_4_n_0\
    );
\accumulated_value[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"956A6A6A"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[1]\,
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(3),
      I3 => SD_AXIS_TDATA_IBUF(1),
      I4 => SD_AXIS_TDATA_IBUF(2),
      O => \accumulated_value[3]_i_5_n_0\
    );
\accumulated_value[3]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[0]\,
      I1 => SD_AXIS_TDATA_IBUF(2),
      I2 => SD_AXIS_TDATA_IBUF(0),
      O => \accumulated_value[3]_i_6_n_0\
    );
\accumulated_value[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CF008F8FCF008080"
    )
        port map (
      I0 => p_0_in0,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(4),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => \accumulated_value_reg[7]_i_2_n_7\,
      O => p_1_in(4)
    );
\accumulated_value[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CF008F8FCF008080"
    )
        port map (
      I0 => p_0_in0,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(5),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => \accumulated_value_reg[7]_i_2_n_6\,
      O => p_1_in(5)
    );
\accumulated_value[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CF008F8FCF008080"
    )
        port map (
      I0 => p_0_in0,
      I1 => \accumulated_value[31]_i_4_n_0\,
      I2 => currentState(1),
      I3 => SD_AXIS_TDATA_IBUF(6),
      I4 => SD_AXIS_TUSER_IBUF,
      I5 => \accumulated_value_reg[7]_i_2_n_5\,
      O => p_1_in(6)
    );
\accumulated_value[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[7]_i_2_n_4\,
      O => p_1_in(7)
    );
\accumulated_value[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F53F"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(2),
      I1 => SD_AXIS_TDATA_IBUF(0),
      I2 => SD_AXIS_TDATA_IBUF(3),
      I3 => SD_AXIS_TDATA_IBUF(1),
      O => \accumulated_value[7]_i_3_n_0\
    );
\accumulated_value[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[6]\,
      I1 => \accumulated_value_reg_n_0_[7]\,
      O => \accumulated_value[7]_i_4_n_0\
    );
\accumulated_value[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[5]\,
      I1 => \accumulated_value_reg_n_0_[6]\,
      O => \accumulated_value[7]_i_5_n_0\
    );
\accumulated_value[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \accumulated_value_reg_n_0_[4]\,
      I1 => \accumulated_value_reg_n_0_[5]\,
      O => \accumulated_value[7]_i_6_n_0\
    );
\accumulated_value[7]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9DBF6240"
    )
        port map (
      I0 => SD_AXIS_TDATA_IBUF(1),
      I1 => SD_AXIS_TDATA_IBUF(3),
      I2 => SD_AXIS_TDATA_IBUF(0),
      I3 => SD_AXIS_TDATA_IBUF(2),
      I4 => \accumulated_value_reg_n_0_[4]\,
      O => \accumulated_value[7]_i_7_n_0\
    );
\accumulated_value[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[11]_i_2_n_7\,
      O => p_1_in(8)
    );
\accumulated_value[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200F3F3E200C0C0"
    )
        port map (
      I0 => p_0_in0,
      I1 => SD_AXIS_TUSER_IBUF,
      I2 => SD_AXIS_TDATA_IBUF(7),
      I3 => \accumulated_value[31]_i_4_n_0\,
      I4 => currentState(1),
      I5 => \accumulated_value_reg[11]_i_2_n_6\,
      O => p_1_in(9)
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
\accumulated_value_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[7]_i_2_n_0\,
      CO(3) => \accumulated_value_reg[11]_i_2_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[11]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value_reg_n_0_[10]\,
      DI(2) => \accumulated_value_reg_n_0_[9]\,
      DI(1) => \accumulated_value_reg_n_0_[8]\,
      DI(0) => \accumulated_value_reg_n_0_[7]\,
      O(3) => \accumulated_value_reg[11]_i_2_n_4\,
      O(2) => \accumulated_value_reg[11]_i_2_n_5\,
      O(1) => \accumulated_value_reg[11]_i_2_n_6\,
      O(0) => \accumulated_value_reg[11]_i_2_n_7\,
      S(3) => \accumulated_value[11]_i_3_n_0\,
      S(2) => \accumulated_value[11]_i_4_n_0\,
      S(1) => \accumulated_value[11]_i_5_n_0\,
      S(0) => \accumulated_value[11]_i_6_n_0\
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
      CI => \accumulated_value_reg[11]_i_2_n_0\,
      CO(3) => \accumulated_value_reg[15]_i_2_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[15]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value_reg_n_0_[14]\,
      DI(2) => \accumulated_value_reg_n_0_[13]\,
      DI(1) => \accumulated_value_reg_n_0_[12]\,
      DI(0) => \accumulated_value_reg_n_0_[11]\,
      O(3) => \accumulated_value_reg[15]_i_2_n_4\,
      O(2) => \accumulated_value_reg[15]_i_2_n_5\,
      O(1) => \accumulated_value_reg[15]_i_2_n_6\,
      O(0) => \accumulated_value_reg[15]_i_2_n_7\,
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
      DI(0) => \accumulated_value_reg_n_0_[15]\,
      O(3) => \accumulated_value_reg[19]_i_2_n_4\,
      O(2) => \accumulated_value_reg[19]_i_2_n_5\,
      O(1) => \accumulated_value_reg[19]_i_2_n_6\,
      O(0) => \accumulated_value_reg[19]_i_2_n_7\,
      S(3) => \accumulated_value[19]_i_3_n_0\,
      S(2) => \accumulated_value[19]_i_4_n_0\,
      S(1) => \accumulated_value[19]_i_5_n_0\,
      S(0) => \accumulated_value[19]_i_6_n_0\
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
      O(3) => \accumulated_value_reg[23]_i_2_n_4\,
      O(2) => \accumulated_value_reg[23]_i_2_n_5\,
      O(1) => \accumulated_value_reg[23]_i_2_n_6\,
      O(0) => \accumulated_value_reg[23]_i_2_n_7\,
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
      O(3) => \accumulated_value_reg[27]_i_2_n_4\,
      O(2) => \accumulated_value_reg[27]_i_2_n_5\,
      O(1) => \accumulated_value_reg[27]_i_2_n_6\,
      O(0) => \accumulated_value_reg[27]_i_2_n_7\,
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
\accumulated_value_reg[31]_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[27]_i_2_n_0\,
      CO(3 downto 0) => \NLW_accumulated_value_reg[31]_i_5_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \accumulated_value_reg_n_0_[29]\,
      DI(1) => \accumulated_value_reg_n_0_[28]\,
      DI(0) => \accumulated_value_reg_n_0_[27]\,
      O(3) => p_0_out0,
      O(2) => \accumulated_value_reg[31]_i_5_n_5\,
      O(1) => \accumulated_value_reg[31]_i_5_n_6\,
      O(0) => \accumulated_value_reg[31]_i_5_n_7\,
      S(3) => \accumulated_value[31]_i_6_n_0\,
      S(2) => \accumulated_value[31]_i_7_n_0\,
      S(1) => \accumulated_value[31]_i_8_n_0\,
      S(0) => \accumulated_value[31]_i_9_n_0\
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
      O(3) => \accumulated_value_reg[3]_i_2_n_4\,
      O(2) => \accumulated_value_reg[3]_i_2_n_5\,
      O(1) => \accumulated_value_reg[3]_i_2_n_6\,
      O(0) => \accumulated_value_reg[3]_i_2_n_7\,
      S(3) => \accumulated_value[3]_i_3_n_0\,
      S(2) => \accumulated_value[3]_i_4_n_0\,
      S(1) => \accumulated_value[3]_i_5_n_0\,
      S(0) => \accumulated_value[3]_i_6_n_0\
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
\accumulated_value_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \accumulated_value_reg[3]_i_2_n_0\,
      CO(3) => \accumulated_value_reg[7]_i_2_n_0\,
      CO(2 downto 0) => \NLW_accumulated_value_reg[7]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \accumulated_value_reg_n_0_[6]\,
      DI(2) => \accumulated_value_reg_n_0_[5]\,
      DI(1) => \accumulated_value_reg_n_0_[4]\,
      DI(0) => \accumulated_value[7]_i_3_n_0\,
      O(3) => \accumulated_value_reg[7]_i_2_n_4\,
      O(2) => \accumulated_value_reg[7]_i_2_n_5\,
      O(1) => \accumulated_value_reg[7]_i_2_n_6\,
      O(0) => \accumulated_value_reg[7]_i_2_n_7\,
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
      INIT => X"00004F00"
    )
        port map (
      I0 => currentState(0),
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => currentState(1),
      I3 => SD_AXIS_TVALID_IBUF,
      I4 => SD_AXIS_TLAST_IBUF,
      O => nextState(0)
    );
\currentState[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5F1010105F151010"
    )
        port map (
      I0 => currentState(0),
      I1 => MO_AXIS_TREADY_IBUF,
      I2 => currentState(1),
      I3 => SD_AXIS_TVALID_IBUF,
      I4 => SD_AXIS_TLAST_IBUF,
      I5 => outputOccurred,
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
      INIT => X"FFFFFDFF00020000"
    )
        port map (
      I0 => ARESETN_IBUF,
      I1 => nextState(1),
      I2 => currentState(0),
      I3 => nextState(0),
      I4 => currentState(1),
      I5 => outputOccurred,
      O => outputOccurred_i_1_n_0
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
