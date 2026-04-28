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


// Build our ML toy model (fp32 path)
Model buildToyModel(const Path modelPath) {
    Model model;
    logInfo("--- Building Toy Model ---");

    // --- Conv 1: L1 ---
    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(fp32), {64, 64, 3}},
        LayerParams{sizeof(fp32), {60, 60, 32}},
        LayerParams{sizeof(fp32), {5, 5, 3, 32}, modelPath / "conv1_weights.bin"},
        LayerParams{sizeof(fp32), {32}, modelPath / "conv1_biases.bin"},
        0);

    // --- Conv 2: L2 ---
    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(fp32), {60, 60, 32}},
        LayerParams{sizeof(fp32), {56, 56, 32}},
        LayerParams{sizeof(fp32), {5, 5, 32, 32}, modelPath / "conv2_weights.bin"},
        LayerParams{sizeof(fp32), {32}, modelPath / "conv2_biases.bin"},
        1);

    // --- MPL 1: L3 ---
    model.addLayer<MaxPoolingLayer>(
        LayerParams{sizeof(fp32), {56, 56, 32}},
        LayerParams{sizeof(fp32), {28, 28, 32}},
        2,
        2);

    // --- Conv 3: L4 ---
    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(fp32), {28, 28, 32}},
        LayerParams{sizeof(fp32), {26, 26, 64}},
        LayerParams{sizeof(fp32), {3, 3, 32, 64}, modelPath / "conv3_weights.bin"},
        LayerParams{sizeof(fp32), {64}, modelPath / "conv3_biases.bin"},
        2);

    // --- Conv 4: L5 ---
    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(fp32), {26, 26, 64}},
        LayerParams{sizeof(fp32), {24, 24, 64}},
        LayerParams{sizeof(fp32), {3, 3, 64, 64}, modelPath / "conv4_weights.bin"},
        LayerParams{sizeof(fp32), {64}, modelPath / "conv4_biases.bin"},
        3);

    // --- MPL 2: L6 ---
    model.addLayer<MaxPoolingLayer>(
        LayerParams{sizeof(fp32), {24, 24, 64}},
        LayerParams{sizeof(fp32), {12, 12, 64}},
        2,
        2);

    // --- Conv 5: L7 ---
    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(fp32), {12, 12, 64}},
        LayerParams{sizeof(fp32), {10, 10, 64}},
        LayerParams{sizeof(fp32), {3, 3, 64, 64}, modelPath / "conv5_weights.bin"},
        LayerParams{sizeof(fp32), {64}, modelPath / "conv5_biases.bin"},
        4);

    // --- Conv 6: L8 ---
    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(fp32), {10, 10, 64}},
        LayerParams{sizeof(fp32), {8, 8, 128}},
        LayerParams{sizeof(fp32), {3, 3, 64, 128}, modelPath / "conv6_weights.bin"},
        LayerParams{sizeof(fp32), {128}, modelPath / "conv6_biases.bin"},
        5);

    // --- MPL 3: L9 ---
    model.addLayer<MaxPoolingLayer>(
        LayerParams{sizeof(fp32), {8, 8, 128}},
        LayerParams{sizeof(fp32), {4, 4, 128}},
        2,
        2);

    // --- Flatten 1: L10 ---
    model.addLayer<FlattenLayer>(
        LayerParams{sizeof(fp32), {4, 4, 128}},
        LayerParams{sizeof(fp32), {2048}});

    // --- Dense 1: L11 ---
    model.addLayer<DenseLayer>(
        LayerParams{sizeof(fp32), {2048}},
        LayerParams{sizeof(fp32), {256}},
        LayerParams{sizeof(fp32), {2048, 256}, modelPath / "dense1_weights.bin"},
        LayerParams{sizeof(fp32), {256}, modelPath / "dense1_biases.bin"},
        true);

    // --- Dense 2: L12 ---
    model.addLayer<DenseLayer>(
        LayerParams{sizeof(fp32), {256}},
        LayerParams{sizeof(fp32), {200}},
        LayerParams{sizeof(fp32), {256, 200}, modelPath / "dense2_weights.bin"},
        LayerParams{sizeof(fp32), {200}, modelPath / "dense2_biases.bin"},
        false);

    // --- Softmax 1: L13 ---
    model.addLayer<SoftmaxLayer>(
        LayerParams{sizeof(fp32), {200}},
        LayerParams{sizeof(fp32), {200}});

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
    logInfo(std::string("--- Running Layer Test ") + std::to_string(layerNum) + " ---");

    const Layer& layer = model[layerNum];
    const auto& inParams = layer.getInputParams();
    const auto& outParams = layer.getOutputParams();
    const Layer::LayerType layerType = layer.getLType();
    const bool supportsSIMD =
        layerType == Layer::LayerType::CONVOLUTIONAL || layerType == Layer::LayerType::MAX_POOLING ||
        layerType == Layer::LayerType::DENSE;

    const Path inputFile = (layerNum == 0)
                               ? basePath / "image_0.bin"
                               : basePath / "image_0_data" / ("layer_" + std::to_string(layerNum - 1) + "_output.bin");
    const Path expectedFile = basePath / "image_0_data" / ("layer_" + std::to_string(layerNum) + "_output.bin");

    LayerData input({inParams.elementSize, inParams.dims, inputFile});
    input.loadData();

    const bool runSoftmaxAfter =
        layer.getLType() == Layer::LayerType::DENSE && (layerNum + 1 < model.getNumLayers()) &&
        model[layerNum + 1].getLType() == Layer::LayerType::SOFTMAX;

    if (runSoftmaxAfter) {
        Timer timer("Layer Inference");
        timer.start();
        const LayerData& denseOut = model.inferenceLayer(input, static_cast<int>(layerNum), Layer::InfType::NAIVE);
        const LayerData& softmaxOut =
            model.inferenceLayer(denseOut, static_cast<int>(layerNum + 1), Layer::InfType::NAIVE);
        timer.stop();

        LayerData expected(model[layerNum + 1].getOutputParams(), expectedFile);
        expected.loadData();
        logInfo("Dense->Softmax vs expected (layer " + std::to_string(layerNum) + ")");
        softmaxOut.compareWithinPrint<fp32>(expected);

        LayerData softmaxNaiveCopy(softmaxOut);

        if (supportsSIMD) {
            const LayerData& denseSIMD =
                model.inferenceLayer(input, static_cast<int>(layerNum), Layer::InfType::SIMD);
            const LayerData& softmaxFromSIMD =
                model.inferenceLayer(denseSIMD, static_cast<int>(layerNum + 1), Layer::InfType::NAIVE);

            logInfo("Dense SIMD->Softmax vs expected (layer " + std::to_string(layerNum) + ")");
            softmaxFromSIMD.compareWithinPrint<fp32>(expected);
            logInfo("Dense SIMD->Softmax vs Naive (layer " + std::to_string(layerNum) + ")");
            softmaxFromSIMD.compareWithinPrint<fp32>(softmaxNaiveCopy);
        }
        return;
    }

    Timer timer("Layer Inference");
    timer.start();
    const LayerData& outputNaive = model.inferenceLayer(input, static_cast<int>(layerNum), Layer::InfType::NAIVE);
    timer.stop();

    LayerData expected(outParams, expectedFile);
    expected.loadData();
    logInfo("Naive vs expected (layer " + std::to_string(layerNum) + ")");
    outputNaive.compareWithinPrint<fp32>(expected);

    if (supportsSIMD) {
        LayerData naiveCopy(outputNaive);
        const LayerData& outputSIMD = model.inferenceLayer(input, static_cast<int>(layerNum), Layer::InfType::SIMD);
        logInfo("SIMD vs expected (layer " + std::to_string(layerNum) + ")");
        outputSIMD.compareWithinPrint<fp32>(expected);
        logInfo("SIMD vs Naive (layer " + std::to_string(layerNum) + ")");
        outputSIMD.compareWithinPrint<fp32>(naiveCopy);
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
    const LayerData& output = model.inference(img, Layer::InfType::NAIVE);
    timer.stop();

    // Compare the output
    // Construct a LayerData object from a LayerParams one
    LayerData expected(model.getOutputLayer().getOutputParams(), basePath / "image_0_data" / "layer_11_output.bin");
    expected.loadData();
    output.compareWithinPrint<fp32>(expected);
}

void runTests() {
    // Base input data path (determined from current directory of where you are running the command)
    Path basePath("data_fp32");  // Floating-point regression assets for Lab 5

    // Build the model and allocate the buffers
    Model model = buildToyModel(basePath / "model");
    model.allocLayers();

    // Run some framework tests as an example of loading data
    //runBasicTest(model, basePath);

    //Convolution Layer
    runLayerTest(0, model, basePath);

    runLayerTest(1, model, basePath);

    // //Max Pooling Layer
    runLayerTest(2, model, basePath);

    runLayerTest(3, model, basePath);

    runLayerTest(4, model, basePath);

    runLayerTest(5, model, basePath);

    runLayerTest(6, model, basePath);

    runLayerTest(7, model, basePath);

    runLayerTest(8, model, basePath);

    // //Flattening Layer
    runLayerTest(9, model, basePath);

    // //Dense Layer (ReLU)
    runLayerTest(10, model, basePath);

    // //Dense Layer (Softmax)
    runLayerTest(11, model, basePath);

    // // Run an end-to-end inference test
    runInferenceTest(model, basePath);

    // // Clean up
    // model.freeLayers();
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
