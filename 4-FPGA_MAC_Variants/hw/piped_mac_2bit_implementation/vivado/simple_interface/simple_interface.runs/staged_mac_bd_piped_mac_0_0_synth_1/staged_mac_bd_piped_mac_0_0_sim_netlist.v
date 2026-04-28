// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon Oct 27 18:12:20 2025
// Host        : co2050-04.ece.iastate.edu running 64-bit unknown
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ staged_mac_bd_piped_mac_0_0_sim_netlist.v
// Design      : staged_mac_bd_piped_mac_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_piped_mac
   (MO_AXIS_TDATA,
    MO_AXIS_TID,
    mo_tlast_reg_reg_0,
    SD_AXIS_TREADY,
    ACLK,
    SD_AXIS_TID,
    MO_AXIS_TREADY,
    SD_AXIS_TVALID,
    ARESETN,
    SD_AXIS_TDATA,
    SD_AXIS_TUSER,
    SD_AXIS_TLAST);
  output [31:0]MO_AXIS_TDATA;
  output [7:0]MO_AXIS_TID;
  output mo_tlast_reg_reg_0;
  output SD_AXIS_TREADY;
  input ACLK;
  input [7:0]SD_AXIS_TID;
  input MO_AXIS_TREADY;
  input SD_AXIS_TVALID;
  input ARESETN;
  input [3:0]SD_AXIS_TDATA;
  input SD_AXIS_TUSER;
  input SD_AXIS_TLAST;

  wire ACLK;
  wire ARESETN;
  wire [31:0]MO_AXIS_TDATA;
  wire [7:0]MO_AXIS_TID;
  wire MO_AXIS_TREADY;
  wire [3:0]SD_AXIS_TDATA;
  wire [7:0]SD_AXIS_TID;
  wire SD_AXIS_TLAST;
  wire SD_AXIS_TREADY;
  wire SD_AXIS_TUSER;
  wire SD_AXIS_TVALID;
  wire _carry__0_i_1_n_0;
  wire _carry__0_i_2_n_0;
  wire _carry__0_i_3_n_0;
  wire _carry__0_i_4_n_0;
  wire _carry__0_i_5_n_0;
  wire _carry__0_i_6_n_0;
  wire _carry__0_i_7_n_0;
  wire _carry__0_i_8_n_0;
  wire _carry__0_n_0;
  wire _carry__0_n_1;
  wire _carry__0_n_2;
  wire _carry__0_n_3;
  wire _carry__1_i_1_n_0;
  wire _carry__1_i_2_n_0;
  wire _carry__1_i_3_n_0;
  wire _carry__1_i_4_n_0;
  wire _carry__1_i_5_n_0;
  wire _carry__1_i_6_n_0;
  wire _carry__1_i_7_n_0;
  wire _carry__1_i_8_n_0;
  wire _carry__1_n_0;
  wire _carry__1_n_1;
  wire _carry__1_n_2;
  wire _carry__1_n_3;
  wire _carry__2_i_1_n_0;
  wire _carry__2_i_2_n_0;
  wire _carry__2_i_3_n_0;
  wire _carry__2_i_4_n_0;
  wire _carry__2_i_5_n_0;
  wire _carry__2_i_6_n_0;
  wire _carry__2_i_7_n_0;
  wire _carry__2_i_8_n_0;
  wire _carry__2_n_0;
  wire _carry__2_n_1;
  wire _carry__2_n_2;
  wire _carry__2_n_3;
  wire _carry__3_i_1_n_0;
  wire _carry__3_i_2_n_0;
  wire _carry__3_i_3_n_0;
  wire _carry__3_i_4_n_0;
  wire _carry__3_i_5_n_0;
  wire _carry__3_i_6_n_0;
  wire _carry__3_i_7_n_0;
  wire _carry__3_i_8_n_0;
  wire _carry__3_n_0;
  wire _carry__3_n_1;
  wire _carry__3_n_2;
  wire _carry__3_n_3;
  wire _carry__4_i_1_n_0;
  wire _carry__4_i_2_n_0;
  wire _carry__4_i_3_n_0;
  wire _carry__4_i_4_n_0;
  wire _carry__4_i_5_n_0;
  wire _carry__4_i_6_n_0;
  wire _carry__4_i_7_n_0;
  wire _carry__4_i_8_n_0;
  wire _carry__4_n_0;
  wire _carry__4_n_1;
  wire _carry__4_n_2;
  wire _carry__4_n_3;
  wire _carry__5_i_1_n_0;
  wire _carry__5_i_2_n_0;
  wire _carry__5_i_3_n_0;
  wire _carry__5_i_4_n_0;
  wire _carry__5_i_5_n_0;
  wire _carry__5_i_6_n_0;
  wire _carry__5_i_7_n_0;
  wire _carry__5_i_8_n_0;
  wire _carry__5_n_0;
  wire _carry__5_n_1;
  wire _carry__5_n_2;
  wire _carry__5_n_3;
  wire _carry__6_i_1_n_0;
  wire _carry__6_i_2_n_0;
  wire _carry__6_i_3_n_0;
  wire _carry__6_i_4_n_0;
  wire _carry__6_i_5_n_0;
  wire _carry__6_i_6_n_0;
  wire _carry__6_i_7_n_0;
  wire _carry__6_n_1;
  wire _carry__6_n_2;
  wire _carry__6_n_3;
  wire _carry_i_1_n_0;
  wire _carry_i_2_n_0;
  wire _carry_i_3_n_0;
  wire _carry_i_4_n_0;
  wire _carry_n_0;
  wire _carry_n_1;
  wire _carry_n_2;
  wire _carry_n_3;
  wire clear;
  wire mo_tdata_reg;
  wire mo_tlast_reg_i_1_n_0;
  wire mo_tlast_reg_reg_0;
  wire [31:0]p_0_in;
  wire [3:0]p_1_in;
  wire [3:0]s1_product_reg;
  wire [7:0]s1_tid_reg;
  wire s1_tlast_reg;
  wire s1_tlast_reg3_out;
  wire s1_tvalid_reg;
  wire s1_tvalid_reg_i_1_n_0;
  wire s2_accum_active;
  wire s2_accum_active1_out;
  wire s2_accum_active_i_1_n_0;
  wire \s2_accumulated_value[0]_i_3_n_0 ;
  wire \s2_accumulated_value[0]_i_4_n_0 ;
  wire \s2_accumulated_value[0]_i_5_n_0 ;
  wire \s2_accumulated_value[0]_i_6_n_0 ;
  wire \s2_accumulated_value[12]_i_2_n_0 ;
  wire \s2_accumulated_value[12]_i_3_n_0 ;
  wire \s2_accumulated_value[12]_i_4_n_0 ;
  wire \s2_accumulated_value[12]_i_5_n_0 ;
  wire \s2_accumulated_value[16]_i_2_n_0 ;
  wire \s2_accumulated_value[16]_i_3_n_0 ;
  wire \s2_accumulated_value[16]_i_4_n_0 ;
  wire \s2_accumulated_value[16]_i_5_n_0 ;
  wire \s2_accumulated_value[20]_i_2_n_0 ;
  wire \s2_accumulated_value[20]_i_3_n_0 ;
  wire \s2_accumulated_value[20]_i_4_n_0 ;
  wire \s2_accumulated_value[20]_i_5_n_0 ;
  wire \s2_accumulated_value[24]_i_2_n_0 ;
  wire \s2_accumulated_value[24]_i_3_n_0 ;
  wire \s2_accumulated_value[24]_i_4_n_0 ;
  wire \s2_accumulated_value[24]_i_5_n_0 ;
  wire \s2_accumulated_value[28]_i_2_n_0 ;
  wire \s2_accumulated_value[28]_i_3_n_0 ;
  wire \s2_accumulated_value[28]_i_4_n_0 ;
  wire \s2_accumulated_value[28]_i_5_n_0 ;
  wire \s2_accumulated_value[4]_i_2_n_0 ;
  wire \s2_accumulated_value[4]_i_3_n_0 ;
  wire \s2_accumulated_value[4]_i_4_n_0 ;
  wire \s2_accumulated_value[4]_i_5_n_0 ;
  wire \s2_accumulated_value[8]_i_2_n_0 ;
  wire \s2_accumulated_value[8]_i_3_n_0 ;
  wire \s2_accumulated_value[8]_i_4_n_0 ;
  wire \s2_accumulated_value[8]_i_5_n_0 ;
  wire [31:0]s2_accumulated_value_reg;
  wire \s2_accumulated_value_reg[0]_i_2_n_0 ;
  wire \s2_accumulated_value_reg[0]_i_2_n_1 ;
  wire \s2_accumulated_value_reg[0]_i_2_n_2 ;
  wire \s2_accumulated_value_reg[0]_i_2_n_3 ;
  wire \s2_accumulated_value_reg[0]_i_2_n_4 ;
  wire \s2_accumulated_value_reg[0]_i_2_n_5 ;
  wire \s2_accumulated_value_reg[0]_i_2_n_6 ;
  wire \s2_accumulated_value_reg[0]_i_2_n_7 ;
  wire \s2_accumulated_value_reg[12]_i_1_n_0 ;
  wire \s2_accumulated_value_reg[12]_i_1_n_1 ;
  wire \s2_accumulated_value_reg[12]_i_1_n_2 ;
  wire \s2_accumulated_value_reg[12]_i_1_n_3 ;
  wire \s2_accumulated_value_reg[12]_i_1_n_4 ;
  wire \s2_accumulated_value_reg[12]_i_1_n_5 ;
  wire \s2_accumulated_value_reg[12]_i_1_n_6 ;
  wire \s2_accumulated_value_reg[12]_i_1_n_7 ;
  wire \s2_accumulated_value_reg[16]_i_1_n_0 ;
  wire \s2_accumulated_value_reg[16]_i_1_n_1 ;
  wire \s2_accumulated_value_reg[16]_i_1_n_2 ;
  wire \s2_accumulated_value_reg[16]_i_1_n_3 ;
  wire \s2_accumulated_value_reg[16]_i_1_n_4 ;
  wire \s2_accumulated_value_reg[16]_i_1_n_5 ;
  wire \s2_accumulated_value_reg[16]_i_1_n_6 ;
  wire \s2_accumulated_value_reg[16]_i_1_n_7 ;
  wire \s2_accumulated_value_reg[20]_i_1_n_0 ;
  wire \s2_accumulated_value_reg[20]_i_1_n_1 ;
  wire \s2_accumulated_value_reg[20]_i_1_n_2 ;
  wire \s2_accumulated_value_reg[20]_i_1_n_3 ;
  wire \s2_accumulated_value_reg[20]_i_1_n_4 ;
  wire \s2_accumulated_value_reg[20]_i_1_n_5 ;
  wire \s2_accumulated_value_reg[20]_i_1_n_6 ;
  wire \s2_accumulated_value_reg[20]_i_1_n_7 ;
  wire \s2_accumulated_value_reg[24]_i_1_n_0 ;
  wire \s2_accumulated_value_reg[24]_i_1_n_1 ;
  wire \s2_accumulated_value_reg[24]_i_1_n_2 ;
  wire \s2_accumulated_value_reg[24]_i_1_n_3 ;
  wire \s2_accumulated_value_reg[24]_i_1_n_4 ;
  wire \s2_accumulated_value_reg[24]_i_1_n_5 ;
  wire \s2_accumulated_value_reg[24]_i_1_n_6 ;
  wire \s2_accumulated_value_reg[24]_i_1_n_7 ;
  wire \s2_accumulated_value_reg[28]_i_1_n_1 ;
  wire \s2_accumulated_value_reg[28]_i_1_n_2 ;
  wire \s2_accumulated_value_reg[28]_i_1_n_3 ;
  wire \s2_accumulated_value_reg[28]_i_1_n_4 ;
  wire \s2_accumulated_value_reg[28]_i_1_n_5 ;
  wire \s2_accumulated_value_reg[28]_i_1_n_6 ;
  wire \s2_accumulated_value_reg[28]_i_1_n_7 ;
  wire \s2_accumulated_value_reg[4]_i_1_n_0 ;
  wire \s2_accumulated_value_reg[4]_i_1_n_1 ;
  wire \s2_accumulated_value_reg[4]_i_1_n_2 ;
  wire \s2_accumulated_value_reg[4]_i_1_n_3 ;
  wire \s2_accumulated_value_reg[4]_i_1_n_4 ;
  wire \s2_accumulated_value_reg[4]_i_1_n_5 ;
  wire \s2_accumulated_value_reg[4]_i_1_n_6 ;
  wire \s2_accumulated_value_reg[4]_i_1_n_7 ;
  wire \s2_accumulated_value_reg[8]_i_1_n_0 ;
  wire \s2_accumulated_value_reg[8]_i_1_n_1 ;
  wire \s2_accumulated_value_reg[8]_i_1_n_2 ;
  wire \s2_accumulated_value_reg[8]_i_1_n_3 ;
  wire \s2_accumulated_value_reg[8]_i_1_n_4 ;
  wire \s2_accumulated_value_reg[8]_i_1_n_5 ;
  wire \s2_accumulated_value_reg[8]_i_1_n_6 ;
  wire \s2_accumulated_value_reg[8]_i_1_n_7 ;
  wire [3:3]NLW__carry__6_CO_UNCONNECTED;
  wire [3:3]\NLW_s2_accumulated_value_reg[28]_i_1_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    SD_AXIS_TREADY_INST_0
       (.I0(MO_AXIS_TREADY),
        .I1(mo_tlast_reg_reg_0),
        .O(SD_AXIS_TREADY));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 _carry
       (.CI(1'b0),
        .CO({_carry_n_0,_carry_n_1,_carry_n_2,_carry_n_3}),
        .CYINIT(1'b0),
        .DI(s1_product_reg),
        .O(p_0_in[3:0]),
        .S({_carry_i_1_n_0,_carry_i_2_n_0,_carry_i_3_n_0,_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 _carry__0
       (.CI(_carry_n_0),
        .CO({_carry__0_n_0,_carry__0_n_1,_carry__0_n_2,_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({_carry__0_i_1_n_0,_carry__0_i_2_n_0,_carry__0_i_3_n_0,_carry__0_i_4_n_0}),
        .O(p_0_in[7:4]),
        .S({_carry__0_i_5_n_0,_carry__0_i_6_n_0,_carry__0_i_7_n_0,_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__0_i_1
       (.I0(s2_accumulated_value_reg[6]),
        .I1(s2_accum_active),
        .O(_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__0_i_2
       (.I0(s2_accumulated_value_reg[5]),
        .I1(s2_accum_active),
        .O(_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__0_i_3
       (.I0(s2_accumulated_value_reg[4]),
        .I1(s2_accum_active),
        .O(_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    _carry__0_i_4
       (.I0(s1_product_reg[3]),
        .O(_carry__0_i_4_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__0_i_5
       (.I0(s2_accumulated_value_reg[6]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[7]),
        .O(_carry__0_i_5_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__0_i_6
       (.I0(s2_accumulated_value_reg[5]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[6]),
        .O(_carry__0_i_6_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__0_i_7
       (.I0(s2_accumulated_value_reg[4]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[5]),
        .O(_carry__0_i_7_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    _carry__0_i_8
       (.I0(s1_product_reg[3]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[4]),
        .O(_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 _carry__1
       (.CI(_carry__0_n_0),
        .CO({_carry__1_n_0,_carry__1_n_1,_carry__1_n_2,_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({_carry__1_i_1_n_0,_carry__1_i_2_n_0,_carry__1_i_3_n_0,_carry__1_i_4_n_0}),
        .O(p_0_in[11:8]),
        .S({_carry__1_i_5_n_0,_carry__1_i_6_n_0,_carry__1_i_7_n_0,_carry__1_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__1_i_1
       (.I0(s2_accumulated_value_reg[10]),
        .I1(s2_accum_active),
        .O(_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__1_i_2
       (.I0(s2_accumulated_value_reg[9]),
        .I1(s2_accum_active),
        .O(_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__1_i_3
       (.I0(s2_accumulated_value_reg[8]),
        .I1(s2_accum_active),
        .O(_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__1_i_4
       (.I0(s2_accumulated_value_reg[7]),
        .I1(s2_accum_active),
        .O(_carry__1_i_4_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__1_i_5
       (.I0(s2_accumulated_value_reg[10]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[11]),
        .O(_carry__1_i_5_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__1_i_6
       (.I0(s2_accumulated_value_reg[9]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[10]),
        .O(_carry__1_i_6_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__1_i_7
       (.I0(s2_accumulated_value_reg[8]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[9]),
        .O(_carry__1_i_7_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__1_i_8
       (.I0(s2_accumulated_value_reg[7]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[8]),
        .O(_carry__1_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 _carry__2
       (.CI(_carry__1_n_0),
        .CO({_carry__2_n_0,_carry__2_n_1,_carry__2_n_2,_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({_carry__2_i_1_n_0,_carry__2_i_2_n_0,_carry__2_i_3_n_0,_carry__2_i_4_n_0}),
        .O(p_0_in[15:12]),
        .S({_carry__2_i_5_n_0,_carry__2_i_6_n_0,_carry__2_i_7_n_0,_carry__2_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__2_i_1
       (.I0(s2_accumulated_value_reg[14]),
        .I1(s2_accum_active),
        .O(_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__2_i_2
       (.I0(s2_accumulated_value_reg[13]),
        .I1(s2_accum_active),
        .O(_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__2_i_3
       (.I0(s2_accumulated_value_reg[12]),
        .I1(s2_accum_active),
        .O(_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__2_i_4
       (.I0(s2_accumulated_value_reg[11]),
        .I1(s2_accum_active),
        .O(_carry__2_i_4_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__2_i_5
       (.I0(s2_accumulated_value_reg[14]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[15]),
        .O(_carry__2_i_5_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__2_i_6
       (.I0(s2_accumulated_value_reg[13]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[14]),
        .O(_carry__2_i_6_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__2_i_7
       (.I0(s2_accumulated_value_reg[12]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[13]),
        .O(_carry__2_i_7_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__2_i_8
       (.I0(s2_accumulated_value_reg[11]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[12]),
        .O(_carry__2_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 _carry__3
       (.CI(_carry__2_n_0),
        .CO({_carry__3_n_0,_carry__3_n_1,_carry__3_n_2,_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({_carry__3_i_1_n_0,_carry__3_i_2_n_0,_carry__3_i_3_n_0,_carry__3_i_4_n_0}),
        .O(p_0_in[19:16]),
        .S({_carry__3_i_5_n_0,_carry__3_i_6_n_0,_carry__3_i_7_n_0,_carry__3_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__3_i_1
       (.I0(s2_accumulated_value_reg[18]),
        .I1(s2_accum_active),
        .O(_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__3_i_2
       (.I0(s2_accumulated_value_reg[17]),
        .I1(s2_accum_active),
        .O(_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__3_i_3
       (.I0(s2_accumulated_value_reg[16]),
        .I1(s2_accum_active),
        .O(_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__3_i_4
       (.I0(s2_accumulated_value_reg[15]),
        .I1(s2_accum_active),
        .O(_carry__3_i_4_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__3_i_5
       (.I0(s2_accumulated_value_reg[18]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[19]),
        .O(_carry__3_i_5_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__3_i_6
       (.I0(s2_accumulated_value_reg[17]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[18]),
        .O(_carry__3_i_6_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__3_i_7
       (.I0(s2_accumulated_value_reg[16]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[17]),
        .O(_carry__3_i_7_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__3_i_8
       (.I0(s2_accumulated_value_reg[15]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[16]),
        .O(_carry__3_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 _carry__4
       (.CI(_carry__3_n_0),
        .CO({_carry__4_n_0,_carry__4_n_1,_carry__4_n_2,_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({_carry__4_i_1_n_0,_carry__4_i_2_n_0,_carry__4_i_3_n_0,_carry__4_i_4_n_0}),
        .O(p_0_in[23:20]),
        .S({_carry__4_i_5_n_0,_carry__4_i_6_n_0,_carry__4_i_7_n_0,_carry__4_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__4_i_1
       (.I0(s2_accumulated_value_reg[22]),
        .I1(s2_accum_active),
        .O(_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__4_i_2
       (.I0(s2_accumulated_value_reg[21]),
        .I1(s2_accum_active),
        .O(_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__4_i_3
       (.I0(s2_accumulated_value_reg[20]),
        .I1(s2_accum_active),
        .O(_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__4_i_4
       (.I0(s2_accumulated_value_reg[19]),
        .I1(s2_accum_active),
        .O(_carry__4_i_4_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__4_i_5
       (.I0(s2_accumulated_value_reg[22]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[23]),
        .O(_carry__4_i_5_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__4_i_6
       (.I0(s2_accumulated_value_reg[21]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[22]),
        .O(_carry__4_i_6_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__4_i_7
       (.I0(s2_accumulated_value_reg[20]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[21]),
        .O(_carry__4_i_7_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__4_i_8
       (.I0(s2_accumulated_value_reg[19]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[20]),
        .O(_carry__4_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 _carry__5
       (.CI(_carry__4_n_0),
        .CO({_carry__5_n_0,_carry__5_n_1,_carry__5_n_2,_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({_carry__5_i_1_n_0,_carry__5_i_2_n_0,_carry__5_i_3_n_0,_carry__5_i_4_n_0}),
        .O(p_0_in[27:24]),
        .S({_carry__5_i_5_n_0,_carry__5_i_6_n_0,_carry__5_i_7_n_0,_carry__5_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__5_i_1
       (.I0(s2_accumulated_value_reg[26]),
        .I1(s2_accum_active),
        .O(_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__5_i_2
       (.I0(s2_accumulated_value_reg[25]),
        .I1(s2_accum_active),
        .O(_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__5_i_3
       (.I0(s2_accumulated_value_reg[24]),
        .I1(s2_accum_active),
        .O(_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__5_i_4
       (.I0(s2_accumulated_value_reg[23]),
        .I1(s2_accum_active),
        .O(_carry__5_i_4_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__5_i_5
       (.I0(s2_accumulated_value_reg[26]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[27]),
        .O(_carry__5_i_5_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__5_i_6
       (.I0(s2_accumulated_value_reg[25]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[26]),
        .O(_carry__5_i_6_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__5_i_7
       (.I0(s2_accumulated_value_reg[24]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[25]),
        .O(_carry__5_i_7_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__5_i_8
       (.I0(s2_accumulated_value_reg[23]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[24]),
        .O(_carry__5_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 _carry__6
       (.CI(_carry__5_n_0),
        .CO({NLW__carry__6_CO_UNCONNECTED[3],_carry__6_n_1,_carry__6_n_2,_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,_carry__6_i_1_n_0,_carry__6_i_2_n_0,_carry__6_i_3_n_0}),
        .O(p_0_in[31:28]),
        .S({_carry__6_i_4_n_0,_carry__6_i_5_n_0,_carry__6_i_6_n_0,_carry__6_i_7_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__6_i_1
       (.I0(s2_accumulated_value_reg[29]),
        .I1(s2_accum_active),
        .O(_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__6_i_2
       (.I0(s2_accumulated_value_reg[28]),
        .I1(s2_accum_active),
        .O(_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    _carry__6_i_3
       (.I0(s2_accumulated_value_reg[27]),
        .I1(s2_accum_active),
        .O(_carry__6_i_3_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__6_i_4
       (.I0(s2_accumulated_value_reg[30]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[31]),
        .O(_carry__6_i_4_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__6_i_5
       (.I0(s2_accumulated_value_reg[29]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[30]),
        .O(_carry__6_i_5_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__6_i_6
       (.I0(s2_accumulated_value_reg[28]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[29]),
        .O(_carry__6_i_6_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    _carry__6_i_7
       (.I0(s2_accumulated_value_reg[27]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[28]),
        .O(_carry__6_i_7_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    _carry_i_1
       (.I0(s1_product_reg[3]),
        .I1(s2_accum_active),
        .I2(s2_accumulated_value_reg[3]),
        .O(_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    _carry_i_2
       (.I0(s2_accum_active),
        .I1(s2_accumulated_value_reg[2]),
        .I2(s1_product_reg[2]),
        .O(_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    _carry_i_3
       (.I0(s2_accum_active),
        .I1(s2_accumulated_value_reg[1]),
        .I2(s1_product_reg[1]),
        .O(_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    _carry_i_4
       (.I0(s2_accum_active),
        .I1(s2_accumulated_value_reg[0]),
        .I2(s1_product_reg[0]),
        .O(_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \mo_tdata_reg[31]_i_1 
       (.I0(ARESETN),
        .O(clear));
  LUT4 #(
    .INIT(16'hD000)) 
    \mo_tdata_reg[31]_i_2 
       (.I0(mo_tlast_reg_reg_0),
        .I1(MO_AXIS_TREADY),
        .I2(s1_tlast_reg),
        .I3(s1_tvalid_reg),
        .O(mo_tdata_reg));
  FDRE \mo_tdata_reg_reg[0] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[0]),
        .Q(MO_AXIS_TDATA[0]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[10] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[10]),
        .Q(MO_AXIS_TDATA[10]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[11] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[11]),
        .Q(MO_AXIS_TDATA[11]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[12] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[12]),
        .Q(MO_AXIS_TDATA[12]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[13] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[13]),
        .Q(MO_AXIS_TDATA[13]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[14] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[14]),
        .Q(MO_AXIS_TDATA[14]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[15] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[15]),
        .Q(MO_AXIS_TDATA[15]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[16] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[16]),
        .Q(MO_AXIS_TDATA[16]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[17] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[17]),
        .Q(MO_AXIS_TDATA[17]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[18] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[18]),
        .Q(MO_AXIS_TDATA[18]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[19] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[19]),
        .Q(MO_AXIS_TDATA[19]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[1] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[1]),
        .Q(MO_AXIS_TDATA[1]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[20] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[20]),
        .Q(MO_AXIS_TDATA[20]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[21] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[21]),
        .Q(MO_AXIS_TDATA[21]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[22] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[22]),
        .Q(MO_AXIS_TDATA[22]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[23] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[23]),
        .Q(MO_AXIS_TDATA[23]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[24] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[24]),
        .Q(MO_AXIS_TDATA[24]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[25] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[25]),
        .Q(MO_AXIS_TDATA[25]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[26] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[26]),
        .Q(MO_AXIS_TDATA[26]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[27] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[27]),
        .Q(MO_AXIS_TDATA[27]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[28] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[28]),
        .Q(MO_AXIS_TDATA[28]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[29] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[29]),
        .Q(MO_AXIS_TDATA[29]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[2] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[2]),
        .Q(MO_AXIS_TDATA[2]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[30] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[30]),
        .Q(MO_AXIS_TDATA[30]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[31] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[31]),
        .Q(MO_AXIS_TDATA[31]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[3] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[3]),
        .Q(MO_AXIS_TDATA[3]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[4] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[4]),
        .Q(MO_AXIS_TDATA[4]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[5] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[5]),
        .Q(MO_AXIS_TDATA[5]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[6] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[6]),
        .Q(MO_AXIS_TDATA[6]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[7] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[7]),
        .Q(MO_AXIS_TDATA[7]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[8] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[8]),
        .Q(MO_AXIS_TDATA[8]),
        .R(clear));
  FDRE \mo_tdata_reg_reg[9] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(p_0_in[9]),
        .Q(MO_AXIS_TDATA[9]),
        .R(clear));
  FDRE \mo_tid_reg_reg[0] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(s1_tid_reg[0]),
        .Q(MO_AXIS_TID[0]),
        .R(clear));
  FDRE \mo_tid_reg_reg[1] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(s1_tid_reg[1]),
        .Q(MO_AXIS_TID[1]),
        .R(clear));
  FDRE \mo_tid_reg_reg[2] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(s1_tid_reg[2]),
        .Q(MO_AXIS_TID[2]),
        .R(clear));
  FDRE \mo_tid_reg_reg[3] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(s1_tid_reg[3]),
        .Q(MO_AXIS_TID[3]),
        .R(clear));
  FDRE \mo_tid_reg_reg[4] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(s1_tid_reg[4]),
        .Q(MO_AXIS_TID[4]),
        .R(clear));
  FDRE \mo_tid_reg_reg[5] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(s1_tid_reg[5]),
        .Q(MO_AXIS_TID[5]),
        .R(clear));
  FDRE \mo_tid_reg_reg[6] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(s1_tid_reg[6]),
        .Q(MO_AXIS_TID[6]),
        .R(clear));
  FDRE \mo_tid_reg_reg[7] 
       (.C(ACLK),
        .CE(mo_tdata_reg),
        .D(s1_tid_reg[7]),
        .Q(MO_AXIS_TID[7]),
        .R(clear));
  LUT5 #(
    .INIT(32'hCF880000)) 
    mo_tlast_reg_i_1
       (.I0(s1_tlast_reg),
        .I1(s1_tvalid_reg),
        .I2(MO_AXIS_TREADY),
        .I3(mo_tlast_reg_reg_0),
        .I4(ARESETN),
        .O(mo_tlast_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    mo_tlast_reg_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(mo_tlast_reg_i_1_n_0),
        .Q(mo_tlast_reg_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \s1_product_reg[0]_i_1 
       (.I0(SD_AXIS_TDATA[0]),
        .I1(SD_AXIS_TDATA[2]),
        .I2(SD_AXIS_TUSER),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hCCCC7888)) 
    \s1_product_reg[1]_i_1 
       (.I0(SD_AXIS_TDATA[2]),
        .I1(SD_AXIS_TDATA[1]),
        .I2(SD_AXIS_TDATA[3]),
        .I3(SD_AXIS_TDATA[0]),
        .I4(SD_AXIS_TUSER),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hAAAA1AC0)) 
    \s1_product_reg[2]_i_1 
       (.I0(SD_AXIS_TDATA[2]),
        .I1(SD_AXIS_TDATA[0]),
        .I2(SD_AXIS_TDATA[3]),
        .I3(SD_AXIS_TDATA[1]),
        .I4(SD_AXIS_TUSER),
        .O(p_1_in[2]));
  LUT3 #(
    .INIT(8'hD0)) 
    \s1_product_reg[3]_i_1 
       (.I0(mo_tlast_reg_reg_0),
        .I1(MO_AXIS_TREADY),
        .I2(SD_AXIS_TVALID),
        .O(s1_tlast_reg3_out));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF0F00AC0)) 
    \s1_product_reg[3]_i_2 
       (.I0(SD_AXIS_TDATA[2]),
        .I1(SD_AXIS_TDATA[0]),
        .I2(SD_AXIS_TDATA[3]),
        .I3(SD_AXIS_TDATA[1]),
        .I4(SD_AXIS_TUSER),
        .O(p_1_in[3]));
  FDRE \s1_product_reg_reg[0] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(p_1_in[0]),
        .Q(s1_product_reg[0]),
        .R(clear));
  FDRE \s1_product_reg_reg[1] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(p_1_in[1]),
        .Q(s1_product_reg[1]),
        .R(clear));
  FDRE \s1_product_reg_reg[2] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(p_1_in[2]),
        .Q(s1_product_reg[2]),
        .R(clear));
  FDRE \s1_product_reg_reg[3] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(p_1_in[3]),
        .Q(s1_product_reg[3]),
        .R(clear));
  FDRE \s1_tid_reg_reg[0] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(SD_AXIS_TID[0]),
        .Q(s1_tid_reg[0]),
        .R(clear));
  FDRE \s1_tid_reg_reg[1] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(SD_AXIS_TID[1]),
        .Q(s1_tid_reg[1]),
        .R(clear));
  FDRE \s1_tid_reg_reg[2] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(SD_AXIS_TID[2]),
        .Q(s1_tid_reg[2]),
        .R(clear));
  FDRE \s1_tid_reg_reg[3] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(SD_AXIS_TID[3]),
        .Q(s1_tid_reg[3]),
        .R(clear));
  FDRE \s1_tid_reg_reg[4] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(SD_AXIS_TID[4]),
        .Q(s1_tid_reg[4]),
        .R(clear));
  FDRE \s1_tid_reg_reg[5] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(SD_AXIS_TID[5]),
        .Q(s1_tid_reg[5]),
        .R(clear));
  FDRE \s1_tid_reg_reg[6] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(SD_AXIS_TID[6]),
        .Q(s1_tid_reg[6]),
        .R(clear));
  FDRE \s1_tid_reg_reg[7] 
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(SD_AXIS_TID[7]),
        .Q(s1_tid_reg[7]),
        .R(clear));
  FDRE s1_tlast_reg_reg
       (.C(ACLK),
        .CE(s1_tlast_reg3_out),
        .D(SD_AXIS_TLAST),
        .Q(s1_tlast_reg),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFB080000)) 
    s1_tvalid_reg_i_1
       (.I0(s1_tvalid_reg),
        .I1(mo_tlast_reg_reg_0),
        .I2(MO_AXIS_TREADY),
        .I3(SD_AXIS_TVALID),
        .I4(ARESETN),
        .O(s1_tvalid_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s1_tvalid_reg_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(s1_tvalid_reg_i_1_n_0),
        .Q(s1_tvalid_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0080CC8C88888888)) 
    s2_accum_active_i_1
       (.I0(s2_accum_active),
        .I1(ARESETN),
        .I2(mo_tlast_reg_reg_0),
        .I3(MO_AXIS_TREADY),
        .I4(s1_tlast_reg),
        .I5(s1_tvalid_reg),
        .O(s2_accum_active_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s2_accum_active_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(s2_accum_active_i_1_n_0),
        .Q(s2_accum_active),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hD0)) 
    \s2_accumulated_value[0]_i_1 
       (.I0(mo_tlast_reg_reg_0),
        .I1(MO_AXIS_TREADY),
        .I2(s1_tvalid_reg),
        .O(s2_accum_active1_out));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[0]_i_3 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[3]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[0]_i_4 
       (.I0(s1_product_reg[2]),
        .I1(s2_accumulated_value_reg[2]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[0]_i_5 
       (.I0(s1_product_reg[1]),
        .I1(s2_accumulated_value_reg[1]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[0]_i_6 
       (.I0(s1_product_reg[0]),
        .I1(s2_accumulated_value_reg[0]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[12]_i_2 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[15]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[12]_i_3 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[14]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[12]_i_4 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[13]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[12]_i_5 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[12]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[12]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[16]_i_2 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[19]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[16]_i_3 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[18]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[16]_i_4 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[17]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[16]_i_5 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[16]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[16]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[20]_i_2 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[23]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[20]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[20]_i_3 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[22]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[20]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[20]_i_4 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[21]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[20]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[20]_i_5 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[20]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[20]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[24]_i_2 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[27]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[24]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[24]_i_3 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[26]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[24]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[24]_i_4 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[25]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[24]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[24]_i_5 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[24]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[24]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[28]_i_2 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[31]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[28]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[28]_i_3 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[30]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[28]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[28]_i_4 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[29]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[28]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[28]_i_5 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[28]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[28]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[4]_i_2 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[7]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[4]_i_3 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[6]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[4]_i_4 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[5]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[4]_i_5 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[4]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[8]_i_2 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[11]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[8]_i_3 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[10]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[8]_i_4 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[9]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \s2_accumulated_value[8]_i_5 
       (.I0(s1_product_reg[3]),
        .I1(s2_accumulated_value_reg[8]),
        .I2(s2_accum_active),
        .O(\s2_accumulated_value[8]_i_5_n_0 ));
  FDRE \s2_accumulated_value_reg[0] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[0]_i_2_n_7 ),
        .Q(s2_accumulated_value_reg[0]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \s2_accumulated_value_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\s2_accumulated_value_reg[0]_i_2_n_0 ,\s2_accumulated_value_reg[0]_i_2_n_1 ,\s2_accumulated_value_reg[0]_i_2_n_2 ,\s2_accumulated_value_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(s1_product_reg),
        .O({\s2_accumulated_value_reg[0]_i_2_n_4 ,\s2_accumulated_value_reg[0]_i_2_n_5 ,\s2_accumulated_value_reg[0]_i_2_n_6 ,\s2_accumulated_value_reg[0]_i_2_n_7 }),
        .S({\s2_accumulated_value[0]_i_3_n_0 ,\s2_accumulated_value[0]_i_4_n_0 ,\s2_accumulated_value[0]_i_5_n_0 ,\s2_accumulated_value[0]_i_6_n_0 }));
  FDRE \s2_accumulated_value_reg[10] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[8]_i_1_n_5 ),
        .Q(s2_accumulated_value_reg[10]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[11] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[8]_i_1_n_4 ),
        .Q(s2_accumulated_value_reg[11]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[12] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[12]_i_1_n_7 ),
        .Q(s2_accumulated_value_reg[12]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \s2_accumulated_value_reg[12]_i_1 
       (.CI(\s2_accumulated_value_reg[8]_i_1_n_0 ),
        .CO({\s2_accumulated_value_reg[12]_i_1_n_0 ,\s2_accumulated_value_reg[12]_i_1_n_1 ,\s2_accumulated_value_reg[12]_i_1_n_2 ,\s2_accumulated_value_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({s1_product_reg[3],s1_product_reg[3],s1_product_reg[3],s1_product_reg[3]}),
        .O({\s2_accumulated_value_reg[12]_i_1_n_4 ,\s2_accumulated_value_reg[12]_i_1_n_5 ,\s2_accumulated_value_reg[12]_i_1_n_6 ,\s2_accumulated_value_reg[12]_i_1_n_7 }),
        .S({\s2_accumulated_value[12]_i_2_n_0 ,\s2_accumulated_value[12]_i_3_n_0 ,\s2_accumulated_value[12]_i_4_n_0 ,\s2_accumulated_value[12]_i_5_n_0 }));
  FDRE \s2_accumulated_value_reg[13] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[12]_i_1_n_6 ),
        .Q(s2_accumulated_value_reg[13]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[14] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[12]_i_1_n_5 ),
        .Q(s2_accumulated_value_reg[14]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[15] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[12]_i_1_n_4 ),
        .Q(s2_accumulated_value_reg[15]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[16] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[16]_i_1_n_7 ),
        .Q(s2_accumulated_value_reg[16]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \s2_accumulated_value_reg[16]_i_1 
       (.CI(\s2_accumulated_value_reg[12]_i_1_n_0 ),
        .CO({\s2_accumulated_value_reg[16]_i_1_n_0 ,\s2_accumulated_value_reg[16]_i_1_n_1 ,\s2_accumulated_value_reg[16]_i_1_n_2 ,\s2_accumulated_value_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({s1_product_reg[3],s1_product_reg[3],s1_product_reg[3],s1_product_reg[3]}),
        .O({\s2_accumulated_value_reg[16]_i_1_n_4 ,\s2_accumulated_value_reg[16]_i_1_n_5 ,\s2_accumulated_value_reg[16]_i_1_n_6 ,\s2_accumulated_value_reg[16]_i_1_n_7 }),
        .S({\s2_accumulated_value[16]_i_2_n_0 ,\s2_accumulated_value[16]_i_3_n_0 ,\s2_accumulated_value[16]_i_4_n_0 ,\s2_accumulated_value[16]_i_5_n_0 }));
  FDRE \s2_accumulated_value_reg[17] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[16]_i_1_n_6 ),
        .Q(s2_accumulated_value_reg[17]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[18] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[16]_i_1_n_5 ),
        .Q(s2_accumulated_value_reg[18]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[19] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[16]_i_1_n_4 ),
        .Q(s2_accumulated_value_reg[19]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[1] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[0]_i_2_n_6 ),
        .Q(s2_accumulated_value_reg[1]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[20] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[20]_i_1_n_7 ),
        .Q(s2_accumulated_value_reg[20]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \s2_accumulated_value_reg[20]_i_1 
       (.CI(\s2_accumulated_value_reg[16]_i_1_n_0 ),
        .CO({\s2_accumulated_value_reg[20]_i_1_n_0 ,\s2_accumulated_value_reg[20]_i_1_n_1 ,\s2_accumulated_value_reg[20]_i_1_n_2 ,\s2_accumulated_value_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({s1_product_reg[3],s1_product_reg[3],s1_product_reg[3],s1_product_reg[3]}),
        .O({\s2_accumulated_value_reg[20]_i_1_n_4 ,\s2_accumulated_value_reg[20]_i_1_n_5 ,\s2_accumulated_value_reg[20]_i_1_n_6 ,\s2_accumulated_value_reg[20]_i_1_n_7 }),
        .S({\s2_accumulated_value[20]_i_2_n_0 ,\s2_accumulated_value[20]_i_3_n_0 ,\s2_accumulated_value[20]_i_4_n_0 ,\s2_accumulated_value[20]_i_5_n_0 }));
  FDRE \s2_accumulated_value_reg[21] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[20]_i_1_n_6 ),
        .Q(s2_accumulated_value_reg[21]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[22] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[20]_i_1_n_5 ),
        .Q(s2_accumulated_value_reg[22]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[23] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[20]_i_1_n_4 ),
        .Q(s2_accumulated_value_reg[23]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[24] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[24]_i_1_n_7 ),
        .Q(s2_accumulated_value_reg[24]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \s2_accumulated_value_reg[24]_i_1 
       (.CI(\s2_accumulated_value_reg[20]_i_1_n_0 ),
        .CO({\s2_accumulated_value_reg[24]_i_1_n_0 ,\s2_accumulated_value_reg[24]_i_1_n_1 ,\s2_accumulated_value_reg[24]_i_1_n_2 ,\s2_accumulated_value_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({s1_product_reg[3],s1_product_reg[3],s1_product_reg[3],s1_product_reg[3]}),
        .O({\s2_accumulated_value_reg[24]_i_1_n_4 ,\s2_accumulated_value_reg[24]_i_1_n_5 ,\s2_accumulated_value_reg[24]_i_1_n_6 ,\s2_accumulated_value_reg[24]_i_1_n_7 }),
        .S({\s2_accumulated_value[24]_i_2_n_0 ,\s2_accumulated_value[24]_i_3_n_0 ,\s2_accumulated_value[24]_i_4_n_0 ,\s2_accumulated_value[24]_i_5_n_0 }));
  FDRE \s2_accumulated_value_reg[25] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[24]_i_1_n_6 ),
        .Q(s2_accumulated_value_reg[25]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[26] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[24]_i_1_n_5 ),
        .Q(s2_accumulated_value_reg[26]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[27] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[24]_i_1_n_4 ),
        .Q(s2_accumulated_value_reg[27]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[28] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[28]_i_1_n_7 ),
        .Q(s2_accumulated_value_reg[28]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \s2_accumulated_value_reg[28]_i_1 
       (.CI(\s2_accumulated_value_reg[24]_i_1_n_0 ),
        .CO({\NLW_s2_accumulated_value_reg[28]_i_1_CO_UNCONNECTED [3],\s2_accumulated_value_reg[28]_i_1_n_1 ,\s2_accumulated_value_reg[28]_i_1_n_2 ,\s2_accumulated_value_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,s1_product_reg[3],s1_product_reg[3],s1_product_reg[3]}),
        .O({\s2_accumulated_value_reg[28]_i_1_n_4 ,\s2_accumulated_value_reg[28]_i_1_n_5 ,\s2_accumulated_value_reg[28]_i_1_n_6 ,\s2_accumulated_value_reg[28]_i_1_n_7 }),
        .S({\s2_accumulated_value[28]_i_2_n_0 ,\s2_accumulated_value[28]_i_3_n_0 ,\s2_accumulated_value[28]_i_4_n_0 ,\s2_accumulated_value[28]_i_5_n_0 }));
  FDRE \s2_accumulated_value_reg[29] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[28]_i_1_n_6 ),
        .Q(s2_accumulated_value_reg[29]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[2] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[0]_i_2_n_5 ),
        .Q(s2_accumulated_value_reg[2]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[30] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[28]_i_1_n_5 ),
        .Q(s2_accumulated_value_reg[30]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[31] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[28]_i_1_n_4 ),
        .Q(s2_accumulated_value_reg[31]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[3] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[0]_i_2_n_4 ),
        .Q(s2_accumulated_value_reg[3]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[4] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[4]_i_1_n_7 ),
        .Q(s2_accumulated_value_reg[4]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \s2_accumulated_value_reg[4]_i_1 
       (.CI(\s2_accumulated_value_reg[0]_i_2_n_0 ),
        .CO({\s2_accumulated_value_reg[4]_i_1_n_0 ,\s2_accumulated_value_reg[4]_i_1_n_1 ,\s2_accumulated_value_reg[4]_i_1_n_2 ,\s2_accumulated_value_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({s1_product_reg[3],s1_product_reg[3],s1_product_reg[3],s1_product_reg[3]}),
        .O({\s2_accumulated_value_reg[4]_i_1_n_4 ,\s2_accumulated_value_reg[4]_i_1_n_5 ,\s2_accumulated_value_reg[4]_i_1_n_6 ,\s2_accumulated_value_reg[4]_i_1_n_7 }),
        .S({\s2_accumulated_value[4]_i_2_n_0 ,\s2_accumulated_value[4]_i_3_n_0 ,\s2_accumulated_value[4]_i_4_n_0 ,\s2_accumulated_value[4]_i_5_n_0 }));
  FDRE \s2_accumulated_value_reg[5] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[4]_i_1_n_6 ),
        .Q(s2_accumulated_value_reg[5]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[6] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[4]_i_1_n_5 ),
        .Q(s2_accumulated_value_reg[6]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[7] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[4]_i_1_n_4 ),
        .Q(s2_accumulated_value_reg[7]),
        .R(clear));
  FDRE \s2_accumulated_value_reg[8] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[8]_i_1_n_7 ),
        .Q(s2_accumulated_value_reg[8]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \s2_accumulated_value_reg[8]_i_1 
       (.CI(\s2_accumulated_value_reg[4]_i_1_n_0 ),
        .CO({\s2_accumulated_value_reg[8]_i_1_n_0 ,\s2_accumulated_value_reg[8]_i_1_n_1 ,\s2_accumulated_value_reg[8]_i_1_n_2 ,\s2_accumulated_value_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({s1_product_reg[3],s1_product_reg[3],s1_product_reg[3],s1_product_reg[3]}),
        .O({\s2_accumulated_value_reg[8]_i_1_n_4 ,\s2_accumulated_value_reg[8]_i_1_n_5 ,\s2_accumulated_value_reg[8]_i_1_n_6 ,\s2_accumulated_value_reg[8]_i_1_n_7 }),
        .S({\s2_accumulated_value[8]_i_2_n_0 ,\s2_accumulated_value[8]_i_3_n_0 ,\s2_accumulated_value[8]_i_4_n_0 ,\s2_accumulated_value[8]_i_5_n_0 }));
  FDRE \s2_accumulated_value_reg[9] 
       (.C(ACLK),
        .CE(s2_accum_active1_out),
        .D(\s2_accumulated_value_reg[8]_i_1_n_6 ),
        .Q(s2_accumulated_value_reg[9]),
        .R(clear));
endmodule

(* CHECK_LICENSE_TYPE = "staged_mac_bd_piped_mac_0_0,piped_mac,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "piped_mac,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (ACLK,
    ARESETN,
    SD_AXIS_TREADY,
    SD_AXIS_TDATA,
    SD_AXIS_TLAST,
    SD_AXIS_TUSER,
    SD_AXIS_TVALID,
    SD_AXIS_TID,
    MO_AXIS_TVALID,
    MO_AXIS_TDATA,
    MO_AXIS_TLAST,
    MO_AXIS_TREADY,
    MO_AXIS_TID);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ACLK, ASSOCIATED_BUSIF MO_AXIS:SD_AXIS, ASSOCIATED_RESET ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN staged_mac_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) (* sigis = "Clk" *) input ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TREADY" *) output SD_AXIS_TREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TDATA" *) input [7:0]SD_AXIS_TDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TLAST" *) input SD_AXIS_TLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TUSER" *) input SD_AXIS_TUSER;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TVALID" *) input SD_AXIS_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SD_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN staged_mac_bd_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [7:0]SD_AXIS_TID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 MO_AXIS TVALID" *) output MO_AXIS_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 MO_AXIS TDATA" *) output [31:0]MO_AXIS_TDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 MO_AXIS TLAST" *) output MO_AXIS_TLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 MO_AXIS TREADY" *) input MO_AXIS_TREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 MO_AXIS TID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME MO_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN staged_mac_bd_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [7:0]MO_AXIS_TID;

  wire ACLK;
  wire ARESETN;
  wire [31:0]MO_AXIS_TDATA;
  wire [7:0]MO_AXIS_TID;
  wire MO_AXIS_TREADY;
  wire MO_AXIS_TVALID;
  wire [7:0]SD_AXIS_TDATA;
  wire [7:0]SD_AXIS_TID;
  wire SD_AXIS_TLAST;
  wire SD_AXIS_TREADY;
  wire SD_AXIS_TUSER;
  wire SD_AXIS_TVALID;

  assign MO_AXIS_TLAST = MO_AXIS_TVALID;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_piped_mac inst
       (.ACLK(ACLK),
        .ARESETN(ARESETN),
        .MO_AXIS_TDATA(MO_AXIS_TDATA),
        .MO_AXIS_TID(MO_AXIS_TID),
        .MO_AXIS_TREADY(MO_AXIS_TREADY),
        .SD_AXIS_TDATA(SD_AXIS_TDATA[3:0]),
        .SD_AXIS_TID(SD_AXIS_TID),
        .SD_AXIS_TLAST(SD_AXIS_TLAST),
        .SD_AXIS_TREADY(SD_AXIS_TREADY),
        .SD_AXIS_TUSER(SD_AXIS_TUSER),
        .SD_AXIS_TVALID(SD_AXIS_TVALID),
        .mo_tlast_reg_reg_0(MO_AXIS_TVALID));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
