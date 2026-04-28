vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/lib_fifo_v1_0_14
vlib activehdl/axi_fifo_mm_s_v4_2_3
vlib activehdl/xil_defaultlib
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_7
vlib activehdl/processing_system7_vip_v1_0_9
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/axis_infrastructure_v1_1_0
vlib activehdl/axis_register_slice_v1_1_21
vlib activehdl/axis_subset_converter_v1_1_21
vlib activehdl/gigantic_mux
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_data_fifo_v2_1_20
vlib activehdl/axi_register_slice_v2_1_21
vlib activehdl/axi_protocol_converter_v2_1_21

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap lib_fifo_v1_0_14 activehdl/lib_fifo_v1_0_14
vmap axi_fifo_mm_s_v4_2_3 activehdl/axi_fifo_mm_s_v4_2_3
vmap xil_defaultlib activehdl/xil_defaultlib
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_7 activehdl/axi_vip_v1_1_7
vmap processing_system7_vip_v1_0_9 activehdl/processing_system7_vip_v1_0_9
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap axis_infrastructure_v1_1_0 activehdl/axis_infrastructure_v1_1_0
vmap axis_register_slice_v1_1_21 activehdl/axis_register_slice_v1_1_21
vmap axis_subset_converter_v1_1_21 activehdl/axis_subset_converter_v1_1_21
vmap gigantic_mux activehdl/gigantic_mux
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_data_fifo_v2_1_20 activehdl/axi_data_fifo_v2_1_20
vmap axi_register_slice_v2_1_21 activehdl/axi_register_slice_v2_1_21
vmap axi_protocol_converter_v2_1_21 activehdl/axi_protocol_converter_v2_1_21

vlog -work xilinx_vip  -sv2k12 "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/remote/Xilinx/2020.1/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_14 -93 \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_fifo_mm_s_v4_2_3 -93 \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/5bfc/hdl/axi_fifo_mm_s_v4_2_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_axi_fifo_mm_s_0_0/sim/staged_mac_bd_axi_fifo_mm_s_0_0.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_7  -sv2k12 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_9  -sv2k12 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_processing_system7_0_0/sim/staged_mac_bd_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_rst_ps7_0_100M_0/sim/staged_mac_bd_rst_ps7_0_100M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_staged_mac_0_0/sim/staged_mac_bd_staged_mac_0_0.v" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_register_slice_v1_1_21  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/7da1/hdl/axis_register_slice_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tdata_staged_mac_bd_axis_subset_converter_0_0.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tuser_staged_mac_bd_axis_subset_converter_0_0.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tstrb_staged_mac_bd_axis_subset_converter_0_0.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tkeep_staged_mac_bd_axis_subset_converter_0_0.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tid_staged_mac_bd_axis_subset_converter_0_0.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tdest_staged_mac_bd_axis_subset_converter_0_0.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/tlast_staged_mac_bd_axis_subset_converter_0_0.v" \

vlog -work axis_subset_converter_v1_1_21  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/128c/hdl/axis_subset_converter_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/hdl/top_staged_mac_bd_axis_subset_converter_0_0.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_axis_subset_converter_0_0/sim/staged_mac_bd_axis_subset_converter_0_0.v" \
"../../../bd/staged_mac_bd/sim/staged_mac_bd.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_system_ila_0_0/bd_0/ip/ip_0/sim/bd_8f44_ila_lib_0.v" \

vlog -work gigantic_mux  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/d322/hdl/gigantic_mux_v1_0_cntr.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_system_ila_0_0/bd_0/ip/ip_1/bd_8f44_g_inst_0_gigantic_mux.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_system_ila_0_0/bd_0/ip/ip_1/sim/bd_8f44_g_inst_0.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_system_ila_0_0/bd_0/sim/bd_8f44.v" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_system_ila_0_0/sim/staged_mac_bd_system_ila_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_20  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_21  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_21  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/ec67/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/6b56/hdl" "+incdir+../../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ipshared/8713/hdl" "+incdir+/remote/Xilinx/2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/staged_mac_bd/ip/staged_mac_bd_auto_pc_0/sim/staged_mac_bd_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

