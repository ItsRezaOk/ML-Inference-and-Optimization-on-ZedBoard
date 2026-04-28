#include "MaxPooling.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"


#include <iostream>
#include <vector>

namespace ML {

void MaxPoolingLayer::computeNaive(const LayerData& dataIn) const {

    int stride = getStride();
    int poolSize = getPoolSize();

    const std::vector<std::size_t> inputParam = getInputParams().dims;
    const std::vector<std::size_t> outputParam = getOutputParams().dims;

    int inputHeight = inputParam[1]; //h
    int inputWidth = inputParam[0]; //w
    int inputDepth = inputParam[2]; //c

    int outputHeight = outputParam[1]; //h'
    int outputWidth = outputParam[0]; //w'
    int outputDepth = outputParam[2];//m 

    for (int m = 0; m < outputDepth; m++){
        for (int output_y = 0; output_y < outputHeight; output_y++){
            for (int output_x = 0; output_x < outputWidth; output_x++){

                float max_val = 0.0; // because we are using a relu activation function, all values should be >= 0 TODO: confirm this is true (may need to implement in the conv function)

                // look at the poolsize x poolsize area (2x2) to find max
                for (int fy = 0; fy < poolSize; fy++){
                    for (int fx = 0; fx < poolSize; fx++){

                        int in_y = output_y * stride + fy;
                        int in_x = output_x * stride + fx;
                        
                        // check inside bounds (we should never leave bounds tho based on sizes, maybe remove redundant check for performance?)
                        if (in_y < inputHeight && in_x < inputWidth){
                            float val = dataIn.get<fp32>( (in_y * (inputWidth * inputDepth)) + (in_x * inputDepth) + m);
                            if (val > max_val){
                                max_val = val;
                            }
                        }
                    }
                }

                // Set the max value in the output
                getOutputData().get<fp32>( (output_y * (outputWidth * outputDepth)) + (output_x * outputDepth) + m) = max_val;
            }
        }
    }
}

// Compute the convolution using threads
void MaxPoolingLayer::computeThreaded(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using a tiled approach
void MaxPoolingLayer::computeTiled(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using SIMD
void MaxPoolingLayer::computeSIMD(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using SIMD
void MaxPoolingLayer::computeHardware(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

}