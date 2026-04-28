# Lab 4

Lab 4 explores MAC hardware design choices and their impact on the ZedBoard inference path. The lab includes several hardware variants plus the software framework used to exercise them.

## What To Look At

- `hw/staged_mac_*`: staged MAC designs.
- `hw/piped_mac_*`: pipelined MAC designs.
- `hw/variable_mac*`: variable-width MAC design.
- `hw/simple_interface/`: integration project around the MAC hardware.
- `sw/cpre487-587-dnn-framework-main/`: C++ model framework and ZedBoard scripts.
- `Lab 04 .pdf`: submitted report.

## What We Did

We compared hardware MAC implementations to understand throughput, timing, data width, and integration tradeoffs. These experiments informed later convolution accelerator work, where a single MAC is not enough; memory layout, streaming, and multiple MAC lanes become just as important.
