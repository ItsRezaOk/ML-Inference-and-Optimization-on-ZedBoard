-makelib xcelium_lib/xilinx_vip -sv \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/remote/Xilinx/2020.1/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_14 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_fifo_mm_s_v4_2_3 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/5bfc/hdl/axi_fifo_mm_s_v4_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_axi_fifo_mm_s_0_0/sim/staged_mac_bd_axi_fifo_mm_s_0_0.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_7 -sv \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_9 -sv \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_processing_system7_0_0/sim/staged_mac_bd_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_rst_ps7_0_100M_0/sim/staged_mac_bd_rst_ps7_0_100M_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_staged_mac_0_0/sim/staged_mac_bd_staged_mac_0_0.v" \
-endlib
-makelib xcelium_lib/axis_infrastructure_v1_1_0 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axis_register_slice_v1_1_21 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/7da1/hdl/axis_register_slice_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tdata_staged_mac_bd_axis_subset_converter_0_0.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tuser_staged_mac_bd_axis_subset_converter_0_0.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tstrb_staged_mac_bd_axis_subset_converter_0_0.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tkeep_staged_mac_bd_axis_subset_converter_0_0.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tid_staged_mac_bd_axis_subset_converter_0_0.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tdest_staged_mac_bd_axis_subset_converter_0_0.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tlast_staged_mac_bd_axis_subset_converter_0_0.v" \
-endlib
-makelib xcelium_lib/axis_subset_converter_v1_1_21 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/128c/hdl/axis_subset_converter_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/top_staged_mac_bd_axis_subset_converter_0_0.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/sim/staged_mac_bd_axis_subset_converter_0_0.v" \
  "../../../bd/staged_mac_bd/sim/staged_mac_bd.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_system_ila_0_0/bd_0/ip/ip_0/sim/bd_8f44_ila_lib_0.v" \
-endlib
-makelib xcelium_lib/gigantic_mux \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/d322/hdl/gigantic_mux_v1_0_cntr.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_system_ila_0_0/bd_0/ip/ip_1/bd_8f44_g_inst_0_gigantic_mux.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_system_ila_0_0/bd_0/ip/ip_1/sim/bd_8f44_g_inst_0.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_system_ila_0_0/bd_0/sim/bd_8f44.v" \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_system_ila_0_0/sim/staged_mac_bd_system_ila_0_0.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_20 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_21 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_21 \
  "../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/staged_mac_bd/ip/staged_mac_bd_auto_pc_0/sim/staged_mac_bd_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

