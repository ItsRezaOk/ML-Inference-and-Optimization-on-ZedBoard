#include "Dense.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"
#include "../MLP.h"

#include <iostream>
#include <vector>

#ifdef ZEDBOARD
#include <xil_io.h>

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
    // TODO: Your Code Here...
}

// Indef shit
#ifndef QUANT_BITS
#define QUANT_BITS 8
#endif

#if QUANT_BITS == 8
#define INPUT_SCALES_ONE 14.240195238871564
#define INPUT_SCALES_TWO 8.222600215277991 
#define WEIGHT_SCALE_ONE 227.76791452790815
#define WEIGHT_SCALE_TWO 95.91284026290671
#define ZERO_POINT_ONE -5
#define ZERO_POINT_TWO 0

#elif QUANT_BITS == 4
#define INPUT_SCALES_ONE 0.7848926509614248
#define INPUT_SCALES_TWO 0.4532141850940625 
#define WEIGHT_SCALE_ONE 12.554137021223283
#define WEIGHT_SCALE_TWO 5.286534502679897
#define ZERO_POINT_ONE 0
#define ZERO_POINT_TWO 0


#elif QUANT_BITS == 2
#define INPUT_SCALES_ONE 0.11212752156591782
#define INPUT_SCALES_TWO 0.06474488358486608 
#define WEIGHT_SCALE_ONE 1.7934481458890406
#define WEIGHT_SCALE_TWO 0.7552192146685568
#define ZERO_POINT_ONE 0
#define ZERO_POINT_TWO 0

#else
#error "Unsupported QUANT_BITS (must be 2, 4, or 8)"
#endif

void DenseLayer::computeQuantized(const LayerData& dataIn) const {
    //Picks different {S_in, Z_in, S_out, Z_out} depending on whether this is the final dense layer (dense_1) or not

#if QUANT_BITS == 8
    const int8_t min_q = -128;
    const int8_t max_q = 127;
#elif QUANT_BITS == 4
    const int8_t min_q = -8;
    const int8_t max_q = 7;
#elif QUANT_BITS == 2
    const int8_t min_q = -2;
    const int8_t max_q = 1;
#endif

    const bool isFinalDense = !getReLUBoolean();
    const float inputScale = isFinalDense ? INPUT_SCALES_TWO : INPUT_SCALES_ONE;
    //int32_t inputZeroPoint = isFinalDense ? -5 : -1 ;
    const float outputScale = isFinalDense ? 1.0 : INPUT_SCALES_TWO;
    const int32_t outputZeroPoint = isFinalDense ? ZERO_POINT_TWO : ZERO_POINT_ONE;
    const float weightScale = isFinalDense ? WEIGHT_SCALE_TWO : WEIGHT_SCALE_ONE;
    const bool applyReLU = !isFinalDense;

    const int inputSize = static_cast<int>(getInputParams().dims[0]);
    const int outputSize = static_cast<int>(getOutputParams().dims[0]);

    const LayerData& weights = getWeightData();
    const LayerData& biases = getBiasData();
    LayerData& output = getOutputData();

    //std::cout << "Input Scale: " << inputScale << ", Weight Scale: " << weightScale << ", Output Scale: " << outputScale << std::endl;


    for (int outIdx = 0; outIdx < outputSize; ++outIdx) {//loop over outIdx
        int32_t accumulator = 0; //int32 avoid overflow
        for (int inIdx = 0; inIdx < inputSize; ++inIdx) { 
            const int8_t inputVal = dataIn.get<int8_t>(inIdx);
            const int8_t weightVal = weights.get<int8_t>(inIdx * outputSize + outIdx);
            accumulator += inputVal * weightVal; // - (weightVal * inputZeroPoint);
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
            final_output8 = std::max(min_q, std::min(max_q, final_output8)); // Clamp
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
        //     //THIS OUTPUTS TO A BINARY FILE!
        //     // Calculate total size
        // const size_t totalElements = outputSize;
        // const size_t totalBytes = totalElements * sizeof(float);

        // // Get a pointer to the start of the data
        // const float* outputBufferPtr = &getOutputData().get<float>(0);

        // // Open, write the whole buffer, and close
        // std::ofstream outFile("layer_output.bin", std::ios::binary);
        // if (!outFile)
        // {
        //     std::cerr << "Error: Could not open layer_output.bin for writing." << std::endl;
        //     return;
        // }

        // std::cout << "Writing " << totalBytes << " bytes to layer_output.bin" << std::endl;
        // outFile.write(reinterpret_cast<const char *>(outputBufferPtr), totalBytes);
        // outFile.close();
}

void DenseLayer::computeAccelerated(const LayerData& dataIn) const {
     //Picks different {S_in, Z_in, S_out, Z_out} depending on whether this is the final dense layer (dense_1) or not
    #ifdef ZEDBOARD


    #if QUANT_BITS == 8
        //const int8_t min_q = -128;
        //const int8_t max_q = 127;
        //const int shift = 8;
    #elif QUANT_BITS == 4
        const int8_t min_q = -8;
        const int8_t max_q = 7;
        const int shift = 4;
    #elif QUANT_BITS == 2
        const int8_t min_q = -2;
        const int8_t max_q = 1;
        const int shift = 2;
    #endif
    //std::cout << "Starting setting constants for dense " << (getReLUBoolean() ? "1" : "2") << "\n";

    const bool isFinalDense = !getReLUBoolean();
    const float inputScale = isFinalDense ? INPUT_SCALES_TWO : INPUT_SCALES_ONE;
    //int32_t inputZeroPoint = isFinalDense ? -5 : -1 ;
    const float outputScale = isFinalDense ? 1.0 : INPUT_SCALES_TWO;
    const int32_t outputZeroPoint = isFinalDense ? ZERO_POINT_TWO : ZERO_POINT_ONE;
    const float weightScale = isFinalDense ? WEIGHT_SCALE_TWO : WEIGHT_SCALE_ONE;
    //const bool applyReLU = !isFinalDense;

    const int inputSize = static_cast<int>(getInputParams().dims[0]);
    const int outputSize = static_cast<int>(getOutputParams().dims[0]);

    //const LayerData& weights = getWeightData();
    //const LayerData& biases = getBiasData();
    //LayerData& output = getOutputData();

    //std::cout << "Input Scale: " << inputScale << ", Weight Scale: " << weightScale << ", Output Scale: " << outputScale << std::endl;
    int input_end_diff_fw = 0; // DONT FUCKING GAF!!!
    int input_end_diff_fh = 0; //dont care
    int input_end_diff_fc = 0; // donct care
    int input_end_diff_ow = 0; // dont care
    int filterSize = inputSize; // 1D filter

    // const int conv_out_height = inputHeight - filterHeight + 1;
    // const int conv_out_width = inputWidth - filterWidth + 1;

    // Compute fixed-point q_scale (uniform for layer, outside loop)
    long double mult = isFinalDense ? 1.0 / (static_cast<long double>(weightScale) * static_cast<long double>(inputScale)) : static_cast<long double>(outputScale) /
                        (static_cast<long double>(weightScale) * static_cast<long double>(inputScale));

    //std::cout << "mult: " << mult << "\n";

    int32_t fixed_mult = static_cast<int32_t>(std::round(mult * (1 << 16)));
    //std::cout << "fixed_mult: " << (int32_t) fixed_mult << "\n";

    // Set fixed layer configurations (outside loop)
    Xil_Out32(MLP_FILTER_W, filterSize);
    Xil_Out32(MLP_FILTER_H, 1);
    Xil_Out32(MLP_FILTER_C, 1);
    Xil_Out32(MLP_OUTPUT_W, 1);  // Pre-pool for index_gen loops
    Xil_Out32(MLP_OUTPUT_H, 1); // Pre-pool

    Xil_Out32(MLP_INPUT_END_DIFF_FW, input_end_diff_fw);
    Xil_Out32(MLP_INPUT_END_DIFF_FH, input_end_diff_fh);
    Xil_Out32(MLP_INPUT_END_DIFF_FC, input_end_diff_fc);
    Xil_Out32(MLP_INPUT_END_DIFF_OW, input_end_diff_ow);

    // Set output elements per channel (post-pool if applicable)
    size_t elements_per_channel = 1;
    Xil_Out32(MLP_OUTPUT_ELEMENTS_PER_CHANNEL, static_cast<uint32_t>(elements_per_channel));

    // Set output initial offset
    int initial_offset = 0;
    const int num_output_elements_times_4 = elements_per_channel * 4;
    Xil_Out32(MLP_OUTPUT_INITIAL_OFFSET, initial_offset);

    // Set q_scale and q_zero
    Xil_Out32(MLP_Q_SCALE, fixed_mult);
    Xil_Out32(MLP_Q_ZERO, static_cast<int32_t>(outputZeroPoint));

    // Base control bits (RELU always on, max pooling if enabled)
    uint32_t ctrlb_base = (getReLUBoolean() ? MLP_CTRLB_RELU : 0) | (getReLUBoolean() ? 0 : MLP_CTRLB_SWAP_ACTIVATIONS);

    // Initialize swap state
    bool swap = false;
    Xil_Out32(MLP_CTRLB, ctrlb_base | (swap ? MLP_CTRLB_SWAP_FILTERS : 0));
    swap = !swap;

    // Number of groups
    const int num_groups = outputSize / 4;

    //std::cout << "Finished setting constants for dense " << (getReLUBoolean() ? "1" : "2") << "\n";

    Xil_Out32(MLP_MAC0_BIAS, biasData.get<int32_t>(0));
    Xil_Out32(MLP_MAC1_BIAS, biasData.get<int32_t>(1));
    Xil_Out32(MLP_MAC2_BIAS, biasData.get<int32_t>(2));
    Xil_Out32(MLP_MAC3_BIAS, biasData.get<int32_t>(3));

    int8_t *currentFilterPointer = (int8_t*) getWeightData().raw();

    //std::cout << "first weight value: " << (int)(*currentFilterPointer) << "\n";
    // Load 4 filter pointers
    // btw filter_banks is just an array with the address constants... Might pull out of filter banks for performace
    memcpy_dma(MLP_FILTER0, currentFilterPointer, filterSize);
    currentFilterPointer += filterSize;
    memcpy_dma(MLP_FILTER1, currentFilterPointer, filterSize);
    currentFilterPointer += filterSize;
    memcpy_dma(MLP_FILTER2, currentFilterPointer, filterSize);
    currentFilterPointer += filterSize;
    memcpy_dma(MLP_FILTER3, currentFilterPointer, filterSize);
    currentFilterPointer += filterSize;

    // // Trigger computation with current swap
    Xil_Out32(MLP_CTRLB, ctrlb_base | (swap ? MLP_CTRLB_SWAP_FILTERS : 0));

    // main loop
    int m = 0;
    // Loop over groups
    for (int group = 1; group < num_groups; ++group)
    {
        m = group * 4;
        Xil_Out32(MLP_CTRLA, ~MLP_CTRLA_CONV_IDLE ); // idle low (do computation)
        //std::cout << "started computation for group " << group - 1 << "\n";

        //std::cout << "Processing filter group " << group << " (filters " << m << " to " << (m + 3) << ")\n";
        // Load 4 filter pointers
        // btw filter_banks is just an array with the address constants... Might pull out of filter banks for performace
        memcpy_dma(MLP_FILTER0, currentFilterPointer, filterSize);
        currentFilterPointer += filterSize;
        memcpy_dma(MLP_FILTER1, currentFilterPointer, filterSize);
        currentFilterPointer += filterSize;
        memcpy_dma(MLP_FILTER2, currentFilterPointer, filterSize);
        currentFilterPointer += filterSize;
        memcpy_dma(MLP_FILTER3, currentFilterPointer, filterSize);
        currentFilterPointer += filterSize;

        // Set idle lo
        

        // // If not the last group, load next group while current computes
        //bool is_last_group = (group == num_groups - 1);
        //std::cout << "Waiting for computation to finish for group " << group - 1 << "\n";
        while (!(Xil_In32(MLP_CTRLA) & MLP_CTRLA_CONV_IDLE))
            ;
        swap = !swap;
        // Load Bias
        Xil_Out32(MLP_MAC0_BIAS, biasData.get<int32_t>(m + 0));
        Xil_Out32(MLP_MAC1_BIAS, biasData.get<int32_t>(m + 1));
        Xil_Out32(MLP_MAC2_BIAS, biasData.get<int32_t>(m + 2));
        Xil_Out32(MLP_MAC3_BIAS, biasData.get<int32_t>(m + 3));

        initial_offset = group * num_output_elements_times_4;
        Xil_Out32(MLP_OUTPUT_INITIAL_OFFSET, initial_offset);

        // Trigger computation with current swap
        Xil_Out32(MLP_CTRLB, ctrlb_base | (swap ? MLP_CTRLB_SWAP_FILTERS : 0));
        // Set idle low
        //Xil_Out32(MLP_CTRLA, ~MLP_CTRLA_CONV_IDLE );
        }
    
    // trigger last group
    Xil_Out32(MLP_CTRLA, ~MLP_CTRLA_CONV_IDLE );
    // wait for last group
    while (!(Xil_In32(MLP_CTRLA) & MLP_CTRLA_CONV_IDLE));
    // Copy output from BRAM to output data

    //memcpy_dma(getOutputData().raw(), MLP_OUTPUTS, getOutputData().getParams().byte_size());


    #else
    std::cout << "ZEDBOARD not defined, running computeQuantized instead.\n";
        computeQuantized(dataIn);
    #endif
//computeQuantized(dataIn);
}

}
