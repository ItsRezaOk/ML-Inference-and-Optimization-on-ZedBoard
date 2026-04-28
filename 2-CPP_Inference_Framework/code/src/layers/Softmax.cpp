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

// Compute the convolution using SIMD
void SoftmaxLayer::computeHardware(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

}