#include "MaxPooling.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"


#include <fstream>   // Required for file I/O
#include <iostream>  // For std::cerr error messages
#include <algorithm> // For std::max
#include <cmath>     // For std::round
#include <cstdint>   // For int8_t, int32_t

#include <limits>
#if defined(__SSE__)
#include <immintrin.h>
#endif


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
void MaxPoolingLayer::computeSIMD(const LayerData& in) const {
#if !defined(__SSE__)
    computeNaive(in);
#else
    const auto& dimsIn = getInputParams().dims;
    const auto& dimsOut = getOutputParams().dims;
    const int W = static_cast<int>(dimsIn[0]);
    const int C = static_cast<int>(dimsIn[2]);
    const int outputHeight = static_cast<int>(dimsOut[1]);
    const int outputWidth = static_cast<int>(dimsOut[0]);
    const int outputDepth = static_cast<int>(dimsOut[2]);
    const int pool = getPoolSize(), stride = getStride();

    const fp32* src = reinterpret_cast<const fp32*>(in.raw());
    fp32* dst = reinterpret_cast<fp32*>(getOutputData().raw());

    const int inRowStride = W * C;
    const int outRowStride = outputWidth * outputDepth;

    constexpr int V = 4;
    const __m128 negInf = _mm_set1_ps(-std::numeric_limits<float>::infinity());
    // __m128 - 128 bit SIMD register for SSE instructions, holds 4 single precision floats
    //4 float ops in 1 instruction

    for (int oy = 0; oy < outputHeight; ++oy) {
        for (int ox = 0; ox < outputWidth; ++ox) {
            const fp32* block = src + (oy * stride) * inRowStride + (ox * stride) * C;
            fp32* out = dst + oy * outRowStride + ox * outputDepth;

            int c = 0;
            for (; c + (V - 1) < C; c += V) {
                __m128 maxVec = negInf;
                for (int ky = 0; ky < pool; ++ky) {
                    const fp32* row = block + ky * inRowStride + c;
                    for (int kx = 0; kx < pool; ++kx) {
                        const __m128 v = _mm_loadu_ps(row + kx * C);
                        maxVec = _mm_max_ps(maxVec, v);
                    }
                }
                _mm_storeu_ps(out + c, maxVec);
            }

            for (; c < C; ++c) {
                float m = -std::numeric_limits<float>::infinity();
                for (int ky = 0; ky < pool; ++ky)
                    for (int kx = 0; kx < pool; ++kx)
                        m = std::max(m, block[ky * inRowStride + kx * C + c]);
                out[c] = m;
            }
        }
    }
#endif
}


void MaxPoolingLayer::computeQuantized(const LayerData& dataIn) const {
    // ----Updates----
    int stride = getStride();
    int poolSize = getPoolSize();

    const std::vector<std::size_t> inputParam = getInputParams().dims;
    const std::vector<std::size_t> outputParam = getOutputParams().dims;

    int inputHeight = static_cast<int>(inputParam[1]); //h
    int inputWidth = static_cast<int>(inputParam[0]); //w
    int inputDepth = static_cast<int>(inputParam[2]); //c

    int outputHeight = static_cast<int>(outputParam[1]); //h'
    int outputWidth = static_cast<int>(outputParam[0]); //w'
    int outputDepth = static_cast<int>(outputParam[2]);//m 

    //for each output location and channel, compute the max over its receptive field
    //matches conv - multiply acc
    for (int m = 0; m < outputDepth; m++){
        for (int output_y = 0; output_y < outputHeight; output_y++){
            for (int output_x = 0; output_x < outputWidth; output_x++){

                //start from min int8 and track whether anu in-bounds value was seen 
                //makes kernel correct even without ReLU (negative vals)
                bool hasValue = false;
                i8 max_val = std::numeric_limits<i8>::min();

                for (int fy = 0; fy < poolSize; fy++){
                    for (int fx = 0; fx < poolSize; fx++){

                        int in_y = output_y * stride + fy;
                        int in_x = output_x * stride + fx;
                        
                        //same NHWC indexing inbytes
                        //final write uses 0 if no in-bounds vals
                        if (in_y < inputHeight && in_x < inputWidth){
                            i8 val = dataIn.get<i8>( (in_y * (inputWidth * inputDepth)) + (in_x * inputDepth) + m);
                            if (!hasValue || val > max_val){
                                max_val = val;
                                hasValue = true;
                            }
                        }
                    } //int 8 path stays in int space through pooling w/ zero overhead
                    //accuracy preserving and fast
                }

                getOutputData().get<i8>( (output_y * (outputWidth * outputDepth)) + (output_x * outputDepth) + m) = hasValue ? max_val : 0;
            }
        }
    }
}

void MaxPoolingLayer::computeAccelerated(const LayerData& dataIn) const {
    computeQuantized(dataIn);
}

}
