#include "Flatten.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"


#include <iostream>
#include <vector>

namespace ML {

void FlattenLayer::computeNaive(const LayerData& dataIn) const {

    const std::vector<std::size_t> outputParam = getOutputParams().dims;

    int outputSize = outputParam[0];

    // flatten (literally copy the data over to make the model.cpp compare happy)
    for (int i = 0; i < outputSize; i++){
        getOutputData().get<fp32>(i) = dataIn.get<fp32>(i);
    }
    
}

// Compute the convolution using threads
void FlattenLayer::computeThreaded(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using a tiled approach
void FlattenLayer::computeTiled(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

// Compute the convolution using SIMD
void FlattenLayer::computeSIMD(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

void FlattenLayer::computeQuantized(const LayerData& dataIn) const {
    // ----Updates----
    const std::vector<std::size_t> outputParam = getOutputParams().dims;
    int outputSize = outputParam[0];

    for (int i = 0; i < outputSize; i++){
        getOutputData().get<i8>(i) = dataIn.get<i8>(i);
    }
    
}

void FlattenLayer::computeAccelerated(const LayerData& dataIn) const {
    computeQuantized(dataIn);
}

}