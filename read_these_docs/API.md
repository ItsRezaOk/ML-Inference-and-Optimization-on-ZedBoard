# API Notes

These notes describe the practical interfaces used across the labs. They are not meant to replace the code; they are a quick map of the objects, data flow, and hardware boundaries that matter when changing or explaining the project.

## C++ ML Framework

The C++ framework appears in several lab folders, especially:

- `2-CPP_Inference_Framework/cpre487-587-dnn-framework-main/src/`
- `3-First_FPGA_MAC_Integration/sw/cpre487-587-dnn-framework-main/src/`
- `4-FPGA_MAC_Variants/sw/cpre487-587-dnn-framework-main/src/`
- `6-Custom_Quantized_CNN_Accelerator/code/src/`
- `7-Transformers_On_ZedBoard/cpp_SW_optimizations/src/`

Most versions share the same shape: a `Model` owns a list of `Layer` objects, each layer owns metadata and output storage, and `LayerData` wraps the raw binary tensors that flow between layers.

## Core Types

### `ML::LayerParams`

Defined in `src/layers/Layer.h`.

Describes a tensor or parameter blob:

- `elementSize`: bytes per element, for example `sizeof(float)` or an integer type.
- `dims`: logical tensor dimensions.
- `filePath`: optional binary file backing the data.
- `flat_count()`: product of all dimensions.
- `byte_size()`: total bytes required by the tensor.

Use it when constructing model inputs, outputs, weights, biases, and intermediate buffers.

### `ML::LayerData`

Defined in `src/layers/Layer.h`.

Owns or exposes the bytes for one tensor:

- `allocData()` / `freeData()` manage internal storage.
- `loadData()` / `saveData()` move binary data to or from files or the ZedBoard SD-card path.
- `raw()` returns an untyped pointer for low-level code.
- `get<T>(flat_index)` reads or writes a typed value by flat index.
- `compare<T>()` and `compareWithinPrint<T>()` support output checking against known-good data.

The framework stores tensors as flat buffers even when `dims` is multi-dimensional. Layer implementations are responsible for translating logical indices into flat offsets.

### `ML::Layer`

Defined in `src/layers/Layer.h`.

Base class for every layer implementation. It stores input/output parameters and the layer output buffer, then exposes several compute backends:

- `computeNaive`
- `computeThreaded`
- `computeTiled`
- `computeSIMD`
- `computeHardware` in the CNN framework variants
- `computeQuantized` and `computeAccelerated` in the final ViT/software optimization variant

The active backend is selected through `Layer::InfType` when running model inference.

### `ML::Model`

Defined in `src/Model.h`.

Owns the ordered layer list:

- `addLayer<T>(...)` constructs and appends a layer.
- `allocLayers()` allocates output buffers and loads each layer's parameters.
- `inference(input, infType)` runs the full model.
- `inferenceLayer(input, layerNum, infType)` runs through a selected layer.
- `getLayer()`, `operator[]`, and `getOutputLayer()` expose layer objects for inspection.
- `freeLayers()` clears owned layers.

Typical flow:

```cpp
ML::Model model;
model.addLayer<ML::ConvolutionalLayer>(...);
model.addLayer<ML::MaxPoolingLayer>(...);
model.addLayer<ML::DenseLayer>(...);
model.allocLayers();

ML::LayerData input(inputParams);
input.loadData();
const ML::LayerData& output = model.inference(input, ML::Layer::InfType::HARDWARE);
```

## CNN Layer Interfaces

The CNN labs use these layer classes:

- `ConvolutionalLayer`: loads weight and bias tensors, then computes feature maps.
- `MaxPoolingLayer`: downsamples feature maps.
- `FlattenLayer`: converts spatial feature maps into dense-layer input.
- `DenseLayer`: fully connected matrix/vector operation.
- `SoftmaxLayer`: converts logits into class-like probabilities.

The same layer interface lets one model compare naive software, optimized software, and hardware-backed execution.

## Final Project ViT Interfaces

`7-Transformers_On_ZedBoard/cpp_SW_optimizations/src/layers/` replaces the CNN layer set with Vision Transformer pieces:

- `PatchEmbedLayer`: converts image patches into token embeddings.
- `LayerNormLayer`: normalizes token channels.
- `TransformerBlockLayer`: performs attention, projection, residual paths, and MLP work.
- `TokenExtractLayer`: selects the class token or output token used for classification.
- `DenseLayer` and `SoftmaxLayer`: final classification stages.

The final project keeps the same framework idea but changes the layer vocabulary from CNN-style image operators to transformer-style token operators.

## ZedBoard File Transfer Interface

The framework scripts use a small HTTP file-transfer server on the ZedBoard. The usual flow is:

1. Start the file-transfer Vitis application.
2. Upload `data/` to the SD card.
3. Stop the transfer app.
4. Create or reuse the Vitis workspace for the selected XSA.
5. Flash and run inference.
6. Use the transfer server again to retrieve outputs.

See each framework's `scripts/README.md` and `zedboard/file_transfer/README.md` for the exact commands.

## Lab 6 Hardware Interfaces

The main accelerator implementation is in `6-Custom_Quantized_CNN_Accelerator/template/hdl/`.

Important modules:

- `conv_accelerator.vhd`: top-level convolution datapath for simulation and integration.
- `conv_config.vhd`: software-visible configuration registers.
- `index_gen.vhd`: produces input/filter address pairs for convolution windows.
- `mac_stream_provider.vhd`: reads BRAM words and streams operand pairs into MAC lanes.
- `conv_mac.vhd`: multiply-accumulate lane.
- `axis_utils.vhd`: stream combiners and buffering helpers.
- `dequantization.vhd`: applies scale, zero point, saturation, and optional ReLU.
- `output_storage.vhd`: writes accelerator results back into output BRAM.
- `conv_accelerator_wrapper.vhd`: wraps the accelerator for the larger block design.

At a high level, the ARM processor configures the accelerator and memory, BRAM supplies input/filter data, four MAC lanes compute output channels in parallel, dequantization converts accumulated values back to the target quantized format, and output storage writes results for later layers or software inspection.

## Data Conventions

- Weights, inputs, layer outputs, and validation outputs are stored as raw `.bin` files.
- `LayerParams` defines how to interpret each raw file.
- Most tests compare layer output files rather than relying only on final accuracy.
- Quantized labs use smaller integer operands to reduce hardware cost and memory bandwidth.

## Where To Change Things

| Goal | Start here |
| --- | --- |
| Add or inspect a C++ layer | `src/layers/` in the relevant lab framework |
| Change model topology | `src/ML.cpp` or the lab notebook/script that builds the model |
| Change binary data paths | `src/Config.h`, model construction, or scripts that upload `data/` |
| Change ZedBoard deployment | `scripts/` and the selected `.xsa` |
| Change Lab 6 convolution hardware | `6-Custom_Quantized_CNN_Accelerator/template/hdl/` |
| Check accelerator behavior | `6-Custom_Quantized_CNN_Accelerator/template/tb/` and generated binary validation data |
