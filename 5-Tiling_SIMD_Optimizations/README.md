# Lab 5

This folder continues the hardware/software integration work around the accelerator system. Its structure is similar to Lab 3 because it carries forward simple interfaces, MAC blocks, system-level hardware, demo assets, and a software framework copy.

## What To Look At

- `mlp_conv/` and `mlp_system/`: accelerator-oriented hardware/system work.
- `piped_mac/` and `staged_mac/`: MAC design blocks reused or compared during integration.
- `simple_interface/`: board-level integration.
- `sw/cpre487-587-dnn-framework-main/`: software framework used to build and deploy inference code.
- `picsForDemo/`: demo images.

## What We Did

We pushed the design from isolated arithmetic blocks toward a more complete accelerator system. The important lesson was that FPGA acceleration is a full data-movement problem: the computation block, memory mapping, software driver flow, and validation outputs all have to agree.
