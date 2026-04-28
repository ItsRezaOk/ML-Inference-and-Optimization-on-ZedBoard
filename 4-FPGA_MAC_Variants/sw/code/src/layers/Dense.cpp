#include "Dense.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"


#include <iostream>
#include <vector>

#ifdef ZEDBOARD

#include <xllfifo_hw.h>
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
#define ZERO_POINT_TWO -1

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

    #include <xllfifo_hw.h>
    #include <xil_io.h>

#if QUANT_BITS == 8
    const int8_t min_q = -128;
    const int8_t max_q = 127;
    const int shift = 8;
#elif QUANT_BITS == 4
    const int8_t min_q = -8;
    const int8_t max_q = 7;
    const int shift = 4;
#elif QUANT_BITS == 2
    const int8_t min_q = -2;
    const int8_t max_q = 1;
    const int shift = 2;
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
            u32 packed_value = (static_cast<uint32_t>(static_cast<uint8_t>(weightVal)) << shift | static_cast<uint8_t>(inputVal));
            
            packed_value = packed_value & 0x0000FFFF;

            if(shift == 4)
            {
                packed_value = packed_value | 0x20000;
            } 
            else if(shift == 2)
            {
                packed_value = packed_value | 0x10000;
            }   
            
            Xil_Out32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_TDFD_OFFSET, packed_value);

            //accumulator += inputVal * weightVal; // - (weightVal * inputZeroPoint);
        }

        int8_t final_output8;

        int numPackets = inputSize;

        Xil_Out32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_TLF_OFFSET, numPackets * 4);

        while (Xil_In32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_RDFO_OFFSET) == 0);

        int32_t in_data; 

        while (true) {
            // Then read how many words are available to us right now.
            // Bit 31 = 1 when this is all the words in the current packet
            // Bit 31 = 0 when this is how many words are available,
            // but no TLAST has been sent to us yet
            uint32_t read_len = Xil_In32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_RLF_OFFSET);



            // Read out every word we have access to right now
            for (int i = 0; i < (read_len & 0x7FFFFFFFUL); i+=4) {
                in_data = (int32_t)Xil_In32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_RDFD_OFFSET);
                // Process in_data here from your MAC unit
            }

            if (!(read_len & (1 << 31))) {
                break; // This is all the data in this packet, done
            }
        // There is more in this data packet, wait for more to come in
        }

        accumulator = in_data;

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


    #else
        computeQuantized(dataIn);
    #endif
}

}