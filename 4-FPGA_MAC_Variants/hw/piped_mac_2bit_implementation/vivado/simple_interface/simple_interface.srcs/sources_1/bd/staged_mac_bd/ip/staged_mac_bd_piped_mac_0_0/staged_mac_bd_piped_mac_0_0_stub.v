// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon Oct 27 18:12:20 2025
// Host        : co2050-04.ece.iastate.edu running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/cam2022/CPRE-487_git/CPRE-4870/Lab4/hw/piped_mac_2bit_implementation/vivado/simple_interface/simple_interface.srcs/sources_1/bd/staged_mac_bd/ip/staged_mac_bd_piped_mac_0_0/staged_mac_bd_piped_mac_0_0_stub.v
// Design      : staged_mac_bd_piped_mac_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "piped_mac,Vivado 2020.1" *)
module staged_mac_bd_piped_mac_0_0(ACLK, ARESETN, SD_AXIS_TREADY, SD_AXIS_TDATA, 
  SD_AXIS_TLAST, SD_AXIS_TUSER, SD_AXIS_TVALID, SD_AXIS_TID, MO_AXIS_TVALID, MO_AXIS_TDATA, 
  MO_AXIS_TLAST, MO_AXIS_TREADY, MO_AXIS_TID)
/* synthesis syn_black_box black_box_pad_pin="ACLK,ARESETN,SD_AXIS_TREADY,SD_AXIS_TDATA[7:0],SD_AXIS_TLAST,SD_AXIS_TUSER,SD_AXIS_TVALID,SD_AXIS_TID[7:0],MO_AXIS_TVALID,MO_AXIS_TDATA[31:0],MO_AXIS_TLAST,MO_AXIS_TREADY,MO_AXIS_TID[7:0]" */;
  input ACLK;
  input ARESETN;
  output SD_AXIS_TREADY;
  input [7:0]SD_AXIS_TDATA;
  input SD_AXIS_TLAST;
  input SD_AXIS_TUSER;
  input SD_AXIS_TVALID;
  input [7:0]SD_AXIS_TID;
  output MO_AXIS_TVALID;
  output [31:0]MO_AXIS_TDATA;
  output MO_AXIS_TLAST;
  input MO_AXIS_TREADY;
  output [7:0]MO_AXIS_TID;
endmodule
