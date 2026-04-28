#include <fstream>
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
#include "MLP.h"

#ifdef ZEDBOARD
#include <file_transfer/file_transfer.h>


namespace ML {

static void savePackedAndUnpackedOutputs(const LayerData& data, const Path& packedPath, const Path& unpackedPath) {
    data.saveData(packedPath);

    const auto& params = data.getParams();
    if (params.elementSize != sizeof(std::int8_t)) return;

    const std::size_t count = params.flat_count();
    std::vector<std::int32_t> unpacked(count);
    const auto* src = reinterpret_cast<const std::int8_t*>(data.raw());
    for (std::size_t i = 0; i < count; ++i) {
        unpacked[i] = static_cast<std::int32_t>(src[i]);
    }

    const std::size_t bytes = unpacked.size() * sizeof(std::int32_t);

#ifdef ZEDBOARD
    FIL file;
    FRESULT res = f_open(&file, unpackedPath.c_str(), FA_CREATE_ALWAYS | FA_WRITE);
    if (res != FR_OK) {
        throw std::runtime_error("Failed to open binary file: " + unpackedPath +
                                 " (FatFS error: " + std::to_string(res) + ")");
    }
    UINT written = 0;
    res = f_write(&file, unpacked.data(), bytes, &written);
    if (res != FR_OK || written != bytes) {
        f_close(&file);
        throw std::runtime_error("Failed to write file data to: " + unpackedPath +
                                 " (FatFS error: " + std::to_string(res) + ")");
    }
    f_sync(&file);
    f_close(&file);
#else
    std::ofstream file(unpackedPath, std::ios::binary);
    if (!file.is_open()) {
        throw std::runtime_error("Failed to open binary file: " + unpackedPath);
    }
    file.write(reinterpret_cast<const char*>(unpacked.data()), bytes);
    if (!file) {
        throw std::runtime_error("Failed to write file data to: " + unpackedPath);
    }
#endif
}


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
        0,
        false                        //maxpool
    );

    // --- Conv 2: L2 ---
    // Input shape: 60x60x32
    // Output shape: 56x56x32

    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(std::int8_t), {60, 60, 32}},                                    // Input Data
        LayerParams{sizeof(std::int8_t), {28, 28, 32}},                                   // Output Data
        LayerParams{sizeof(std::int8_t), {5, 5, 32, 32}, modelPath / "conv2d_1_weights.bin"}, // Weights TODO: CONFIRM CORRECT VALUES
        LayerParams{sizeof(std::int32_t), {32}, modelPath / "conv2d_1_biases.bin"},
        1,
        true               // maxpool
    );

    // --- MPL 1: L3 ---
    // Input shape: 56x56x32
    // Output shape: 28x28x32

    // model.addLayer<MaxPoolingLayer>(
    //     LayerParams{sizeof(std::int8_t), {56, 56, 32}},  // Input Data
    //     LayerParams{sizeof(std::int8_t), {28, 28, 32}},  // Output Data
    //     2,                                       // Pool Size
    //     2                                        // Stride
    // );

    // --- Conv 3: L4 ---
    // Input shape: 28x28x32
    // Output shape: 26x26x64

    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(std::int8_t), {28, 28, 32}},                                    // Input Data
        LayerParams{sizeof(std::int8_t), {26, 26, 64}},                                   // Output Data
        LayerParams{sizeof(std::int8_t), {3, 3, 32, 64}, modelPath / "conv2d_2_weights.bin"}, // Weights
        LayerParams{sizeof(std::int32_t), {64}, modelPath / "conv2d_2_biases.bin"},
        2,
        false
    );

    // --- Conv 4: L5 ---
    // Input shape: 26x26x64
    // Output shape: 24x24x64

    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(std::int8_t), {26, 26, 64}},                                    // Input Data
        LayerParams{sizeof(std::int8_t), {12, 12, 64}},                                   // Output Data
        LayerParams{sizeof(std::int8_t), {3, 3, 64, 64}, modelPath / "conv2d_3_weights.bin"}, // Weights
        LayerParams{sizeof(std::int32_t), {64}, modelPath / "conv2d_3_biases.bin"},
        3,
        true               // Bias
    );
 
    // --- MPL 2: L6 ---
    // Input shape: 24x24x64
    // Output shape: 12x12x64


    // model.addLayer<MaxPoolingLayer>(
    //     LayerParams{sizeof(std::int8_t), {24, 24, 64}},  // Input Data
    //     LayerParams{sizeof(std::int8_t), {12, 12, 64}},  // Output Data
    //     2,                                       // Pool Size
    //     2                                        // Stride
    // );


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
        4,
        false            // Bias
    );

    // --- Conv 6: L8 ---
    // Input shape: 10x10x64
    // Output shape: 8x8x128

    model.addLayer<ConvolutionalLayer>(
        LayerParams{sizeof(std::int8_t), {10, 10, 64}},                                    // Input Data
        LayerParams{sizeof(std::int8_t), {4, 4, 128}},                                   // Output Data
        LayerParams{sizeof(std::int8_t), {3, 3, 64, 128}, modelPath / "conv2d_5_weights.bin"}, // Weights
        // ----Updates----
        LayerParams{sizeof(std::int32_t), {128}, modelPath / "conv2d_5_biases.bin"},
        // ----End Updates----
        5,
        true               // Bias
    );

    // --- MPL 3: L9 ---
    // Input shape: 8x8x128
    // Output shape: 4x4x128

    // model.addLayer<MaxPoolingLayer>(
    //     LayerParams{sizeof(std::int8_t), {8, 8, 128}},  // Input Data
    //     LayerParams{sizeof(std::int8_t), {4, 4, 128}},  // Output Data
    //     2,                                       // Pool Size
    //     2                                        // Stride
    // );

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
        LayerParams{sizeof(std::int8_t), {200}},                                   // Output Data FUCK THIS WAS FUCKING US WHHHHHAA
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
        LayerParams{sizeof(std::int8_t), {200}},  // Input Data
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

    if(layerNum == 0) {
            
            //runMemoryTest();

            dimVec inDims = {64, 64, 3};
            LayerData img({sizeof(int8_t), inDims, basePath / "image_0.bin"});  // Note: layer_0_input would be image_0.bin, but adjusted for test
            img.loadData();

            // Load activation to BRAM (fed here as per query)
            memcpy_dma(MLP_INPUTS, img.raw(), img.getParams().byte_size());
            
            memcheck(MLP_INPUTS, img.raw(), img.getParams().byte_size());

            Timer timer("Layer Inference");

            timer.start();
            const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
            timer.stop();


            //Xil_Out32(MLP_CTRLA, 1);

            memcpy_dma((int8_t*)output.raw(), MLP_OUTPUTS, output.getParams().byte_size());


            //memcpy_dma(getOutputData().raw(), MLP_OUTPUTS, output.getParams().byte_size());
            //memcheck(output.raw(), MLP_OUTPUTS, output.getParams().byte_size());

            //         //const size_t totalElements = outputHeight * outputWidth * outputDepth;
            // const size_t totalBytes = (64 * 64 * 3) * sizeof(int8_t);

            // // Get a pointer to the start of the data
            // //const int8_t* outputBufferPtr = &getOutputData().get<int8_t>(0);

            // // Open, write the whole buffer, and close
            // std::ofstream outFile("layer_output.bin", std::ios::binary);
            // if (!outFile)
            // {
            //     std::cerr << "Error: Could not open layer_output.bin for writing." << std::endl;
            //     //return;
            // } else {

            // std::cout << "Writing " << totalBytes << " bytes to layer_output.bin" << std::endl;
            // outFile.write(reinterpret_cast<const char *>(output.raw()), totalBytes);
            // outFile.close();
            // }
            savePackedAndUnpackedOutputs(output, "layer_output.bin", "layer_output_unpacked.bin");

            LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_0_output.bin");
            LayerData expectedAgain(output.getParams(), "layer_output.bin");
            expected.loadData();
            expectedAgain.loadData();
            output.compareWithinPrint<int8_t>(expected);
            output.compareWithinPrint<int8_t>(expectedAgain);
        } 
        else if(layerNum == 1) {

            dimVec inDims = {64, 64, 3};
            LayerData img({sizeof(int8_t), inDims, basePath / "image_0.bin"});  // Note: layer_0_input would be image_0.bin, but adjusted for test
            img.loadData();

            // Load activation to BRAM (fed here as per query)
            memcpy_dma(MLP_INPUTS, img.raw(), img.getParams().byte_size());
            
            memcheck(MLP_INPUTS, img.raw(), img.getParams().byte_size());

            Timer timer("Full Inference");

            timer.start();
            const LayerData& output = model.inferenceLayer(img, layerNum-1, Layer::InfType::COMPUTEACCELERATED);
            const LayerData& outputTwo = model.inferenceLayer(output, layerNum, Layer::InfType::COMPUTEACCELERATED);
            const LayerData& outputThree = model.inferenceLayer(outputTwo, layerNum+1, Layer::InfType::COMPUTEACCELERATED);
            const LayerData& outputFour = model.inferenceLayer(outputThree, layerNum+2, Layer::InfType::COMPUTEACCELERATED);
            const LayerData& outputFive = model.inferenceLayer(outputFour, layerNum+3, Layer::InfType::COMPUTEACCELERATED);
            const LayerData& outputSix = model.inferenceLayer(outputFive, layerNum+4, Layer::InfType::COMPUTEACCELERATED);
            const LayerData& flat = model.inferenceLayer(outputSix, layerNum+5, Layer::InfType::COMPUTEACCELERATED);
            const LayerData& outputSeven = model.inferenceLayer(flat, layerNum+6, Layer::InfType::COMPUTEACCELERATED);
            const LayerData& outputEight = model.inferenceLayer(outputSeven, layerNum+7, Layer::InfType::COMPUTEACCELERATED);
            const LayerData& outputNine = model.inferenceLayer(outputEight, layerNum+8, Layer::InfType::COMPUTEACCELERATED);
            timer.stop();

            // dimVec inDims = {60, 60, 32};
            // LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_0_output.bin"});  // Note: layer_0_input would be image_0.bin, but adjusted for test
            // img.loadData();

            // // Load activation to BRAM (fed here as per query)
            // memcpy_dma(MLP_INPUTS, img.raw(), img.getParams().byte_size());
            
            // memcheck(MLP_INPUTS, img.raw(), img.getParams().byte_size());

            // Timer timer("Layer Inference");

            // timer.start();
            // const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
            // timer.stop();
            memcpy_dma((int8_t*)outputNine.raw(), MLP_OUTPUTS, outputNine.getParams().byte_size());

            // savePackedAndUnpackedOutputs(output, "layer1_output.bin", "layer1_output_unpacked.bin");



            LayerData expected(outputNine.getParams(), basePath / "image_0_data" / "layer_11_output.bin");
            //LayerData expectedAgain(outputTwo.getParams(), "layer1_output.bin");
            expected.loadData();
            outputNine.compareWithinPrint<int8_t>(expected);

                        // // print output and get average
            // for(size_t i = 0; i < 20; i++) {
            //     std::cout << "flat[" << i << "] = " << static_cast<int>(flat.get<int8_t>(i)) << std::endl;
            // }
            // int actual_sum = 0;
            // for(size_t i = 0; i < flat.getParams().flat_count(); i++) {
            //     //std::cout << "output[" << i << "] = " << static_cast<int>(output.get<int8_t>(i)) << std::endl;
            //     actual_sum += static_cast<int>(flat.get<int8_t>(i));
            // }
            // float actual_avg = static_cast<float>(actual_sum) / static_cast<float>(flat.getParams().flat_count());
            // std::cout << "Actual sum: " << actual_sum << ", Actual avg: " << actual_avg << std::endl;

            // //print expected
            // for(size_t i = 0; i < 20; i++) {
            //     std::cout << "expected[" << i << "] = " << static_cast<int>(expected.get<int8_t>(i)) << std::endl;
            // }
            // int expected_sum = 0;
            // for(size_t i = 0; i < expected.getParams().flat_count(); i++) {
            //     //std::cout << "expected[" << i << "] = " << static_cast<int>(expected.get<int8_t>(i)) << std::endl;
            //     expected_sum += static_cast<int>(expected.get<int8_t>(i));
            // }
            // float expected_avg = static_cast<float>(expected_sum) / static_cast<float>(expected.getParams().flat_count());
            // std::cout << "Expected sum: " << expected_sum << ", Expected avg: " << expected_avg << std::endl;
            // //expectedAgain.loadData();

            //outputTwo.compareWithinPrint<int8_t>(expectedAgain);
        } 
    //     // Repeat similar pattern for layerNum ==2 to ==8 (conv layers), adding memcpy_dma before timer.start()
    //     // For example:
    //     else if(layerNum == 2) {
    //         dimVec inDims = {28, 28, 32};
    //         LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_1_output.bin"});
    //         img.loadData();

    //         memcpy_dma(MLP_INPUTS, img.getData(), img.getParams().byte_size());

    //         Timer timer("Layer Inference");

    //         timer.start();
    //         const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
    //         timer.stop();

    //         LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_2_output.bin");
    //         expected.loadData();
    //         output.compareWithinPrint<int8_t>(expected);
    //     }
    //     else if(layerNum == 3)
    // {
    //     dimVec inDims = {28, 28, 32};
    //     LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_2_output.bin"});
    //     img.loadData();

    //     Timer timer("Layer Inference");

    //     timer.start();
    //     const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
    //     timer.stop();

    //     LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_3_output.bin");
    //     expected.loadData();
    //     output.compareWithinPrint<int8_t>(expected);
    // } 
    //     else if(layerNum == 5)
    // {
    //     dimVec inDims = {10, 10, 64};
    //     LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_3_output.bin"});
    //     img.loadData();

    //     Timer timer("Layer Inference");

    //     timer.start();
    //     const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
    //     timer.stop();
    //     memcpy_dma((int8_t*)output.raw(), MLP_OUTPUTS, output.getParams().byte_size());

    //     LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_6_output.bin");
    //     expected.loadData();
    //     output.compareWithinPrint<int8_t>(expected);
    // } 
    //     else if(layerNum == 5)
    // {
    //     dimVec inDims = {24, 24, 64};
    //     LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_4_output.bin"});
    //     img.loadData();

    //     Timer timer("Layer Inference");

    //     timer.start();
    //     const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
    //     timer.stop();

    //     LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_5_output.bin");
    //     expected.loadData();
    //     output.compareWithinPrint<int8_t>(expected);
    // } 
    //         else if(layerNum == 6)
    // {
    //     dimVec inDims = {12, 12, 64};
    //     LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_5_output.bin"});
    //     img.loadData();

    //     Timer timer("Layer Inference");

    //     timer.start();
    //     const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
    //     timer.stop();

    //     LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_6_output.bin");
    //     expected.loadData();
    //     output.compareWithinPrint<int8_t>(expected);
    // } 
    //     else if(layerNum == 7)
    // {
    //     dimVec inDims = {10, 10, 64};
    //     LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_6_output.bin"});
    //     img.loadData();

    //     Timer timer("Layer Inference");

    //     timer.start();
    //     const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
    //     timer.stop();

    //     LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_7_output.bin");
    //     expected.loadData();
    //     output.compareWithinPrint<int8_t>(expected);
    // } 
    else if(layerNum == 5)
    {
        dimVec inDims = {10, 10, 64};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_6_output.bin"});
        img.loadData();

        memcpy_dma(MLP_INPUTS, img.raw(), img.getParams().byte_size());
        
        //memcheck(MLP_INPUTS, img.raw(), img.getParams().byte_size());

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        const LayerData& outputFlat = model.inferenceLayer(output, layerNum+1, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();
        memcpy_dma((int8_t*)outputFlat.raw(), MLP_OUTPUTS, outputFlat.getParams().byte_size());

        LayerData expected(outputFlat.getParams(), basePath / "image_0_data" / "layer_9_output.bin");
        expected.loadData();
        outputFlat.compareWithinPrint<int8_t>(expected);
    } 
    // else if(layerNum == 9)
    // {
    //     dimVec inDims = {4, 4, 128};
    //     LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_8_output.bin"});
    //     img.loadData();

    //     Timer timer("Layer Inference");

    //     timer.start();
    //     const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
    //     timer.stop();

    //     LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_9_output.bin");
    //     expected.loadData();
    //     output.compareWithinPrint<int8_t>(expected);
    // }     
    else if(layerNum == 7)
    {
        //uint32_t ctrlb_base = (MLP_CTRLB_SWAP_ACTIVATIONS);
        Xil_Out32(MLP_CTRLB, 0);
        dimVec inDims = {2048};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_9_output.bin"});
        img.loadData();
        memcpy_dma(MLP_INPUTS, img.raw(), img.getParams().byte_size());
        
        memcheck(MLP_INPUTS, img.raw(), img.getParams().byte_size());
        std::cout << "Starting inference for layer 10\n";

        Timer timer("Layer Inference");

        timer.start();
        const LayerData& output = model.inferenceLayer(img, layerNum, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        memcpy_dma((int8_t*)output.raw(), MLP_OUTPUTS, output.getParams().byte_size());

        savePackedAndUnpackedOutputs(output, "layer6_output.bin", "layer6_output_unpacked.bin");

        LayerData expected(output.getParams(), basePath / "image_0_data" / "layer_10_output.bin");
        expected.loadData();
        output.compareWithinPrint<int8_t>(expected);
    }
    else if(layerNum == 8)
    {
        dimVec inDims = {256};
        LayerData img({sizeof(int8_t), inDims, basePath / "image_0_data" / "layer_10_output.bin"});
        img.loadData();

        memcpy_dma(MLP_INPUTS, img.raw(), img.getParams().byte_size());

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
    //Load an image
    logInfo("--- Running Inference Test ---");

    // Construct a LayerData object from a LayerParams one
    LayerData img(model[0].getInputParams(), basePath / "image_0.bin");
    img.loadData();

    memcpy_dma(MLP_INPUTS, img.raw(), img.getParams().byte_size());
    
    //memcheck(MLP_INPUTS, img.raw(), img.getParams().byte_size());

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

void runRecordedInferenceTest(const Model& model, const Path& basePath) {
    // Load an image
    logInfo("--- Running Inference Test ---");
    for(int i = 0; i < 1000; i++) {
        std::string img_num = std::to_string(i);
        Xil_Out32(MLP_CTRLB, 0);

        // Construct a LayerData object from a LayerParams one
        LayerData img(model[0].getInputParams(), basePath / ("image_" + img_num + ".bin"));
        img.loadData();
        memcpy_dma(MLP_INPUTS, img.raw(), img.getParams().byte_size());

        Timer timer("Full Inference");

        // Run inference on the model
        timer.start();
        LayerData output = model.inference(img, Layer::InfType::COMPUTEACCELERATED);
        timer.stop();

        // // Manually save to binary file
        // std::string filename = basePath / "softmaxOut" / ("softmax_output_" + img_num + ".bin");
        // std::ofstream outFile(filename, std::ios::binary);
        // if (!outFile) {
        //     std::cerr << "Error opening " << filename << std::endl;
        //     continue;
        // }
        // const size_t totalBytes = output.getParams().byte_size();
        // outFile.write(static_cast<const char*>(output.raw()), totalBytes);
        // outFile.close();
        savePackedAndUnpackedOutputs(output, ("softmax_output_" + img_num + ".bin"), "packedBS.bin");
    }
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
    //runLayerTest(0, model, basePath);

    //runLayerTest(1, model, basePath);

    //Max Pooling Layer
    //runLayerTest(2, model, basePath);

    //runLayerTest(3, model, basePath);

    //runLayerTest(4, model, basePath);

    //runLayerTest(5, model, basePath);

    //runLayerTest(6, model, basePath);

    //runLayerTest(7, model, basePath);

    //runLayerTest(8, model, basePath);

    //Flattening Layer
    //runLayerTest(9, model, basePath);

    //Dense Layer (ReLU)
    //runLayerTest(7, model, basePath);

    //Dense Layer (Softmax)
    //runLayerTest(7, model, basePath);

    // Run an end-to-end inference test
    //runInferenceTest(model, basePath);

    runRecordedInferenceTest(model, basePath);

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
        Xil_DCacheDisable();
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

#else
int main() {
    std::cerr << "MLP hardware acceleration is only supported on Zedboard targets.\n";
    return 0;
}

#endif
