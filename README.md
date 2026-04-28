# ML CNN on ZedBoard

This repository collects the CprE 487/587 lab work and final project for running neural-network inference on a ZedBoard. The work moves from Python model training, to a C++ inference framework, to custom FPGA datapaths for multiply-accumulate and convolution acceleration.

The main question across the labs was: how much of a CNN-style inference pipeline can we move from normal software into hardware, and what has to change in the model representation, memory layout, and test flow to make that practical on the Zynq/ZedBoard platform?

## Repository Map

| Path | What it contains |
| --- | --- |
| `1-Python_CNN_Training/` | First Python/TensorFlow notebook work, data, logs, and trained model artifacts. |
| `2-CPP_Inference_Framework/` | Baseline C++ ML framework and ZedBoard file-transfer flow. |
| `3-First_FPGA_MAC_Integration/` | Early hardware/software integration around a custom MAC and simple Zynq interface. |
| `4-FPGA_MAC_Variants/` | MAC design iterations: staged, piped, fixed-width, and variable-width hardware. |
| `5-Tiling_SIMD_Optimizations/` | Continued acceleration work with tiling, SIMD-oriented software paths, and system integration. |
| `6-Custom_Quantized_CNN_Accelerator/` | Quantized convolution accelerator work, VHDL modules, testbench generator, and framework integration. |
| `7-Transformers_On_ZedBoard/` | Final submitted Vision Transformer report plus optimized C++ software implementation. |
| `read_these_docs/API.md` | Human-readable API notes for the C++ ML framework and hardware-facing interfaces. |

Several folders include generated Vivado/Vitis workspaces and binary data. When reading the repo, start with each lab README, the framework `src/` folders, `6-Custom_Quantized_CNN_Accelerator/template/hdl/`, and the final project README before diving into generated tool output.

## Lab Story

1. **Python CNN training.** Train and inspect neural-network behavior in Python before moving inference onto embedded hardware.
2. **C++ inference baseline.** Use the course C++ framework to represent layers, binary weights, layer outputs, and model execution.
3. **First FPGA MAC integration.** Connect Zynq software to a custom MAC through a simple hardware interface.
4. **FPGA MAC variants.** Compare staged, piped, fixed-width, and variable-width MAC implementations.
5. **Tiling and SIMD optimization.** Improve software execution and integrate accelerator-oriented system pieces.
6. **Custom quantized CNN accelerator.** Build a quantized convolution datapath with BRAM, AXI-stream style data movement, MAC lanes, dequantization, optional ReLU, and output storage.
7. **Transformers on ZedBoard.** Explore a Vision Transformer in C++, including software optimization and hardware acceleration ideas.

## Common Tools

- **Python/Jupyter** for model development, training, and verification.
- **C++17-style framework code** for host and ZedBoard inference.
- **Vivado/Vitis** for FPGA block design, bitstreams, XSA export, and ZedBoard deployment.
- **Binary weight/input/output files** for reproducible layer-by-layer comparisons between Python, C++, and hardware.

## How To Read This Repo

Start here, then open the README inside the lab you care about. For API-level code orientation, read `read_these_docs/API.md`. For the final project, read `7-Transformers_On_ZedBoard/README.MD`.

If a directory contains `workspace`, `vivado`, `simple_interface.runs`, `export`, or BSP/library trees, expect generated tool output. The student-authored logic is usually in `src/`, `python/`, `hdl/`, `tb/`, `scripts/`, and top-level notebooks.
