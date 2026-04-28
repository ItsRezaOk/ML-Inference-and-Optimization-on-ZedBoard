#include "Softmax.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"
#include "../MLP.h"

#include <iostream>
#include <vector>

namespace ML {

void SoftmaxLayer::computeNaive(const LayerData& dataIn) const {

    const std::vector<std::size_t> outputParam = getOutputParams().dims;

    int outputSize = outputParam[0];

    float sum_exp = 0.0;

    // calc sum of exponents
    for (int i = 0; i < outputSize; i++){
        sum_exp += exp(dataIn.get<fp32>(i));
    }
    // now softmax
    for (int i = 0; i < outputSize; i++){
        getOutputData().get<fp32>(i) = exp(dataIn.get<fp32>(i)) / sum_exp;
    }
    // ----------------- PRINT TO BINARY FILE ------------    
    // output to file
    //     const size_t totalElements = outputSize;
    // const size_t totalBytes = totalElements * sizeof(fp32);

    // // Get a pointer to the start of the data
    // const fp32* outputBufferPtr = &getOutputData().get<fp32>(0);

    // // Open, write the whole buffer, and close
    // std::ofstream outFile("softmax_output.bin", std::ios::binary);
    // if (!outFile)
    // {
    //     std::cerr << "Error: Could not open softmax_output.bin for writing." << std::endl;
    //     return;
    // }

    // std::cout << "Writing " << totalBytes << " bytes to softmax_output.bin" << std::endl;
    // outFile.write(reinterpret_cast<const char *>(outputBufferPtr), totalBytes);
    // outFile.close();

}

// Compute the convolution using threads
void SoftmaxLayer::computeThreaded(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using a tiled approach
void SoftmaxLayer::computeTiled(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using SIMD
void SoftmaxLayer::computeSIMD(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

void SoftmaxLayer::computeQuantized(const LayerData& dataIn) const {
    // TODO: Your Code Here...
    computeNaive(dataIn);
}

#define INPUT_SCALES_ONE 14.240195238871564
#define INPUT_SCALES_TWO 8.222600215277991 
#define WEIGHT_SCALE_ONE 227.76791452790815
#define WEIGHT_SCALE_TWO 95.91284026290671

void SoftmaxLayer::computeAccelerated(const LayerData& dataIn) const {
    const std::vector<std::size_t> outputParam = getOutputParams().dims;
    // float input_scale = INPUT_SCALES_TWO; // last layer
    // float weight_scale = WEIGHT_SCALE_TWO; // last layer
    // float dequant_scale = input_scale * weight_scale;
    int outputSize = outputParam[0];
    float sum_exp = 0.0;


    //Xil_Out32(MLP_CTRLB, 0); // swap activation

    // int8_t* inputPtr = (int8_t*) malloc(dataIn.getParams().dims[0] * sizeof(int8_t));
    // float* outputPtr = (float*)malloc(dataIn.getParams().dims[0] * sizeof(float));
    // // read data
    // memcpy_dma(inputPtr, MLP_OUTPUTS, dataIn.getParams().dims[0] * sizeof(int8_t));
    // // dequantize
    // for (size_t i = 0; i < dataIn.getParams().dims[0]; i++){
    //     std::cout << "Softmax input[" << i << "]: " << (int)inputPtr[i] << "\n";
    //     outputPtr[i] = (float)inputPtr[i] / dequant_scale;
    // }
    // free(inputPtr);

    // for (int i = 0; i < outputSize; i++){
    //     sum_exp += exp(outputPtr[i]);
    // }
    // std::cout << "Softmax sum_exp: " << sum_exp << "\n";
    // // now softmax
    // for (int i = 0; i < outputSize; i++){
    //     getOutputData().get<fp32>(i) = exp(outputPtr[i]) / sum_exp;
    //     std::cout << "Softmax output[" << i << "]: " << getOutputData().get<fp32>(i) << "\n";
    // }
    // free(outputPtr);

    memcpy_dma((int8_t*)dataIn.raw(), MLP_OUTPUTS, dataIn.getParams().dims[0] * sizeof(int8_t));

    // calc sum of exponents
    for (int i = 0; i < outputSize; i++){
        sum_exp += exp((float)dataIn.get<int8_t>(i) / 1.0);
        //std::cout << "Softmax input[" << i << "]: " << (int)(dataIn.get<int8_t>(i)) << "\n";
    }
    //std::cout << "Softmax sum_exp: " << sum_exp << "\n";
    // now softmax
    for (int i = 0; i < outputSize; i++){
        getOutputData().get<fp32>(i) = exp((float)dataIn.get<int8_t>(i) / 1.0) / sum_exp;
    }

}

}