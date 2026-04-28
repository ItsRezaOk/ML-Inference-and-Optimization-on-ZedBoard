# Lab 3

Lab 3 is the first major hardware/software bridge. It contains simple Vivado interfaces, custom MAC blocks, and a software framework copy used to drive or validate accelerator behavior from the ZedBoard side.

## What To Look At

- `staged_mac/`, `piped_mac/`, `mlp_conv/`, `mlp_system/`: hardware block experiments.
- `simple_interface/` and `simple_interface_piped/`: Zynq/Vivado integration projects.
- `sw/cpre487-587-dnn-framework-main/`: C++ framework used with the hardware design.
- `picsForDemo/`: demo images and visual proof points.
- `lab6_template/`: course-provided template material carried forward into later labs.

## What We Did

We moved from a pure software model toward hardware acceleration by creating MAC-oriented hardware blocks and connecting them through a simple Zynq interface. The focus was less on final CNN speed and more on proving that software could configure hardware, move data, and validate results.
