# Lab 2

Lab 2 introduces the C++ ML framework used as the software reference for later hardware work. The key idea is to represent each network layer as an object with typed input/output metadata and binary weight/output files.

## What To Look At

- `cpre487-587-dnn-framework-main/src/`: model, layer, and tensor container code.
- `cpre487-587-dnn-framework-main/src/layers/`: convolution, pooling, flatten, dense, and softmax layers.
- `cpre487-587-dnn-framework-main/data/`: binary model/input/output data when present.
- `cpre487-587-dnn-framework-main/scripts/`: build, Vitis, flashing, and upload helpers.
- `cpre487-587-dnn-framework-main/zedboard/file_transfer/`: HTTP file-transfer utility for SD-card data.

## What We Did

We used the framework to run inference in software, load raw binary tensors, and prepare the same model structure for ZedBoard deployment. This gave us a stable correctness baseline before replacing parts of the computation with FPGA hardware.

## Related Docs

See `../docs/API.md` for the `Model`, `Layer`, `LayerParams`, and `LayerData` interfaces.
