// NOTE: to make with quantized; run ' make build CFLAGS="-DQUANT_BITS=4" ' or some othe value (2,4,8)
// Run make clean before changing

#include "Convolutional.h"

#include <iostream>
#include <vector>
#include <fstream>   // Required for file I/O
#include <iostream>  // For std::cerr error messages
#include <algorithm> // For std::max
#include <cmath>     // For std::round
#include <cstdint>   // For int8_t, int32_t

#include "../Types.h"
#include "../Utils.h"
#include "Layer.h"

#ifdef ZEDBOARD
#include <xllfifo_hw.h>
#include <xil_io.h>
#endif


namespace ML
{
    // --- Begin Student Code ---

    // Compute the convultion for the layer data
    void ConvolutionalLayer::computeNaive(const LayerData &dataIn) const
    {
        // TODO: Your Code Here...

        const std::vector<std::size_t> weightParam = getWeightParams().dims; // Get dims of the filters
        // const std::vector<std::size_t> biasParam = getBiasParams().dims; // Get dims of the filters
        const std::vector<std::size_t> inputParam = getInputParams().dims;   // Get dims of the filters
        const std::vector<std::size_t> outputParam = getOutputParams().dims; // Get dims of the filters

        // std::cout << weightParam[0];
        // std::cout << "Hello World";

        // int batchSize = 1; //n  UNEEDED?

        int filterHeight = weightParam[1]; // r
        int filterWidth = weightParam[0];  // s
        int filterDepth = weightParam[2];  // c
        // int filterSet = weightParam[3];//m  UNEEDED?

        // int inputHeight = inputParam[1]; //h
        int inputWidth = inputParam[0]; // w
        // int inputDepth = inputParam[2]; //c UNEEDED?

        int outputHeight = outputParam[1]; // h'
        int outputWidth = outputParam[0];  // w'
        int outputDepth = outputParam[2];  // m This should be the same as weightParam[2]

        // float bias = biasParam[0];//b

        // TODO: make sure that we dont need to worry about stride (i dont think so bc like we bascially just have a stride of 1?)

        // float output[outputHeight][outputWidth][outputDepth];
        for (int m = 0; m < outputDepth; m++)
        {
            for (int output_y = 0; output_y < outputHeight; output_y++)
            {
                for (int output_x = 0; output_x < outputWidth; output_x++)
                {

                    // do filter stuff, i thought this was 4d but the 4th dim is in the output depth ig
                    float sum = 0.0;
                    for (int c = 0; c < filterDepth; c++)
                    {
                        for (int r = 0; r < filterHeight; r++)
                        {
                            for (int s = 0; s < filterWidth; s++)
                            {

                                int input_y = output_y + r;
                                int input_x = output_x + s;
                                // TODO: maybe add safety checks so we dont go out of bounds?
                                // we can get the values from the flat array by calculating the index (hopefully this is how it was formatted from tensorflow)
                                // float weight = weightData.get<fp32>( (m * (filterHeight * filterWidth * filterDepth)) + (c * (filterWidth * filterHeight)) + (r * filterWidth) +  s);
                                // float input = dataIn.get<fp32>( (c * (inputHeight * inputWidth)) + ((output_y + r) * inputWidth) + (output_x + s) );
                                float weight = weightData.get<fp32>(
                                    (r * filterWidth * filterDepth * outputDepth) +
                                    (s * filterDepth * outputDepth) +
                                    (c * outputDepth) +
                                    m);

                                float input = dataIn.get<fp32>(
                                    (input_y * inputWidth * filterDepth) +
                                    (input_x * filterDepth) +
                                    c);

                                sum += weight * input;
                            }
                        }
                    }
                    // TODO: add relu activation function here?
                    // output is assigned in a flat manner, basicaly caluclated by multiplying and adding for each dim

                    // float outputValue = sum + biasData.get<fp32>(m);

                    // float ReLUOutput = std::max(0.0f, outputValue);

                    // getOutputData().get<fp32>((m * (outputHeight * outputWidth)) + output_y * outputWidth + output_x) = ReLUOutput;

                    float output_val = sum + biasData.get<fp32>(m);
                    getOutputData().get<fp32>(
                        (output_y * outputWidth * outputDepth) + (output_x * outputDepth) + m) = std::max(0.0f, output_val);
                }
            }
        }

        // The following line is an example of copying a single 32-bit floating point integer from the input layer data to the output layer data
        // getOutputData().get<fp32>(0) = dataIn.get<fp32>(0);
    }

    // Compute the convolution using threads
    void ConvolutionalLayer::computeThreaded(const LayerData &dataIn) const
    {
        // TODO: Your Code Here...
    }

    // Compute the convolution using a tiled approach
    void ConvolutionalLayer::computeTiled(const LayerData &dataIn) const
    {
        // TODO: Your Code Here...
    }

    // Compute the convolution using SIMD
    void ConvolutionalLayer::computeSIMD(const LayerData &dataIn) const
    {
        // TODO: Your Code Here...
    }

    // Indef shit
    #ifndef QUANT_BITS
    #define QUANT_BITS 8
    #endif

    #if QUANT_BITS == 8
    #define INPUT_SCALES {227.28470265723197, 75.11558295522069, 31.140278909668137, 38.979479659636624, 34.41633348952834, 24.32199420298626, 14.240195238871564, 8.222600215277991, 127.71819591562237};
    #define WEIGHT_SCALES {419.3088582098988, 260.8992077660963, 183.42577326208328, 234.51324444962967, 236.64045885476003, 248.70011854276902, 227.76791452790815, 95.91284026290671};
    #define ZERO_POINTS {-100, -2, -1, -1, -1, -3, -1, -5, -1};

    #elif QUANT_BITS == 4
    #define INPUT_SCALES {12.527503296067906, 4.140228981783817, 1.71639332572974, 2.148475256830365, 1.8969632632023494, 1.340582357644912, 0.7848926509614248, 0.4532141850940625, 7.039585601648477};
    #define WEIGHT_SCALES {23.111511869836942, 14.380271294194285, 10.110081990823488, 12.925926859428406, 13.043174897506459, 13.707880549601441, 12.554137021223283, 5.286534502679897};
    #define ZERO_POINTS {-6, 0, 0, 0, 0, 0, 0, 0, 0};


    #elif QUANT_BITS == 2
    #define INPUT_SCALES {1.7896433280097006, 0.591461283111974, 0.24519904653282, 0.3069250366900521, 0.27099475188604993, 0.1915117653778446, 0.11212752156591782, 0.06474488358486608, 1.0056550859497824, 0.591461283111974, 0.24519904653282, 0.3069250366900521, 0.27099475188604993, 0.1915117653778446, 0.11212752156591782, 0.06474488358486608, 1.0056550859497824, 0.591461283111974, 0.24519904653282, 0.3069250366900521, 0.27099475188604993, 0.1915117653778446, 0.11212752156591782, 0.06474488358486608, 1.0056550859497824, 0.591461283111974, 0.24519904653282, 0.3069250366900521, 0.27099475188604993, 0.1915117653778446, 0.11212752156591782, 0.06474488358486608, 1.0056550859497824};
    #define WEIGHT_SCALES {3.301644552833849, 2.0543244705991834, 1.4442974272604983, 1.8465609799183438, 1.8633106996437798, 1.958268649943063, 1.7934481458890406, 0.7552192146685568};
    #define ZERO_POINTS {-2, 0, 0, 0, 0, 0, 0, 0, 0};

    #else
    #error "Unsupported QUANT_BITS (must be 2, 4, or 8)"
    #endif
void ConvolutionalLayer::computeQuantized(const LayerData &dataIn) const
    {
        // --- Quantization Parameters ---
        // These scales and zero-points are specific to each layer and would typically
        // be members of the Layer class, loaded from your Python script.
        // Using the hardcoded values from your example for now.
        // NOTE: For QUANT_BITS < 8, assume scales are adjusted accordingly for the reduced range.
        const float scales[] = INPUT_SCALES;
        const float weight_scales[] = WEIGHT_SCALES;
        const int8_t zero_points[] = ZERO_POINTS;
        const int layerNumber = getLayerNum();
        const float scale_input = scales[layerNumber];
        const float scale_next = scales[layerNumber + 1];
        const float scale_weight = weight_scales[layerNumber];
        const int8_t zp_next = zero_points[layerNumber + 1];
        //const int8_t zp_input = zero_points[layerNumber];
        // --- Get Layer Dimensions ---
        const auto &weightDims = getWeightParams().dims;
        const auto &inputDims = getInputParams().dims;
        const auto &outputDims = getOutputParams().dims;
        const int filterHeight = weightDims[1];
        const int filterWidth = weightDims[0];
        const int filterDepth = weightDims[2];
        const int inputWidth = inputDims[0];
        const int outputHeight = outputDims[1];
        const int outputWidth = outputDims[0];
        const int outputDepth = outputDims[2];
        // int output_counter = 0;
        // int input_counter = 0;

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

        //bool first = true;

        for (int m = 0; m < outputDepth; ++m)
        {
            for (int output_y = 0; output_y < outputHeight; ++output_y)
            {
                for (int output_x = 0; output_x < outputWidth; ++output_x)
                {
                    int32_t accumulator = 0;
                    for (int c = 0; c < filterDepth; ++c)
                    {
                        for (int r = 0; r < filterHeight; ++r)
                        {
                            for (int s = 0; s < filterWidth; ++s)
                            {
                                int input_y = output_y + r;
                                int input_x = output_x + s;
                                int8_t weight = (weightData.get<int8_t>(
                                    (r * filterWidth * filterDepth * outputDepth) +
                                    (s * filterDepth * outputDepth) +
                                    (c * outputDepth) +
                                    m));
                                int8_t input = (dataIn.get<int8_t>(
                                    (input_y * inputWidth * filterDepth) +
                                    (input_x * filterDepth) +
                                    c));

                                // if(first){
                                //     std::cout << std::hex << (int) weight << "\n";
                                //     std::cout << std::hex << (int) input << "\n";
                                //     std::cout << "\n";
                                // }

                                accumulator += weight * input; // - (weight * zp_input); // - (weight * zp_input);
                                // if (layerNumber == 0 && input_counter < 10)
                                // {
                                //     std::cout << (int)input << "\n";
                                //     input_counter++;
                                // }
                            }
                        }
                    }
                    // --- Add Bias ---
                    // The bias is pre-quantized to int32 and added directly to the accumulator.
                    // It is assumed S_bias = S_input * S_weight.
                    // std::cout << (float)accumulator<< " ";

                    // if(first){
                    //     std::cout << (int) accumulator << "\n";
                    //     first = false; 
                    // }

                    accumulator += biasData.get<int32_t>(m);

                    // debug
                    // int32_t bias = biasData.get<int32_t>(m);

                    // if (layerNumber == 0 && output_counter < 10)
                    // {
                    //     std::cout << "accumulate: " << (float)accumulator << "\n";
                    // }

                    fp32 dequant_scale = (scale_weight * scale_input);
                    // --- Dequantization to fp32 ---
                    // Dequantize the int32 accumulator to fp32 by multiplying with the input and weight scales
                    fp32 dequant = (static_cast<fp32>(accumulator) / dequant_scale);




                    fp32 relu_output = std::max(0.0f, dequant);
                    // --- Requantization to int8 ---
                    // Requantize the fp32 value back to int8 using the next layer's scale and zero point
                    fp32 scaled = (relu_output * scale_next);
                    int8_t final_output = static_cast<int8_t>(std::round(scaled)) + static_cast<int8_t>(zp_next);

                    // Clamp to range
                    final_output = std::max(min_q, std::min(max_q, final_output));

                    
                    // --- Store Final Value ---
                    getOutputData().get<int8_t>((output_y * outputWidth * outputDepth) + (output_x * outputDepth) + m) = final_output;

                    // outFile.write(reinterpret_cast<const char *>(&final_output), sizeof(final_output));

                    // std::cout << (float)final_output<< " "; // Original line
                }
                // std::cout << "\n"; // Original line
            }
        }

        //THIS OUTPUTS TO A BINARY FILE!
            // Calculate total size
        //const size_t totalElements = outputHeight * outputWidth * outputDepth;
        //const size_t totalBytes = totalElements * sizeof(int8_t);

        // Get a pointer to the start of the data
        //const int8_t* outputBufferPtr = &getOutputData().get<int8_t>(0);

        // Open, write the whole buffer, and close
        //std::ofstream outFile("layer_output.bin", std::ios::binary);
       //if (!outFile)
        //{
            //std::cerr << "Error: Could not open layer_output.bin for writing." << std::endl;
            //return;
        //}

        //std::cout << "Writing " << totalBytes << " bytes to layer_output.bin" << std::endl;
        //outFile.write(reinterpret_cast<const char *>(outputBufferPtr), totalBytes);
        //outFile.close();

    }

    void ConvolutionalLayer::computeAccelerated(const LayerData &dataIn) const
    {
        #ifdef ZEDBOARD

        #include <xllfifo_hw.h>
        #include <xil_io.h>
        // --- Quantization Parameters ---
        // These scales and zero-points are specific to each layer and would typically
        // be members of the Layer class, loaded from your Python script.
        // Using the hardcoded values from your example for now.
        // NOTE: For QUANT_BITS < 8, assume scales are adjusted accordingly for the reduced range.
        const float scales[] = INPUT_SCALES;
        const float weight_scales[] = WEIGHT_SCALES;
        const int8_t zero_points[] = ZERO_POINTS;
        const int layerNumber = getLayerNum();
        const float scale_input = scales[layerNumber];
        const float scale_next = scales[layerNumber + 1];
        const float scale_weight = weight_scales[layerNumber];
        const int8_t zp_next = zero_points[layerNumber + 1];
        //const int8_t zp_input = zero_points[layerNumber];
        // --- Get Layer Dimensions ---
        const auto &weightDims = getWeightParams().dims;
        const auto &inputDims = getInputParams().dims;
        const auto &outputDims = getOutputParams().dims;
        const int filterHeight = weightDims[1];
        const int filterWidth = weightDims[0];
        const int filterDepth = weightDims[2];
        const int inputWidth = inputDims[0];
        const int outputHeight = outputDims[1];
        const int outputWidth = outputDims[0];
        const int outputDepth = outputDims[2];
        // int output_counter = 0;
        // int input_counter = 0;

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

        bool first = true;

        for (int m = 0; m < outputDepth; ++m)
        {
            for (int output_y = 0; output_y < outputHeight; ++output_y)
            {
                for (int output_x = 0; output_x < outputWidth; ++output_x)
                {
                    for (int c = 0; c < filterDepth; ++c)
                    {
                        for (int r = 0; r < filterHeight; ++r)
                        {
                            for (int s = 0; s < filterWidth; ++s)
                            {
                                int input_y = output_y + r;
                                int input_x = output_x + s;
                                int8_t weight = (weightData.get<int8_t>(
                                    (r * filterWidth * filterDepth * outputDepth) +
                                    (s * filterDepth * outputDepth) +
                                    (c * outputDepth) +
                                    m));
                                int8_t input = (dataIn.get<int8_t>(
                                    (input_y * inputWidth * filterDepth) +
                                    (input_x * filterDepth) +
                                    c));

                                if(shift == 8)
                                {
                                    input = input & 0x000000FF;
                                } 
                                else if(shift == 4)
                                {
                                    input = input & 0x0000000F;
                                } 
                                else 
                                {
                                    input = input & 0x00000003;
                                }   

                                // if(first){
                                //     std::cout << std::hex << (int) weight << "\n";
                                //     std::cout << std::hex << (int) input << "\n";
                                // }
                                
                                u32 packed_value = (static_cast<uint32_t>(static_cast<uint8_t>(weight)) << shift | static_cast<uint8_t>(input));

                                // if(first){
                                //     std::cout << std::hex << (int) packed_value << "\n";
                                //     std::cout << "\n";
                                // }


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

                                // if(first){
                                //     std::cout << std::hex << (int) packed_value << "\n";
                                //     std::cout << (int) shift << "\n";
                                //     std::cout << "\n";
                                // }

                            }
                        }
                    }

                    int numPackets = filterDepth * filterHeight * filterWidth;

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

                    // --- Add Bias ---
                    // The bias is pre-quantized to int32 and added directly to the accumulator.
                    // It is assumed S_bias = S_input * S_weight.
                    // std::cout << (float)accumulator<< " ";
                    int32_t accumulator = in_data;

                    // if(first){
                    //     std::cout << (int) accumulator << "\n";
                    //     std::cout << "\n";
                    //     first = false;
                    // }

                    accumulator += biasData.get<int32_t>(m);
                    // debug
                    // int32_t bias = biasData.get<int32_t>(m);

                    // if (layerNumber == 0 && output_counter < 10)
                    // {
                    //     std::cout << "accumulate: " << (float)accumulator << "\n";
                    // }

                    fp32 dequant_scale = (scale_weight * scale_input);
                    // --- Dequantization to fp32 ---
                    // Dequantize the int32 accumulator to fp32 by multiplying with the input and weight scales
                    fp32 dequant = (static_cast<fp32>(accumulator) / dequant_scale);




                    fp32 relu_output = std::max(0.0f, dequant);
                    // --- Requantization to int8 ---
                    // Requantize the fp32 value back to int8 using the next layer's scale and zero point
                    fp32 scaled = (relu_output * scale_next);
                    int8_t final_output = static_cast<int8_t>(std::round(scaled)) + static_cast<int8_t>(zp_next);

                    // Clamp to range
                    final_output = std::max(min_q, std::min(max_q, final_output));

                    
                    // --- Store Final Value ---
                    getOutputData().get<int8_t>((output_y * outputWidth * outputDepth) + (output_x * outputDepth) + m) = final_output;

                    // outFile.write(reinterpret_cast<const char *>(&final_output), sizeof(final_output));

                    // std::cout << (float)final_output<< " "; // Original line

                }
                // std::cout << "\n"; // Original line
            }
        }



        #else
            computeQuantized(dataIn);
        #endif
        

    }

} // namespace ML
