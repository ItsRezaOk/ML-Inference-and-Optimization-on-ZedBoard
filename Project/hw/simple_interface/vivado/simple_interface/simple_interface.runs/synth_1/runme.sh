#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/remote/Xilinx/2020.1/Vitis/2020.1/bin:/remote/Xilinx/2020.1/Vivado/2020.1/ids_lite/ISE/bin/lin64:/remote/Xilinx/2020.1/Vivado/2020.1/bin
else
  PATH=/remote/Xilinx/2020.1/Vitis/2020.1/bin:/remote/Xilinx/2020.1/Vivado/2020.1/ids_lite/ISE/bin/lin64:/remote/Xilinx/2020.1/Vivado/2020.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/cam2022/CPRE-487_git/CPRE-4870/Project/hw/simple_interface/vivado/simple_interface/simple_interface.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log staged_mac_bd_wrapper.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source staged_mac_bd_wrapper.tcl
