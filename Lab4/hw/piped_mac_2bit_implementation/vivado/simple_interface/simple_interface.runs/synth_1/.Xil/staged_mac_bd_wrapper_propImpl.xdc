set_property SRC_FILE_INFO {cfile:/home/cam2022/CPRE-487_git/CPRE-4870/Lab4/hw/piped_mac_2bit_implementation/vivado/simple_interface/simple_interface.srcs/sources_1/bd/staged_mac_bd/ip/staged_mac_bd_processing_system7_0_0/staged_mac_bd_processing_system7_0_0/staged_mac_bd_processing_system7_0_0_in_context.xdc rfile:../../../simple_interface.srcs/sources_1/bd/staged_mac_bd/ip/staged_mac_bd_processing_system7_0_0/staged_mac_bd_processing_system7_0_0/staged_mac_bd_processing_system7_0_0_in_context.xdc id:1 order:EARLY scoped_inst:staged_mac_bd_i/processing_system7_0} [current_design]
set_property SRC_FILE_INFO {cfile:/home/cam2022/CPRE-487_git/CPRE-4870/Lab4/hw/piped_mac_2bit_implementation/vivado/simple_interface/simple_interface.srcs/constrs_1/imports/hdl/zedboard.xdc rfile:../../../simple_interface.srcs/constrs_1/imports/hdl/zedboard.xdc id:2} [current_design]
current_instance staged_mac_bd_i/processing_system7_0
set_property src_info {type:SCOPED_XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports {}]
current_instance
set_property src_info {type:XDC file:2 line:361 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]];
set_property src_info {type:XDC file:2 line:366 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];
set_property src_info {type:XDC file:2 line:371 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];
set_property src_info {type:XDC file:2 line:374 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];
set_property src_info {type:XDC file:2 line:376 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 5.00 -name main -waveform {0.000 0.050} [get_ports ACLK]
