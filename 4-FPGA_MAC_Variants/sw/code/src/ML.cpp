#include <iostream>
#include <sstream>
#include <vector>

#include "Config.h"
#include "Model.h"
#include "Types.h"
#include "Utils.h"
#include "layers/Convolutional.h"
#include "layers/Dense.h"
#include "layers/Layer.h"
#include "layers/MaxPooling.h"
#include "layers/Softmax.h"
#include "layers/Flatten.h"

#ifdef ZEDBOARD
#include <file_transfer/file_transfer.h>
#endif

namespace ML {


// Build our ML toy model
Model buildToyModel(const Path modelPath) {
    Model model;
    logInfo("--- Building Toy Model ---");



    // --- Conv 1: L1 ---
    // Input shape: 64x64x3
    // Output shape: 60x60x32

    // You can pick how you want to implement your layers, both are allowed:

    // LayerParams conv1_inDataParam(sizeof(fp32), {64, 64, 3});
    // LayerParams conv1_outDataParam(sizeof(fp32), {60, 60, 32});
    // LayerParams conv1_weightParam(sizeof(fp32), {5, 5, 3, 32}, modelPath / "conv1_weights.bin");
    // LayerParams conv1_biasParam(sizeof(fp32), {32}, modelPath / "conv1_biases.bin");
    // auto conv1 = new ConvolutionalLayer(conv1_inDataParam, conv1_outDataParam, conv1_weightParam, conv1_biasParam);

    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(std::int8_t), {64, 64, 3}},                                              // Input Data
        LayerParams{sizeof(std::int8_t), {60, 60, 32}},                                             // Output Data
        LayerParams{sizeof(std::int8_t), {5, 5, 3, 32}, modelPath / "conv2d_weights.bin"},           // Weights
        LayerParams{sizeof(std::int32_t), {32}, modelPath / "conv2d_biases.bin"},                      // Bias
        0                        //Weight Scales
    );

    // --- Conv 2: L2 ---
    // Input shape: 60x60x32
    // Output shape: 56x56x32

    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(std::int8_t), {60, 60, 32}},                                    // Input Data
        LayerParams{sizeof(std::int8_t), {56, 56, 32}},                                   // Output Data
        LayerParams{sizeof(std::int8_t), {5, 5, 32, 32}, modelPath / "conv2d_1_weights.bin"}, // Weights TODO: CONFIRM CORRECT VALUES
        LayerParams{sizeof(std::int32_t), {32}, modelPath / "conv2d_1_biases.bin"},
        1               // Bias
    );

    // --- MPL 1: L3 ---
    // Input shape: 56x56x32
    // Output shape: 28x28x32

    model.addLayer<MaxPoolingLayer>(
        LayerParams{sizeof(std::int8_t), {56, 56, 32}},  // Input Data
        LayerParams{sizeof(std::int8_t), {28, 28, 32}},  // Output Data
        2,                                       // Pool Size
        2                                        // Stride
    );

    // --- Conv 3: L4 ---
    // Input shape: 28x28x32
    // Output shape: 26x26x64

    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(std::int8_t), {28, 28, 32}},                                    // Input Data
        LayerParams{sizeof(std::int8_t), {26, 26, 64}},                                   // Output Data
        LayerParams{sizeof(std::int8_t), {3, 3, 32, 64}, modelPath / "conv2d_2_weights.bin"}, // Weights
        LayerParams{sizeof(std::int32_t), {64}, modelPath / "conv2d_2_biases.bin"},
        2
    );

    // --- Conv 4: L5 ---
    // Input shape: 26x26x64
    // Output shape: 24x24x64

    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(std::int8_t), {26, 26, 64}},                                    // Input Data
        LayerParams{sizeof(std::int8_t), {24, 24, 64}},                                   // Output Data
        LayerParams{sizeof(std::int8_t), {3, 3, 64, 64}, modelPath / "conv2d_3_weights.bin"}, // Weights
        LayerParams{sizeof(std::int32_t), {64}, modelPath / "conv2d_3_biases.bin"},
        3               // Bias
    );

    // --- MPL 2: L6 ---
    // Input shape: 24x24x64
    // Output shape: 12x12x64


    model.addLayer<MaxPoolingLayer>(
        LayerParams{sizeof(std::int8_t), {24, 24, 64}},  // Input Data
        LayerParams{sizeof(std::int8_t), {12, 12, 64}},  // Output Data
        2,                                       // Pool Size
        2                                        // Stride
    );


    // --- Conv 5: L7 ---
    // Input shape: 12x12x64
    // Output shape: 10x10x64

    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(std::int8_t), {12, 12, 64}},                                    // Input Data
        LayerParams{sizeof(std::int8_t), {10, 10, 64}},                                   // Output Data
        LayerParams{sizeof(std::int8_t), {3, 3, 64, 64}, modelPath / "conv2d_4_weights.bin"}, // Weights
        // ----Updates----
        LayerParams{sizeof(std::int32_t), {64}, modelPath / "conv2d_4_biases.bin"},
        // ----End Updates----
        4            // Bias
    );

    // --- Conv 6: L8 ---
    // Input shape: 10x10x64
    // Output shape: 8x8x128

    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(std::int8_t), {10, 10, 64}},                                    // Input Data
        LayerParams{sizeof(std::int8_t), {8, 8, 128}},                                   // Output Data
        LayerParams{sizeof(std::int8_t), {3, 3, 64, 128}, modelPath / "conv2d_5_weights.bin"}, // Weights
        // ----Updates----
        LayerParams{sizeof(std::int32_t), {128}, modelPath / "conv2d_5_biases.bin"},
        // ----End Updates----
        5               // Bias
    );

    // --- MPL 3: L9 ---
    // Input shape: 8x8x128
    // Output shape: 4x4x128

    model.addLayer<MaxPoolingLayer>(
        LayerParams{sizeof(std::int8_t), {8, 8, 128}},  // Input Data
        LayerParams{sizeof(std::int8_t), {4, 4, 128}},  // Output Data
        2,                                       // Pool Size
        2                                        // Stride
    );

    // --- Flatten 1: L10 ---
    // Input shape: 4x4x128
    // Output shape: 2048

    model.addLayer<FlattenLayer>(
        LayerParams{sizeof(std::int8_t), {4, 4, 128}},  // Input Data
        LayerParams{sizeof(std::int8_t), {2048}}        // Output Data
    );
    

    // --- Dense 1: L11 ---
    // Input shape: 2048
    // Output shape: 256

    model.addLayer<DenseLayer>(
        LayerParams{sizeof(std::int8_t), {2048}},                                    // Input Data
        LayerParams{sizeof(std::int8_t), {256}},                                   // Output Data
        LayerParams{sizeof(std::int8_t), {2048, 256}, modelPath / "dense_weights.bin"}, // Weights
        // ----Updates----
        LayerParams{sizeof(std::int32_t), {256}, modelPath / "dense_biases.bin"},            // Bias
        // ----End Updates----
        true
    );
 

    // --- Dense 2: L12 ---
    // Input shape: 256
    // Output shape: 200

    model.addLayer<DenseLayer>(
        LayerParams{sizeof(std::int8_t), {256}},                                    // Input Data
        LayerParams{sizeof(fp32), {200}},                                   // Output Data FUCK THIS WAS FUCKING US WHHHHHAA
        LayerParams{sizeof(std::int8_t), {256, 200}, modelPath / "dense_1_weights.bin"}, // Weights
        // ----Updates----
        LayerParams{sizeof(std::int32_t), {200}, modelPath / "dense_1_biases.bin"},            // Bias
        // ----End Updates----
        false
    );

    

    // --- Softmax 1: L13 ---
    // Input shape: 200
    // Output shape: 200


    model.addLayer<SoftmaxLayer>(
        LayerParams{sizeof(fp32), {200}},  // Input Data
        LayerParams{sizeof(fp32), {200}}          // Output Data
    );

    return model;
}

void runBasicTest(const Model& model, const Path& basePath) {
    logInfo("--- Running Basic Test ---");

    // Load an image
    LayerData img = {{sizeof(fp32), {64, 64, 3}, "./data/image_0.bin"}};
    img.loadData();

    // Compare images
    std::cout << "Comparing image 0 to itself (max error): " << img.compare<fp32>(img) << std::endl
              << "Comparing image 0 to itself (T/F within epsilon " << ML::Config::EPSILON << "): " << std::boolalpha
              << img.compareWithin<fp32>(img, ML::Config::EPSILON) << std::endl;

    // Test again with a modified copy
    std::cout << "\nChange a value by 0.1 and compare again" << std::endl;
    
    LayerData imgCopy = img;
    imgCopy.get<fp32>(0) += 0.1;

    // Compare images
    img.compareWithinPrint<fp32>(imgCopy);

    // Test again with a modified copy
    log("Change a value by 0.1 and compare again...");
    imgCopy.get<fp32>(0) += 0.1;

    // Compare Images
    img.compareWithinPrint<fp32>(imgCopy);
}

void runLayerTest(const std::size_t layerNum, const Model& model, const Path& basePath) {
    // Load an image
    logInfo(std::string("--- Running Layer Test ") + std::to_string(layerNum) + "---");

    if(layerNum == 0)
    {
        // Construct a LayerData object from a LayerParams one
        // LayerData img(model[layerNum].getInputParams(), test_image_files[layerNum].first);
        dimVec inDims = {64, 64, 3};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        // Run inference on the model
        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        // Compare the output
        // Construct a LayerData object from a LayerParams one
        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_0_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    } 
        else if(layerNum == 1)
    {
        dimVec inDims = {60, 60, 32};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_0_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_1_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    } 
    else if(layerNum == 2)
    {
        dimVec inDims = {56, 56, 32};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_1_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_2_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    } 
        else if(layerNum == 3)
    {
        dimVec inDims = {28, 28, 32};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_2_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_3_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    } 
        else if(layerNum == 4)
    {
        dimVec inDims = {26, 26, 64};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_3_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_4_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    } 
        else if(layerNum == 5)
    {
        dimVec inDims = {24, 24, 64};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_4_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_5_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    } 
            else if(layerNum == 6)
    {
        dimVec inDims = {12, 12, 64};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_5_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_6_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    } 
        else if(layerNum == 7)
    {
        dimVec inDims = {10, 10, 64};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_6_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_7_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    } 
    else if(layerNum == 8)
    {
        dimVec inDims = {8, 8, 128};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_7_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_8_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    } 
    else if(layerNum == 9)
    {
        dimVec inDims = {4, 4, 128};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_8_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_9_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    }     
    else if(layerNum == 10)
    {
        dimVec inDims = {2048};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_9_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_10_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    }
    else if(layerNum == 11)
    {
        dimVec inDims = {256};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_10_output.bin"});
        img.loadData();

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& outputDense = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        const LayerData& outputSoftmax = model.inferenceLayer(outputDense, layerNum+1, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        LayerData expected(outputSoftmax.getParams(), basePath / "image_0_data" / "layer_11_output.bin");
        expected.loadData();
        outputSoftmax.compareWithinPrint<fp32>(expected);
    }
}

void runInferenceTest(const Model& model, const Path& basePath) {
    // Load an image
    logInfo("--- Running Inference Test ---");

    // Construct a LayerData object from a LayerParams one
    LayerData img(model[0].getInputParams(), basePath / "image_0.bin");
    img.loadData();

    Timer timer("Full Inference");

    // Run inference on the model
    timer.start();
    const LayerData& output = model.inference(img, Layer::InfType::COMPUTEACCELERATED);
    timer.stop();

    // Compare the output
    // Construct a LayerData object from a LayerParams one
    LayerData expected(model.getOutputLayer().getOutputParams(), basePath / "image_0_data" / "layer_11_output.bin");
    expected.loadData();
    output.compareWithinPrint<fp32>(expected);
}

#ifndef QUANT_BITS
#define QUANT_BITS 8
#endif

#if QUANT_BITS == 8
#define BASE_PATH "data/8bit"
#define MODEL_PATH "data/model/8bit"
#endif

#if QUANT_BITS == 4
#define BASE_PATH "data/4bit"
#define MODEL_PATH "data/model/4bit"
#endif

#if QUANT_BITS == 2
#define BASE_PATH "data/2bit"
#define MODEL_PATH "data/model/2bit"
#endif

void runTests() {
    // Base input data path (determined from current directory of where you are running the command)
    Path basePath(BASE_PATH);  // May need to be altered for zedboards loading from SD Cards

    // Build the model and allocate the buffers
    Model model = buildToyModel(basePath / "model");
    model.allocLayers();

    // Run some framework tests as an example of loading data
    //runBasicTest(model, basePath);

    //Convolution Layer
    runLayerTest(0, model, basePath);

    runLayerTest(1, model, basePath);

    //Max Pooling Layer
    runLayerTest(2, model, basePath);

    runLayerTest(3, model, basePath);

    runLayerTest(4, model, basePath);

    runLayerTest(5, model, basePath);

    runLayerTest(6, model, basePath);

    runLayerTest(7, model, basePath);

    runLayerTest(8, model, basePath);

    //Flattening Layer
    runLayerTest(9, model, basePath);

    //Dense Layer (ReLU)
    runLayerTest(10, model, basePath);

    //Dense Layer (Softmax)
    runLayerTest(11, model, basePath);

    // Run an end-to-end inference test
    runInferenceTest(model, basePath);

    // Clean up
    model.freeLayers();
    std::cout << "\n\n----- ML::runTests() COMPLETE -----\n";
}

} // namespace ML

#ifdef ZEDBOARD
extern "C"
int main() {
    try {
        static FATFS fatfs;
        if (f_mount(&fatfs, "/", 1) != FR_OK) {
            throw std::runtime_error("Failed to mount SD card. Is it plugged in?");
        }
        ML::runTests();
    } catch (const std::exception& e) {
        std::cerr << "\n\n----- EXCEPTION THROWN -----\n" << e.what() << '\n';
    }
    std::cout << "\n\n----- STARTING FILE TRANSFER SERVER -----\n";
    FileServer::start_file_transfer_server();
}
#else
int main() {
    ML::runTests();
}
#endif