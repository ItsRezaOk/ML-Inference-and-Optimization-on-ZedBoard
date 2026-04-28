# Lab Guide

This is a compact guide for explaining the repo to someone new to the project.

## Big Picture

The labs build up an embedded ML inference stack:

1. Train or verify a model in Python.
2. Export weights, inputs, and expected outputs as binary files.
3. Recreate the model in C++.
4. Compare C++ layer outputs against Python outputs.
5. Move expensive arithmetic into FPGA hardware.
6. Integrate the hardware through Vitis/XSA and run on the ZedBoard.

## Why The Repo Looks Large

Vivado and Vitis generate many files. They are useful for reconstructing the exact submitted environment, but they are not all equally useful for understanding the work.

Read these first:

- Lab READMEs.
- `src/` for framework logic.
- `hdl/` for student hardware.
- `tb/` for simulation/testbench logic.
- `python/` or notebooks for training and verification.
- `scripts/` for deployment flow.

Read generated workspaces only when you need a specific build artifact, exported hardware platform, or BSP setting.

## What We Were Trying To Learn

- How neural-network layers are represented as memory buffers.
- How floating-point and quantized arithmetic affect hardware design.
- How to verify hardware against known-good software outputs.
- How BRAM layout and streaming interfaces shape accelerator design.
- How Zynq software controls custom FPGA logic.
