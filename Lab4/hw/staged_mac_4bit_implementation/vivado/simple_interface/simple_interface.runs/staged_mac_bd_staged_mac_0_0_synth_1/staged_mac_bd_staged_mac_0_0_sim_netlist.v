// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Wed Oct 29 15:38:24 2025
// Host        : co2050-04.ece.iastate.edu running 64-bit unknown
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ staged_mac_bd_staged_mac_0_0_sim_netlist.v
// Design      : staged_mac_bd_staged_mac_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_staged_mac
   (MO_AXIS_TDATA,
    SD_AXIS_TREADY,
    MO_AXIS_TLAST,
    SD_AXIS_TDATA,
    ACLK,
    SD_AXIS_TUSER,
    SD_AXIS_TVALID,
    MO_AXIS_TREADY,
    SD_AXIS_TLAST,
    ARESETN);
  output [31:0]MO_AXIS_TDATA;
  output SD_AXIS_TREADY;
  output MO_AXIS_TLAST;
  input [15:0]SD_AXIS_TDATA;
  input ACLK;
  input SD_AXIS_TUSER;
  input SD_AXIS_TVALID;
  input MO_AXIS_TREADY;
  input SD_AXIS_TLAST;
  input ARESETN;

  wire ACLK;
  wire ARESETN;
  wire ARG__0_carry__0_i_1_n_0;
  wire ARG__0_carry__0_i_2_n_0;
  wire ARG__0_carry__0_i_3_n_0;
  wire ARG__0_carry__0_i_4_n_0;
  wire ARG__0_carry__0_i_5_n_0;
  wire ARG__0_carry__0_i_6_n_0;
  wire ARG__0_carry__0_i_7_n_0;
  wire ARG__0_carry__0_n_2;
  wire ARG__0_carry_i_10_n_0;
  wire ARG__0_carry_i_11_n_0;
  wire ARG__0_carry_i_12_n_0;
  wire ARG__0_carry_i_13_n_0;
  wire ARG__0_carry_i_14_n_0;
  wire ARG__0_carry_i_15_n_0;
  wire ARG__0_carry_i_16_n_0;
  wire ARG__0_carry_i_17_n_0;
  wire ARG__0_carry_i_1_n_0;
  wire ARG__0_carry_i_2_n_0;
  wire ARG__0_carry_i_3_n_0;
  wire ARG__0_carry_i_4_n_0;
  wire ARG__0_carry_i_5_n_0;
  wire ARG__0_carry_i_6_n_0;
  wire ARG__0_carry_i_7_n_0;
  wire ARG__0_carry_i_8_n_0;
  wire ARG__0_carry_i_9_n_0;
  wire ARG__0_carry_n_0;
  wire ARG__0_carry_n_1;
  wire ARG__0_carry_n_2;
  wire ARG__0_carry_n_3;
  wire \ARG_inferred__0/i__carry__0_n_0 ;
  wire \ARG_inferred__0/i__carry__0_n_1 ;
  wire \ARG_inferred__0/i__carry__0_n_2 ;
  wire \ARG_inferred__0/i__carry__0_n_3 ;
  wire \ARG_inferred__0/i__carry__0_n_4 ;
  wire \ARG_inferred__0/i__carry__0_n_5 ;
  wire \ARG_inferred__0/i__carry__0_n_6 ;
  wire \ARG_inferred__0/i__carry__0_n_7 ;
  wire \ARG_inferred__0/i__carry__1_n_0 ;
  wire \ARG_inferred__0/i__carry__1_n_1 ;
  wire \ARG_inferred__0/i__carry__1_n_2 ;
  wire \ARG_inferred__0/i__carry__1_n_3 ;
  wire \ARG_inferred__0/i__carry__1_n_4 ;
  wire \ARG_inferred__0/i__carry__1_n_5 ;
  wire \ARG_inferred__0/i__carry__1_n_6 ;
  wire \ARG_inferred__0/i__carry__1_n_7 ;
  wire \ARG_inferred__0/i__carry__2_n_0 ;
  wire \ARG_inferred__0/i__carry__2_n_1 ;
  wire \ARG_inferred__0/i__carry__2_n_2 ;
  wire \ARG_inferred__0/i__carry__2_n_3 ;
  wire \ARG_inferred__0/i__carry__2_n_4 ;
  wire \ARG_inferred__0/i__carry__2_n_5 ;
  wire \ARG_inferred__0/i__carry__2_n_6 ;
  wire \ARG_inferred__0/i__carry__2_n_7 ;
  wire \ARG_inferred__0/i__carry__3_n_0 ;
  wire \ARG_inferred__0/i__carry__3_n_1 ;
  wire \ARG_inferred__0/i__carry__3_n_2 ;
  wire \ARG_inferred__0/i__carry__3_n_3 ;
  wire \ARG_inferred__0/i__carry__3_n_4 ;
  wire \ARG_inferred__0/i__carry__3_n_5 ;
  wire \ARG_inferred__0/i__carry__3_n_6 ;
  wire \ARG_inferred__0/i__carry__3_n_7 ;
  wire \ARG_inferred__0/i__carry__4_n_0 ;
  wire \ARG_inferred__0/i__carry__4_n_1 ;
  wire \ARG_inferred__0/i__carry__4_n_2 ;
  wire \ARG_inferred__0/i__carry__4_n_3 ;
  wire \ARG_inferred__0/i__carry__4_n_4 ;
  wire \ARG_inferred__0/i__carry__4_n_5 ;
  wire \ARG_inferred__0/i__carry__4_n_6 ;
  wire \ARG_inferred__0/i__carry__4_n_7 ;
  wire \ARG_inferred__0/i__carry__5_n_0 ;
  wire \ARG_inferred__0/i__carry__5_n_1 ;
  wire \ARG_inferred__0/i__carry__5_n_2 ;
  wire \ARG_inferred__0/i__carry__5_n_3 ;
  wire \ARG_inferred__0/i__carry__5_n_4 ;
  wire \ARG_inferred__0/i__carry__5_n_5 ;
  wire \ARG_inferred__0/i__carry__5_n_6 ;
  wire \ARG_inferred__0/i__carry__5_n_7 ;
  wire \ARG_inferred__0/i__carry__6_n_1 ;
  wire \ARG_inferred__0/i__carry__6_n_2 ;
  wire \ARG_inferred__0/i__carry__6_n_3 ;
  wire \ARG_inferred__0/i__carry__6_n_5 ;
  wire \ARG_inferred__0/i__carry__6_n_6 ;
  wire \ARG_inferred__0/i__carry__6_n_7 ;
  wire \ARG_inferred__0/i__carry_n_0 ;
  wire \ARG_inferred__0/i__carry_n_1 ;
  wire \ARG_inferred__0/i__carry_n_2 ;
  wire \ARG_inferred__0/i__carry_n_3 ;
  wire \ARG_inferred__0/i__carry_n_4 ;
  wire \ARG_inferred__0/i__carry_n_5 ;
  wire \ARG_inferred__0/i__carry_n_6 ;
  wire \ARG_inferred__0/i__carry_n_7 ;
  wire [31:0]MO_AXIS_TDATA;
  wire MO_AXIS_TDATA0;
  wire MO_AXIS_TLAST;
  wire MO_AXIS_TREADY;
  wire MO_AXIS_TVALID_i_1_n_0;
  wire [6:2]RESIZE;
  wire [15:0]SD_AXIS_TDATA;
  wire SD_AXIS_TLAST;
  wire SD_AXIS_TREADY;
  wire SD_AXIS_TREADY_i_1_n_0;
  wire SD_AXIS_TUSER;
  wire SD_AXIS_TVALID;
  wire [31:0]accumulated_value;
  wire \accumulated_value[1]_i_2_n_0 ;
  wire \accumulated_value[31]_i_3_n_0 ;
  wire accumulated_value_0;
  wire [1:0]currentState;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry__1_i_4_n_0;
  wire i__carry__2_i_1_n_0;
  wire i__carry__2_i_2_n_0;
  wire i__carry__2_i_3_n_0;
  wire i__carry__2_i_4_n_0;
  wire i__carry__3_i_1_n_0;
  wire i__carry__3_i_2_n_0;
  wire i__carry__3_i_3_n_0;
  wire i__carry__3_i_4_n_0;
  wire i__carry__4_i_1_n_0;
  wire i__carry__4_i_2_n_0;
  wire i__carry__4_i_3_n_0;
  wire i__carry__4_i_4_n_0;
  wire i__carry__5_i_1_n_0;
  wire i__carry__5_i_2_n_0;
  wire i__carry__5_i_3_n_0;
  wire i__carry__5_i_4_n_0;
  wire i__carry__6_i_1_n_0;
  wire i__carry__6_i_2_n_0;
  wire i__carry__6_i_3_n_0;
  wire i__carry__6_i_4_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire [1:0]nextState;
  wire outputOccurred;
  wire outputOccurred0;
  wire outputOccurred_i_1_n_0;
  wire p_0_in;
  wire p_0_out0;
  wire [31:0]p_1_in;
  wire [3:0]NLW_ARG__0_carry__0_CO_UNCONNECTED;
  wire [3:1]NLW_ARG__0_carry__0_O_UNCONNECTED;
  wire [3:3]\NLW_ARG_inferred__0/i__carry__6_CO_UNCONNECTED ;

  CARRY4 ARG__0_carry
       (.CI(1'b0),
        .CO({ARG__0_carry_n_0,ARG__0_carry_n_1,ARG__0_carry_n_2,ARG__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({ARG__0_carry_i_1_n_0,ARG__0_carry_i_2_n_0,ARG__0_carry_i_3_n_0,1'b0}),
        .O(RESIZE[5:2]),
        .S({ARG__0_carry_i_4_n_0,ARG__0_carry_i_5_n_0,ARG__0_carry_i_6_n_0,ARG__0_carry_i_7_n_0}));
  CARRY4 ARG__0_carry__0
       (.CI(ARG__0_carry_n_0),
        .CO({NLW_ARG__0_carry__0_CO_UNCONNECTED[3:2],ARG__0_carry__0_n_2,NLW_ARG__0_carry__0_CO_UNCONNECTED[0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,ARG__0_carry__0_i_1_n_0}),
        .O({NLW_ARG__0_carry__0_O_UNCONNECTED[3:1],RESIZE[6]}),
        .S({1'b0,1'b0,1'b1,ARG__0_carry__0_i_2_n_0}));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    ARG__0_carry__0_i_1
       (.I0(ARG__0_carry__0_i_3_n_0),
        .I1(ARG__0_carry__0_i_4_n_0),
        .I2(SD_AXIS_TDATA[7]),
        .I3(ARG__0_carry__0_i_5_n_0),
        .I4(SD_AXIS_TDATA[3]),
        .I5(ARG__0_carry__0_i_6_n_0),
        .O(ARG__0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    ARG__0_carry__0_i_2
       (.I0(ARG__0_carry__0_i_1_n_0),
        .I1(SD_AXIS_TDATA[3]),
        .I2(ARG__0_carry__0_i_7_n_0),
        .I3(SD_AXIS_TDATA[7]),
        .O(ARG__0_carry__0_i_2_n_0));
  LUT5 #(
    .INIT(32'h00003373)) 
    ARG__0_carry__0_i_3
       (.I0(SD_AXIS_TDATA[4]),
        .I1(SD_AXIS_TDATA[6]),
        .I2(SD_AXIS_TDATA[1]),
        .I3(SD_AXIS_TDATA[5]),
        .I4(SD_AXIS_TDATA[2]),
        .O(ARG__0_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000FF7FFF)) 
    ARG__0_carry__0_i_4
       (.I0(SD_AXIS_TDATA[0]),
        .I1(SD_AXIS_TDATA[5]),
        .I2(SD_AXIS_TDATA[4]),
        .I3(SD_AXIS_TDATA[1]),
        .I4(SD_AXIS_TDATA[6]),
        .I5(SD_AXIS_TDATA[2]),
        .O(ARG__0_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFBFFFFF0F0F3F0F)) 
    ARG__0_carry__0_i_5
       (.I0(SD_AXIS_TDATA[0]),
        .I1(SD_AXIS_TDATA[4]),
        .I2(SD_AXIS_TDATA[6]),
        .I3(SD_AXIS_TDATA[1]),
        .I4(SD_AXIS_TDATA[5]),
        .I5(SD_AXIS_TDATA[2]),
        .O(ARG__0_carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'hE0000F7F00FF0FFF)) 
    ARG__0_carry__0_i_6
       (.I0(SD_AXIS_TDATA[4]),
        .I1(SD_AXIS_TDATA[0]),
        .I2(SD_AXIS_TDATA[5]),
        .I3(SD_AXIS_TDATA[2]),
        .I4(SD_AXIS_TDATA[6]),
        .I5(SD_AXIS_TDATA[1]),
        .O(ARG__0_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFF00F080F000)) 
    ARG__0_carry__0_i_7
       (.I0(SD_AXIS_TDATA[0]),
        .I1(SD_AXIS_TDATA[4]),
        .I2(SD_AXIS_TDATA[5]),
        .I3(SD_AXIS_TDATA[2]),
        .I4(SD_AXIS_TDATA[1]),
        .I5(SD_AXIS_TDATA[6]),
        .O(ARG__0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h1DE2)) 
    ARG__0_carry_i_1
       (.I0(ARG__0_carry_i_8_n_0),
        .I1(SD_AXIS_TDATA[3]),
        .I2(ARG__0_carry_i_9_n_0),
        .I3(ARG__0_carry_i_10_n_0),
        .O(ARG__0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h37484F3FB03F4F3F)) 
    ARG__0_carry_i_10
       (.I0(SD_AXIS_TDATA[4]),
        .I1(SD_AXIS_TDATA[3]),
        .I2(SD_AXIS_TDATA[5]),
        .I3(SD_AXIS_TDATA[2]),
        .I4(SD_AXIS_TDATA[6]),
        .I5(SD_AXIS_TDATA[1]),
        .O(ARG__0_carry_i_10_n_0));
  MUXF7 ARG__0_carry_i_11
       (.I0(ARG__0_carry_i_16_n_0),
        .I1(ARG__0_carry_i_17_n_0),
        .O(ARG__0_carry_i_11_n_0),
        .S(SD_AXIS_TDATA[3]));
  LUT6 #(
    .INIT(64'hE0FF00000F800F00)) 
    ARG__0_carry_i_12
       (.I0(SD_AXIS_TDATA[4]),
        .I1(SD_AXIS_TDATA[0]),
        .I2(SD_AXIS_TDATA[5]),
        .I3(SD_AXIS_TDATA[2]),
        .I4(SD_AXIS_TDATA[1]),
        .I5(SD_AXIS_TDATA[6]),
        .O(ARG__0_carry_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFBFFFFFF0F0C0F0)) 
    ARG__0_carry_i_13
       (.I0(SD_AXIS_TDATA[0]),
        .I1(SD_AXIS_TDATA[4]),
        .I2(SD_AXIS_TDATA[6]),
        .I3(SD_AXIS_TDATA[1]),
        .I4(SD_AXIS_TDATA[5]),
        .I5(SD_AXIS_TDATA[2]),
        .O(ARG__0_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'hB8409FBFB73F3F3F)) 
    ARG__0_carry_i_14
       (.I0(SD_AXIS_TDATA[4]),
        .I1(SD_AXIS_TDATA[2]),
        .I2(SD_AXIS_TDATA[5]),
        .I3(SD_AXIS_TDATA[0]),
        .I4(SD_AXIS_TDATA[6]),
        .I5(SD_AXIS_TDATA[1]),
        .O(ARG__0_carry_i_14_n_0));
  LUT6 #(
    .INIT(64'h12EA35151D959595)) 
    ARG__0_carry_i_15
       (.I0(SD_AXIS_TDATA[4]),
        .I1(SD_AXIS_TDATA[2]),
        .I2(SD_AXIS_TDATA[5]),
        .I3(SD_AXIS_TDATA[0]),
        .I4(SD_AXIS_TDATA[6]),
        .I5(SD_AXIS_TDATA[1]),
        .O(ARG__0_carry_i_15_n_0));
  LUT6 #(
    .INIT(64'h1FFFFF00F080F000)) 
    ARG__0_carry_i_16
       (.I0(SD_AXIS_TDATA[4]),
        .I1(SD_AXIS_TDATA[0]),
        .I2(SD_AXIS_TDATA[5]),
        .I3(SD_AXIS_TDATA[2]),
        .I4(SD_AXIS_TDATA[1]),
        .I5(SD_AXIS_TDATA[6]),
        .O(ARG__0_carry_i_16_n_0));
  LUT6 #(
    .INIT(64'h00400000F0F0C0F0)) 
    ARG__0_carry_i_17
       (.I0(SD_AXIS_TDATA[0]),
        .I1(SD_AXIS_TDATA[4]),
        .I2(SD_AXIS_TDATA[6]),
        .I3(SD_AXIS_TDATA[1]),
        .I4(SD_AXIS_TDATA[5]),
        .I5(SD_AXIS_TDATA[2]),
        .O(ARG__0_carry_i_17_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ARG__0_carry_i_2
       (.I0(ARG__0_carry_i_1_n_0),
        .O(ARG__0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    ARG__0_carry_i_3
       (.I0(SD_AXIS_TDATA[0]),
        .I1(SD_AXIS_TDATA[7]),
        .O(ARG__0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h565656A6A6A656A6)) 
    ARG__0_carry_i_4
       (.I0(ARG__0_carry_i_1_n_0),
        .I1(ARG__0_carry_i_11_n_0),
        .I2(SD_AXIS_TDATA[7]),
        .I3(ARG__0_carry_i_12_n_0),
        .I4(SD_AXIS_TDATA[3]),
        .I5(ARG__0_carry_i_13_n_0),
        .O(ARG__0_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    ARG__0_carry_i_5
       (.I0(ARG__0_carry_i_1_n_0),
        .I1(SD_AXIS_TDATA[7]),
        .I2(SD_AXIS_TDATA[1]),
        .O(ARG__0_carry_i_5_n_0));
  LUT5 #(
    .INIT(32'h88877787)) 
    ARG__0_carry_i_6
       (.I0(SD_AXIS_TDATA[7]),
        .I1(SD_AXIS_TDATA[0]),
        .I2(ARG__0_carry_i_14_n_0),
        .I3(SD_AXIS_TDATA[3]),
        .I4(ARG__0_carry_i_15_n_0),
        .O(ARG__0_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h4B77788878887888)) 
    ARG__0_carry_i_7
       (.I0(SD_AXIS_TDATA[2]),
        .I1(SD_AXIS_TDATA[4]),
        .I2(SD_AXIS_TDATA[6]),
        .I3(SD_AXIS_TDATA[0]),
        .I4(SD_AXIS_TDATA[5]),
        .I5(SD_AXIS_TDATA[1]),
        .O(ARG__0_carry_i_7_n_0));
  LUT6 #(
    .INIT(64'hE000008008000000)) 
    ARG__0_carry_i_8
       (.I0(SD_AXIS_TDATA[4]),
        .I1(SD_AXIS_TDATA[0]),
        .I2(SD_AXIS_TDATA[6]),
        .I3(SD_AXIS_TDATA[5]),
        .I4(SD_AXIS_TDATA[1]),
        .I5(SD_AXIS_TDATA[2]),
        .O(ARG__0_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hCA80800080000000)) 
    ARG__0_carry_i_9
       (.I0(SD_AXIS_TDATA[4]),
        .I1(SD_AXIS_TDATA[0]),
        .I2(SD_AXIS_TDATA[6]),
        .I3(SD_AXIS_TDATA[5]),
        .I4(SD_AXIS_TDATA[1]),
        .I5(SD_AXIS_TDATA[2]),
        .O(ARG__0_carry_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \ARG_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\ARG_inferred__0/i__carry_n_0 ,\ARG_inferred__0/i__carry_n_1 ,\ARG_inferred__0/i__carry_n_2 ,\ARG_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI(accumulated_value[3:0]),
        .O({\ARG_inferred__0/i__carry_n_4 ,\ARG_inferred__0/i__carry_n_5 ,\ARG_inferred__0/i__carry_n_6 ,\ARG_inferred__0/i__carry_n_7 }),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \ARG_inferred__0/i__carry__0 
       (.CI(\ARG_inferred__0/i__carry_n_0 ),
        .CO({\ARG_inferred__0/i__carry__0_n_0 ,\ARG_inferred__0/i__carry__0_n_1 ,\ARG_inferred__0/i__carry__0_n_2 ,\ARG_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(accumulated_value[7:4]),
        .O({\ARG_inferred__0/i__carry__0_n_4 ,\ARG_inferred__0/i__carry__0_n_5 ,\ARG_inferred__0/i__carry__0_n_6 ,\ARG_inferred__0/i__carry__0_n_7 }),
        .S({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \ARG_inferred__0/i__carry__1 
       (.CI(\ARG_inferred__0/i__carry__0_n_0 ),
        .CO({\ARG_inferred__0/i__carry__1_n_0 ,\ARG_inferred__0/i__carry__1_n_1 ,\ARG_inferred__0/i__carry__1_n_2 ,\ARG_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({accumulated_value[10:8],ARG__0_carry__0_n_2}),
        .O({\ARG_inferred__0/i__carry__1_n_4 ,\ARG_inferred__0/i__carry__1_n_5 ,\ARG_inferred__0/i__carry__1_n_6 ,\ARG_inferred__0/i__carry__1_n_7 }),
        .S({i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0,i__carry__1_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \ARG_inferred__0/i__carry__2 
       (.CI(\ARG_inferred__0/i__carry__1_n_0 ),
        .CO({\ARG_inferred__0/i__carry__2_n_0 ,\ARG_inferred__0/i__carry__2_n_1 ,\ARG_inferred__0/i__carry__2_n_2 ,\ARG_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI(accumulated_value[14:11]),
        .O({\ARG_inferred__0/i__carry__2_n_4 ,\ARG_inferred__0/i__carry__2_n_5 ,\ARG_inferred__0/i__carry__2_n_6 ,\ARG_inferred__0/i__carry__2_n_7 }),
        .S({i__carry__2_i_1_n_0,i__carry__2_i_2_n_0,i__carry__2_i_3_n_0,i__carry__2_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \ARG_inferred__0/i__carry__3 
       (.CI(\ARG_inferred__0/i__carry__2_n_0 ),
        .CO({\ARG_inferred__0/i__carry__3_n_0 ,\ARG_inferred__0/i__carry__3_n_1 ,\ARG_inferred__0/i__carry__3_n_2 ,\ARG_inferred__0/i__carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI(accumulated_value[18:15]),
        .O({\ARG_inferred__0/i__carry__3_n_4 ,\ARG_inferred__0/i__carry__3_n_5 ,\ARG_inferred__0/i__carry__3_n_6 ,\ARG_inferred__0/i__carry__3_n_7 }),
        .S({i__carry__3_i_1_n_0,i__carry__3_i_2_n_0,i__carry__3_i_3_n_0,i__carry__3_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \ARG_inferred__0/i__carry__4 
       (.CI(\ARG_inferred__0/i__carry__3_n_0 ),
        .CO({\ARG_inferred__0/i__carry__4_n_0 ,\ARG_inferred__0/i__carry__4_n_1 ,\ARG_inferred__0/i__carry__4_n_2 ,\ARG_inferred__0/i__carry__4_n_3 }),
        .CYINIT(1'b0),
        .DI(accumulated_value[22:19]),
        .O({\ARG_inferred__0/i__carry__4_n_4 ,\ARG_inferred__0/i__carry__4_n_5 ,\ARG_inferred__0/i__carry__4_n_6 ,\ARG_inferred__0/i__carry__4_n_7 }),
        .S({i__carry__4_i_1_n_0,i__carry__4_i_2_n_0,i__carry__4_i_3_n_0,i__carry__4_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \ARG_inferred__0/i__carry__5 
       (.CI(\ARG_inferred__0/i__carry__4_n_0 ),
        .CO({\ARG_inferred__0/i__carry__5_n_0 ,\ARG_inferred__0/i__carry__5_n_1 ,\ARG_inferred__0/i__carry__5_n_2 ,\ARG_inferred__0/i__carry__5_n_3 }),
        .CYINIT(1'b0),
        .DI(accumulated_value[26:23]),
        .O({\ARG_inferred__0/i__carry__5_n_4 ,\ARG_inferred__0/i__carry__5_n_5 ,\ARG_inferred__0/i__carry__5_n_6 ,\ARG_inferred__0/i__carry__5_n_7 }),
        .S({i__carry__5_i_1_n_0,i__carry__5_i_2_n_0,i__carry__5_i_3_n_0,i__carry__5_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \ARG_inferred__0/i__carry__6 
       (.CI(\ARG_inferred__0/i__carry__5_n_0 ),
        .CO({\NLW_ARG_inferred__0/i__carry__6_CO_UNCONNECTED [3],\ARG_inferred__0/i__carry__6_n_1 ,\ARG_inferred__0/i__carry__6_n_2 ,\ARG_inferred__0/i__carry__6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,accumulated_value[29:27]}),
        .O({p_0_out0,\ARG_inferred__0/i__carry__6_n_5 ,\ARG_inferred__0/i__carry__6_n_6 ,\ARG_inferred__0/i__carry__6_n_7 }),
        .S({i__carry__6_i_1_n_0,i__carry__6_i_2_n_0,i__carry__6_i_3_n_0,i__carry__6_i_4_n_0}));
  LUT4 #(
    .INIT(16'h0800)) 
    \MO_AXIS_TDATA[31]_i_1 
       (.I0(currentState[1]),
        .I1(MO_AXIS_TREADY),
        .I2(currentState[0]),
        .I3(ARESETN),
        .O(MO_AXIS_TDATA0));
  FDRE \MO_AXIS_TDATA_reg[0] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[0]),
        .Q(MO_AXIS_TDATA[0]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[10] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[10]),
        .Q(MO_AXIS_TDATA[10]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[11] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[11]),
        .Q(MO_AXIS_TDATA[11]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[12] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[12]),
        .Q(MO_AXIS_TDATA[12]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[13] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[13]),
        .Q(MO_AXIS_TDATA[13]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[14] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[14]),
        .Q(MO_AXIS_TDATA[14]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[15] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[15]),
        .Q(MO_AXIS_TDATA[15]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[16] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[16]),
        .Q(MO_AXIS_TDATA[16]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[17] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[17]),
        .Q(MO_AXIS_TDATA[17]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[18] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[18]),
        .Q(MO_AXIS_TDATA[18]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[19] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[19]),
        .Q(MO_AXIS_TDATA[19]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[1] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[1]),
        .Q(MO_AXIS_TDATA[1]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[20] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[20]),
        .Q(MO_AXIS_TDATA[20]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[21] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[21]),
        .Q(MO_AXIS_TDATA[21]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[22] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[22]),
        .Q(MO_AXIS_TDATA[22]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[23] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[23]),
        .Q(MO_AXIS_TDATA[23]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[24] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[24]),
        .Q(MO_AXIS_TDATA[24]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[25] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[25]),
        .Q(MO_AXIS_TDATA[25]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[26] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[26]),
        .Q(MO_AXIS_TDATA[26]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[27] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[27]),
        .Q(MO_AXIS_TDATA[27]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[28] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[28]),
        .Q(MO_AXIS_TDATA[28]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[29] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[29]),
        .Q(MO_AXIS_TDATA[29]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[2] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[2]),
        .Q(MO_AXIS_TDATA[2]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[30] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[30]),
        .Q(MO_AXIS_TDATA[30]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[31] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[31]),
        .Q(MO_AXIS_TDATA[31]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[3] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[3]),
        .Q(MO_AXIS_TDATA[3]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[4] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[4]),
        .Q(MO_AXIS_TDATA[4]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[5] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[5]),
        .Q(MO_AXIS_TDATA[5]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[6] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[6]),
        .Q(MO_AXIS_TDATA[6]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[7] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[7]),
        .Q(MO_AXIS_TDATA[7]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[8] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[8]),
        .Q(MO_AXIS_TDATA[8]),
        .R(1'b0));
  FDRE \MO_AXIS_TDATA_reg[9] 
       (.C(ACLK),
        .CE(MO_AXIS_TDATA0),
        .D(accumulated_value[9]),
        .Q(MO_AXIS_TDATA[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hC8FF0800)) 
    MO_AXIS_TVALID_i_1
       (.I0(MO_AXIS_TREADY),
        .I1(currentState[1]),
        .I2(currentState[0]),
        .I3(ARESETN),
        .I4(MO_AXIS_TLAST),
        .O(MO_AXIS_TVALID_i_1_n_0));
  FDRE MO_AXIS_TVALID_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(MO_AXIS_TVALID_i_1_n_0),
        .Q(MO_AXIS_TLAST),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hEF2F)) 
    SD_AXIS_TREADY_i_1
       (.I0(MO_AXIS_TREADY),
        .I1(currentState[0]),
        .I2(currentState[1]),
        .I3(SD_AXIS_TREADY),
        .O(SD_AXIS_TREADY_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    SD_AXIS_TREADY_i_2
       (.I0(ARESETN),
        .O(p_0_in));
  FDPE SD_AXIS_TREADY_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(SD_AXIS_TREADY_i_1_n_0),
        .PRE(p_0_in),
        .Q(SD_AXIS_TREADY));
  LUT6 #(
    .INIT(64'hAF008F0FAF008000)) 
    \accumulated_value[0]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(SD_AXIS_TDATA[4]),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[0]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry_n_7 ),
        .O(p_1_in[0]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[10]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[10]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__1_n_5 ),
        .O(p_1_in[10]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[11]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[11]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__1_n_4 ),
        .O(p_1_in[11]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[12]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[12]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__2_n_7 ),
        .O(p_1_in[12]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[13]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[13]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__2_n_6 ),
        .O(p_1_in[13]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[14]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[14]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__2_n_5 ),
        .O(p_1_in[14]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[15]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__2_n_4 ),
        .O(p_1_in[15]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[16]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__3_n_7 ),
        .O(p_1_in[16]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[17]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__3_n_6 ),
        .O(p_1_in[17]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[18]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__3_n_5 ),
        .O(p_1_in[18]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[19]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__3_n_4 ),
        .O(p_1_in[19]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \accumulated_value[1]_i_1 
       (.I0(\accumulated_value[1]_i_2_n_0 ),
        .I1(currentState[1]),
        .I2(SD_AXIS_TDATA[1]),
        .I3(SD_AXIS_TUSER),
        .I4(\ARG_inferred__0/i__carry_n_6 ),
        .O(p_1_in[1]));
  LUT6 #(
    .INIT(64'h9DC80000C8C80000)) 
    \accumulated_value[1]_i_2 
       (.I0(SD_AXIS_TUSER),
        .I1(SD_AXIS_TDATA[1]),
        .I2(SD_AXIS_TDATA[4]),
        .I3(SD_AXIS_TDATA[5]),
        .I4(\accumulated_value[31]_i_3_n_0 ),
        .I5(SD_AXIS_TDATA[0]),
        .O(\accumulated_value[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[20]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__4_n_7 ),
        .O(p_1_in[20]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[21]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__4_n_6 ),
        .O(p_1_in[21]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[22]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__4_n_5 ),
        .O(p_1_in[22]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[23]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__4_n_4 ),
        .O(p_1_in[23]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[24]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__5_n_7 ),
        .O(p_1_in[24]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[25]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__5_n_6 ),
        .O(p_1_in[25]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[26]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__5_n_5 ),
        .O(p_1_in[26]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[27]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__5_n_4 ),
        .O(p_1_in[27]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[28]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__6_n_7 ),
        .O(p_1_in[28]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[29]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__6_n_6 ),
        .O(p_1_in[29]));
  LUT6 #(
    .INIT(64'hAF008F8FAF008080)) 
    \accumulated_value[2]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(RESIZE[2]),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[2]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry_n_5 ),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[30]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__6_n_5 ),
        .O(p_1_in[30]));
  LUT4 #(
    .INIT(16'h2F20)) 
    \accumulated_value[31]_i_1 
       (.I0(MO_AXIS_TREADY),
        .I1(currentState[0]),
        .I2(currentState[1]),
        .I3(SD_AXIS_TVALID),
        .O(accumulated_value_0));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[31]_i_2 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[15]),
        .I4(SD_AXIS_TUSER),
        .I5(p_0_out0),
        .O(p_1_in[31]));
  LUT3 #(
    .INIT(8'h0B)) 
    \accumulated_value[31]_i_3 
       (.I0(SD_AXIS_TVALID),
        .I1(MO_AXIS_TREADY),
        .I2(currentState[0]),
        .O(\accumulated_value[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAF008F8FAF008080)) 
    \accumulated_value[3]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(RESIZE[3]),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[3]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry_n_4 ),
        .O(p_1_in[3]));
  LUT6 #(
    .INIT(64'hAF008F8FAF008080)) 
    \accumulated_value[4]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(RESIZE[4]),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[4]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__0_n_7 ),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'hAF008F8FAF008080)) 
    \accumulated_value[5]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(RESIZE[5]),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[5]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__0_n_6 ),
        .O(p_1_in[5]));
  LUT6 #(
    .INIT(64'hAF008F8FAF008080)) 
    \accumulated_value[6]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(RESIZE[6]),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[6]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__0_n_5 ),
        .O(p_1_in[6]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[7]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[7]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__0_n_4 ),
        .O(p_1_in[7]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[8]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[8]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__1_n_7 ),
        .O(p_1_in[8]));
  LUT6 #(
    .INIT(64'hAF002F2FAF002020)) 
    \accumulated_value[9]_i_1 
       (.I0(\accumulated_value[31]_i_3_n_0 ),
        .I1(ARG__0_carry__0_n_2),
        .I2(currentState[1]),
        .I3(SD_AXIS_TDATA[9]),
        .I4(SD_AXIS_TUSER),
        .I5(\ARG_inferred__0/i__carry__1_n_6 ),
        .O(p_1_in[9]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[0] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[0]),
        .Q(accumulated_value[0]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[10] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[10]),
        .Q(accumulated_value[10]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[11] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[11]),
        .Q(accumulated_value[11]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[12] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[12]),
        .Q(accumulated_value[12]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[13] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[13]),
        .Q(accumulated_value[13]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[14] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[14]),
        .Q(accumulated_value[14]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[15] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[15]),
        .Q(accumulated_value[15]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[16] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[16]),
        .Q(accumulated_value[16]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[17] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[17]),
        .Q(accumulated_value[17]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[18] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[18]),
        .Q(accumulated_value[18]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[19] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[19]),
        .Q(accumulated_value[19]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[1] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[1]),
        .Q(accumulated_value[1]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[20] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[20]),
        .Q(accumulated_value[20]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[21] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[21]),
        .Q(accumulated_value[21]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[22] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[22]),
        .Q(accumulated_value[22]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[23] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[23]),
        .Q(accumulated_value[23]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[24] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[24]),
        .Q(accumulated_value[24]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[25] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[25]),
        .Q(accumulated_value[25]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[26] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[26]),
        .Q(accumulated_value[26]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[27] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[27]),
        .Q(accumulated_value[27]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[28] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[28]),
        .Q(accumulated_value[28]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[29] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[29]),
        .Q(accumulated_value[29]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[2] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[2]),
        .Q(accumulated_value[2]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[30] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[30]),
        .Q(accumulated_value[30]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[31] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[31]),
        .Q(accumulated_value[31]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[3] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[3]),
        .Q(accumulated_value[3]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[4] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[4]),
        .Q(accumulated_value[4]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[5] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[5]),
        .Q(accumulated_value[5]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[6] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[6]),
        .Q(accumulated_value[6]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[7] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[7]),
        .Q(accumulated_value[7]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[8] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[8]),
        .Q(accumulated_value[8]));
  FDCE #(
    .INIT(1'b0)) 
    \accumulated_value_reg[9] 
       (.C(ACLK),
        .CE(accumulated_value_0),
        .CLR(p_0_in),
        .D(p_1_in[9]),
        .Q(accumulated_value[9]));
  LUT5 #(
    .INIT(32'h00004F00)) 
    \currentState[0]_i_1 
       (.I0(currentState[0]),
        .I1(MO_AXIS_TREADY),
        .I2(currentState[1]),
        .I3(SD_AXIS_TVALID),
        .I4(SD_AXIS_TLAST),
        .O(nextState[0]));
  LUT6 #(
    .INIT(64'h30F4004430F70044)) 
    \currentState[1]_i_1 
       (.I0(MO_AXIS_TREADY),
        .I1(currentState[1]),
        .I2(SD_AXIS_TVALID),
        .I3(currentState[0]),
        .I4(SD_AXIS_TLAST),
        .I5(outputOccurred),
        .O(nextState[1]));
  FDCE #(
    .INIT(1'b0)) 
    \currentState_reg[0] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(nextState[0]),
        .Q(currentState[0]));
  FDCE #(
    .INIT(1'b0)) 
    \currentState_reg[1] 
       (.C(ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(nextState[1]),
        .Q(currentState[1]));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_1
       (.I0(ARG__0_carry__0_n_2),
        .I1(accumulated_value[7]),
        .O(i__carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_2
       (.I0(accumulated_value[6]),
        .I1(RESIZE[6]),
        .O(i__carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_3
       (.I0(accumulated_value[5]),
        .I1(RESIZE[5]),
        .O(i__carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_4
       (.I0(accumulated_value[4]),
        .I1(RESIZE[4]),
        .O(i__carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_1
       (.I0(accumulated_value[10]),
        .I1(accumulated_value[11]),
        .O(i__carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_2
       (.I0(accumulated_value[9]),
        .I1(accumulated_value[10]),
        .O(i__carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_3
       (.I0(accumulated_value[8]),
        .I1(accumulated_value[9]),
        .O(i__carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_4
       (.I0(ARG__0_carry__0_n_2),
        .I1(accumulated_value[8]),
        .O(i__carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_1
       (.I0(accumulated_value[14]),
        .I1(accumulated_value[15]),
        .O(i__carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_2
       (.I0(accumulated_value[13]),
        .I1(accumulated_value[14]),
        .O(i__carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_3
       (.I0(accumulated_value[12]),
        .I1(accumulated_value[13]),
        .O(i__carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_4
       (.I0(accumulated_value[11]),
        .I1(accumulated_value[12]),
        .O(i__carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_1
       (.I0(accumulated_value[18]),
        .I1(accumulated_value[19]),
        .O(i__carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_2
       (.I0(accumulated_value[17]),
        .I1(accumulated_value[18]),
        .O(i__carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_3
       (.I0(accumulated_value[16]),
        .I1(accumulated_value[17]),
        .O(i__carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_4
       (.I0(accumulated_value[15]),
        .I1(accumulated_value[16]),
        .O(i__carry__3_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_1
       (.I0(accumulated_value[22]),
        .I1(accumulated_value[23]),
        .O(i__carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_2
       (.I0(accumulated_value[21]),
        .I1(accumulated_value[22]),
        .O(i__carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_3
       (.I0(accumulated_value[20]),
        .I1(accumulated_value[21]),
        .O(i__carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_4
       (.I0(accumulated_value[19]),
        .I1(accumulated_value[20]),
        .O(i__carry__4_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_1
       (.I0(accumulated_value[26]),
        .I1(accumulated_value[27]),
        .O(i__carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_2
       (.I0(accumulated_value[25]),
        .I1(accumulated_value[26]),
        .O(i__carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_3
       (.I0(accumulated_value[24]),
        .I1(accumulated_value[25]),
        .O(i__carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_4
       (.I0(accumulated_value[23]),
        .I1(accumulated_value[24]),
        .O(i__carry__5_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_1
       (.I0(accumulated_value[31]),
        .I1(accumulated_value[30]),
        .O(i__carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_2
       (.I0(accumulated_value[29]),
        .I1(accumulated_value[30]),
        .O(i__carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_3
       (.I0(accumulated_value[28]),
        .I1(accumulated_value[29]),
        .O(i__carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_4
       (.I0(accumulated_value[27]),
        .I1(accumulated_value[28]),
        .O(i__carry__6_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_1
       (.I0(accumulated_value[3]),
        .I1(RESIZE[3]),
        .O(i__carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_2
       (.I0(accumulated_value[2]),
        .I1(RESIZE[2]),
        .O(i__carry_i_2_n_0));
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    i__carry_i_3
       (.I0(accumulated_value[1]),
        .I1(SD_AXIS_TDATA[0]),
        .I2(SD_AXIS_TDATA[5]),
        .I3(SD_AXIS_TDATA[4]),
        .I4(SD_AXIS_TDATA[1]),
        .O(i__carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    i__carry_i_4
       (.I0(accumulated_value[0]),
        .I1(SD_AXIS_TDATA[4]),
        .I2(SD_AXIS_TDATA[0]),
        .O(i__carry_i_4_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    outputOccurred_i_1
       (.I0(currentState[1]),
        .I1(outputOccurred0),
        .I2(outputOccurred),
        .O(outputOccurred_i_1_n_0));
  LUT6 #(
    .INIT(64'h0502000200000000)) 
    outputOccurred_i_2
       (.I0(SD_AXIS_TVALID),
        .I1(SD_AXIS_TLAST),
        .I2(currentState[0]),
        .I3(currentState[1]),
        .I4(MO_AXIS_TREADY),
        .I5(ARESETN),
        .O(outputOccurred0));
  FDRE #(
    .INIT(1'b0)) 
    outputOccurred_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(outputOccurred_i_1_n_0),
        .Q(outputOccurred),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "staged_mac_bd_staged_mac_0_0,staged_mac,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "staged_mac,Vivado 2020.1" *) 
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TDATA" *) input [15:0]SD_AXIS_TDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TLAST" *) input SD_AXIS_TLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TUSER" *) input SD_AXIS_TUSER;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TVALID" *) input SD_AXIS_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SD_AXIS TID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SD_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN staged_mac_bd_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [7:0]SD_AXIS_TID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 MO_AXIS TVALID" *) output MO_AXIS_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 MO_AXIS TDATA" *) output [31:0]MO_AXIS_TDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 MO_AXIS TLAST" *) output MO_AXIS_TLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 MO_AXIS TREADY" *) input MO_AXIS_TREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 MO_AXIS TID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME MO_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN staged_mac_bd_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [7:0]MO_AXIS_TID;

  wire \<const0> ;
  wire ACLK;
  wire ARESETN;
  wire [31:0]MO_AXIS_TDATA;
  wire MO_AXIS_TLAST;
  wire MO_AXIS_TREADY;
  wire [15:0]SD_AXIS_TDATA;
  wire SD_AXIS_TLAST;
  wire SD_AXIS_TREADY;
  wire SD_AXIS_TUSER;
  wire SD_AXIS_TVALID;

  assign MO_AXIS_TID[7] = \<const0> ;
  assign MO_AXIS_TID[6] = \<const0> ;
  assign MO_AXIS_TID[5] = \<const0> ;
  assign MO_AXIS_TID[4] = \<const0> ;
  assign MO_AXIS_TID[3] = \<const0> ;
  assign MO_AXIS_TID[2] = \<const0> ;
  assign MO_AXIS_TID[1] = \<const0> ;
  assign MO_AXIS_TID[0] = \<const0> ;
  assign MO_AXIS_TVALID = MO_AXIS_TLAST;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_staged_mac inst
       (.ACLK(ACLK),
        .ARESETN(ARESETN),
        .MO_AXIS_TDATA(MO_AXIS_TDATA),
        .MO_AXIS_TLAST(MO_AXIS_TLAST),
        .MO_AXIS_TREADY(MO_AXIS_TREADY),
        .SD_AXIS_TDATA(SD_AXIS_TDATA),
        .SD_AXIS_TLAST(SD_AXIS_TLAST),
        .SD_AXIS_TREADY(SD_AXIS_TREADY),
        .SD_AXIS_TUSER(SD_AXIS_TUSER),
        .SD_AXIS_TVALID(SD_AXIS_TVALID));
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
