# Lab 6

Lab 6 is the quantized CNN convolution accelerator lab. It combines C++ framework integration with VHDL modules for address generation, BRAM access, parallel MAC lanes, dequantization, and output storage.

## What To Look At

- `lab6_template/hdl/`: main VHDL accelerator modules.
- `lab6_template/tb/`: VHDL/Python testbench generation.
- `lab6_template/diagram.md`: Mermaid diagram of the accelerator data path.
- `hw/MAC/`, `hw/IndexGen/`, `hw/OutputStorage/`, `hw/Dequanitzation/`: IP-focused hardware work.
- `cpre487-587-dnn-framework-main/`: framework copy and deployment scripts used with the accelerator.
- `cpre487-587-dnn-framework-main/*.xsa`: exported hardware platforms for different MAC/accelerator variants.

## What We Did

We built a convolution accelerator around quantized operands. The accelerator reads input and filter data from BRAM, streams operand pairs into four MAC lanes, combines the outputs, applies dequantization/ReLU logic, and writes packed results back to output BRAM.

## Why It Matters

Convolution dominates many CNN workloads. This lab connects the earlier MAC experiments to a realistic layer-level accelerator, where correctness depends on address generation, memory banking, output layout, and software-visible configuration as much as raw multiply-accumulate speed.

## Related Docs

See `../docs/API.md` for the hardware module map and framework interfaces.
