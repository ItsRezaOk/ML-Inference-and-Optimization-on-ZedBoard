#include "Dense.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"


#include <iostream>
#include <vector>
#include <algorithm>
#if defined(__SSE__)
#include <immintrin.h>
#endif

namespace ML {

void DenseLayer::computeNaive(const LayerData& dataIn) const {


    const std::vector<std::size_t> weightParam = getWeightParams().dims; // Get dims of the filters
    //const std::vector<std::size_t> biasParam = getBiasParams().dims; // Get dims of the filters
    const std::vector<std::size_t> inputParam = getInputParams().dims;
    const std::vector<std::size_t> outputParam = getOutputParams().dims;

    int inputSize = inputParam[0]; 
    int outputSize = outputParam[0]; 
    //int weightInputSize = weightParam[0];
    //int biasSize = biasParam[0];

    bool ReLUBoolean = getReLUBoolean();
    

    // now, its densing time (also known as a fully connected layering time)
    // this is basically the same as the conv layer but 1D and much easier and we should've started with this layer
    for(int j = 0; j < outputSize; j++){ 
        float sum = 0.0;
        for(int i = 0; i < inputSize; i++){ 
            //float weight = weightData.get<fp32>( j * weightInputSize + i);
            float weight = weightData.get<fp32>(i * outputSize + j);
            float input = dataIn.get<fp32>(i); 
            sum += weight * input;
        }
        sum += biasData.get<fp32>(j); // add bias
        // relu
        if ((sum < 0) && (ReLUBoolean)){
            sum = 0;
        }
        getOutputData().get<fp32>(j) = sum;
    }

    
} 

// Compute the convolution using threads
void DenseLayer::computeThreaded(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using a tiled approach
void DenseLayer::computeTiled(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using SIMD
void DenseLayer::computeSIMD(const LayerData& dataIn) const {
#if !defined(__SSE__)
    computeNaive(dataIn);
#else
    const int inputSize = static_cast<int>(getInputParams().dims[0]);
    const int outputSize = static_cast<int>(getOutputParams().dims[0]);
    const bool applyReLU = getReLUBoolean();

    // Only handle fp32 tensors; fall back otherwise.
    if (getWeightParams().elementSize != sizeof(fp32) ||
        getBiasParams().elementSize != sizeof(fp32) ||
        dataIn.getParams().elementSize != sizeof(fp32) ||
        getOutputParams().elementSize != sizeof(fp32))
    {
        computeNaive(dataIn);
        return;
    }

    const fp32* inputPtr = reinterpret_cast<const fp32*>(dataIn.raw());
    const fp32* weightPtr = reinterpret_cast<const fp32*>(getWeightData().raw());
    const fp32* biasPtr = reinterpret_cast<const fp32*>(getBiasData().raw());
    fp32* outputPtr = reinterpret_cast<fp32*>(getOutputData().raw());

    constexpr int VECTOR_WIDTH = 4;
    const __m128 zeroVec = _mm_setzero_ps();

    int outIdx = 0;
    for (; outIdx + (VECTOR_WIDTH - 1) < outputSize; outIdx += VECTOR_WIDTH)
    {
        __m128 sumVec = _mm_loadu_ps(biasPtr + outIdx);

        for (int inIdx = 0; inIdx < inputSize; ++inIdx)
        {
            const __m128 weightVec = _mm_loadu_ps(weightPtr + inIdx * outputSize + outIdx);
            const __m128 inputVec = _mm_set1_ps(inputPtr[inIdx]);
            sumVec = _mm_add_ps(sumVec, _mm_mul_ps(weightVec, inputVec));
        }

        if (applyReLU)
        {
            sumVec = _mm_max_ps(sumVec, zeroVec);
        }

        _mm_storeu_ps(outputPtr + outIdx, sumVec);
    }

    for (; outIdx < outputSize; ++outIdx)
    {
        fp32 sum = biasPtr[outIdx];
        for (int inIdx = 0; inIdx < inputSize; ++inIdx)
        {
            sum += weightPtr[inIdx * outputSize + outIdx] * inputPtr[inIdx];
        }

        if (applyReLU && sum < 0.0f)
        {
            sum = 0.0f;
        }

        outputPtr[outIdx] = sum;
    }
#endif
}

void DenseLayer::computeQuantized(const LayerData& dataIn) const {
    //Picks different {S_in, Z_in, S_out, Z_out} depending on whether this is the final dense layer (dense_1) or not

    const bool isFinalDense = !getReLUBoolean();
    const float inputScale = isFinalDense ? 8.222600215277991 : 14.240195238871564;
    int32_t inputZeroPoint = isFinalDense ? -5 : -1 ;
    const float outputScale = isFinalDense ? 127.71819591562237 : 8.222600215277991;
    const int32_t outputZeroPoint = isFinalDense ? -1 : -5 ;
    const float weightScale = isFinalDense ? 95.91284026290671 : 227.76791452790815;
    const bool applyReLU = !isFinalDense;

    const int inputSize = static_cast<int>(getInputParams().dims[0]);
    const int outputSize = static_cast<int>(getOutputParams().dims[0]);

    const LayerData& weights = getWeightData();
    const LayerData& biases = getBiasData();
    LayerData& output = getOutputData();


    for (int outIdx = 0; outIdx < outputSize; ++outIdx) {//loop over outIdx
        int32_t accumulator = 0; //int32 avoid overflow
        for (int inIdx = 0; inIdx < inputSize; ++inIdx) { 
            const int8_t inputVal = dataIn.get<int8_t>(inIdx);
            const int8_t weightVal = weights.get<int8_t>(inIdx * outputSize + outIdx);
            accumulator += inputVal * weightVal - (weightVal * inputZeroPoint);
        }

        int8_t final_output8;

        if (applyReLU) 
        {
            accumulator += biases.get<int32_t>(outIdx);
            // 1. Calculate the final requantization scaling factor
            const float requant_scale = (inputScale * weightScale);
            fp32 scaled_acc = static_cast<fp32>((accumulator) / requant_scale);
            //apply relu
            fp32 shifted_acc_int = static_cast<fp32>(std::max(0.0f, scaled_acc));
            // apply scale and zero point
            shifted_acc_int = shifted_acc_int * outputScale + outputZeroPoint;
            final_output8 = static_cast<int8_t>(std::round(shifted_acc_int));
            output.get<int8_t>(outIdx) = final_output8;
            //std::cout << (int)final_output8;

        } 
        else 
        {
            accumulator += biases.get<int32_t>(outIdx);
            // 1. Calculate the final requantization scaling factor
            const float dequant_scale = (weightScale * inputScale);
            fp32 scaled_acc = ((float)(accumulator) / dequant_scale );
            output.get<fp32>(outIdx) = (scaled_acc);
        }
    }
}

void DenseLayer::computeAccelerated(const LayerData& dataIn) const {
    // TODO: Your Code Here...
    // Basically do normal quantized but the MACs are done in hardware accelerator using helper functions
}

}
