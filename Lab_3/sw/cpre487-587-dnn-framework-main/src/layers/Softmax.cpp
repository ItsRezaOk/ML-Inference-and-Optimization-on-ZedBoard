#include "Softmax.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"


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
    // // ----------------- PRINT TO BINARY FILE ------------    
    // // output to file
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

void SoftmaxLayer::computeAccelerated(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

}