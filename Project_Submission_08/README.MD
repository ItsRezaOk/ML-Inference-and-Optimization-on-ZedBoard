# Vision Transformer (ViT) Project

This repository contains a complete exploration of a Vision Transformer (ViT) implemented and optimized in Python (PyTorch), C++, and FPGA hardware for the Zedboard.

## Project Structure

```
.
├── cpp_SW_optimizations/      # Optimized pure-software C++ implementation
├── cpp_framework/             # Base C++ framework (naive + hardware-accelerated)
├── hw/                        # FP32 MAC unit + Vivado testbenches
├── pythonEra/                 # Python scripts and Jupyter notebooks
├── screenshots_plots/         # Result screenshots and plots
└── README.md
```

### cpp_SW_optimizations/
Optimized software-only C++ implementation with loop unrolling, tiling, SIMD, etc.  
Does **not** use the hardware MAC — designed for maximum CPU performance.

**Run:**
```bash
cd cpp_SW_optimizations/make
make
../build/ml
```

### cpp_framework/
Main C++ framework containing:
- Naive software baseline
- Hardware-accelerated version using the custom FP32 MAC on the Zedboard

**Run on host (software mode):**
```bash
cd cpp_framework/make
make
../build/ml
```

**Run on Zedboard (HW mode):** same flow as Lab 3 MAC (load bitstream + ELF).

### hw/
Vivado project with the custom FP32 MAC unit (HLS C++/SystemVerilog) and testbenches.

**Run:**
- Open project in Vivado
- Run behavioral simulation or synthesize → generate bitstream

### pythonEra/
All PyTorch model development, training, and verification.

**Setup:**
```bash
cd pythonEra
python -m venv venv
source venv/bin/activate    # Windows: venv\Scripts\activate
pip install -r requirements.txt
jupyter lab
```

**Key notebooks:**
- `ViT_TinyImageNet.ipynb` – dataset loading, model creation, tuning, training, saves baseline models (.pth)
- `Multi_Size_ViT.ipynb` – accuracy/performance comparison of 4 ViT sizes
- `ViT_Math_Verification.ipynb` – manual NumPy inference vs PyTorch for bit-exact validation

Pre-trained `.pth` files are included when repository size permits.

### screenshots_plots/
Terminal outputs, accuracy plots, and performance screenshots from C++ and Python runs.

## Quick Start

```bash
# Python exploration
cd pythonEra

# Optimized C++ (software only)
cd cpp_SW_optimizations/make && make && ../build/ml

# Baseline / HW-accelerated C++
cd cpp_framework/make && make && ../build/ml   # or deploy to Zedboard

# Hardware MAC verification
Open hw/ project in Vivado → Run simulation
```

Enjoy comparing ViT inference across PyTorch, optimized C++, and custom FPGA acceleration!
