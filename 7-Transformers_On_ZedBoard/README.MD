# Final Project Submission 08

This folder contains the submitted final project report and optimized C++ implementation.

## Contents

| Path | Purpose |
| --- | --- |
| `Final_Project_Report_08.pdf` | Final written report. |
| `cpp_SW_optimizations/` | Optimized software-only C++ implementation of the Vision Transformer inference path. |

## Project Summary

The final project explored a Vision Transformer implementation across Python, C++, and ZedBoard-oriented acceleration. Python notebooks were used to train, resize, inspect, and verify the model. The C++ work recreated the inference path with explicit layer classes and binary model files so performance could be measured outside PyTorch.

The optimized C++ submission focuses on software performance improvements such as tighter loops, better memory reuse, and quantized/accelerated execution modes. The earlier lab work supplied the hardware background: MAC design, BRAM movement, binary layer data, and ZedBoard deployment.

## Where To Start

1. Read `Final_Project_Report_08.pdf` for the final explanation and results.
2. Open `cpp_SW_optimizations/README.md` for build/run instructions.
3. Read `cpp_SW_optimizations/src/Model.h` and `cpp_SW_optimizations/src/layers/` for the implementation structure.
4. See `../docs/API.md` for a cross-lab API map.
