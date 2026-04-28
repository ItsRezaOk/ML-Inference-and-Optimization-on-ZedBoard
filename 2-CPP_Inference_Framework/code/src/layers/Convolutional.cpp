#include "Convolutional.h"

#include <iostream>
#include <vector>

#include "../Types.h"
#include "../Utils.h"
#include "Layer.h"

#ifdef ZEDBOARD
#include <xllfifo_hw.h>
#include <xil_io.h>
#endif


namespace ML {
// --- Begin Student Code ---

// Compute the convultion for the layer data
void ConvolutionalLayer::computeNaive(const LayerData& dataIn) const {
    // TODO: Your Code Here...

    const std::vector<std::size_t> weightParam = getWeightParams().dims; // Get dims of the filters
    //const std::vector<std::size_t> biasParam = getBiasParams().dims; // Get dims of the filters
    const std::vector<std::size_t> inputParam = getInputParams().dims; // Get dims of the filters
    const std::vector<std::size_t> outputParam = getOutputParams().dims; // Get dims of the filters

    // std::cout << weightParam[0]; 
    // std::cout << "Hello World";

    //int batchSize = 1; //n  UNEEDED?


    int filterHeight = weightParam[1]; //r
    int filterWidth = weightParam[0]; //s
    int filterDepth = weightParam[2]; //c
    //int filterSet = weightParam[3];//m  UNEEDED?

    //int inputHeight = inputParam[1]; //h
    int inputWidth = inputParam[0]; //w
    //int inputDepth = inputParam[2]; //c UNEEDED?
    
    int outputHeight = outputParam[1]; //h'
    int outputWidth = outputParam[0]; //w'
    int outputDepth = outputParam[2];//m This should be the same as weightParam[2]

    

    //float bias = biasParam[0];//b

    // TODO: make sure that we dont need to worry about stride (i dont think so bc like we bascially just have a stride of 1?)

    bool first = true; 

    //float output[outputHeight][outputWidth][outputDepth];
    for(int m = 0; m < outputDepth; m++){
        for(int output_y = 0; output_y < outputHeight; output_y++){
            for(int output_x = 0; output_x < outputWidth; output_x++){    

                // do filter stuff, i thought this was 4d but the 4th dim is in the output depth ig
                float sum = 0.0;
                    for (int c = 0; c < filterDepth; c++){
                        for(int r = 0; r < filterHeight; r++){
                            for(int s = 0; s < filterWidth; s++){
                                
                                int input_y = output_y + r;
                                int input_x = output_x + s;
                                // TODO: maybe add safety checks so we dont go out of bounds?
                                // we can get the values from the flat array by calculating the index (hopefully this is how it was formatted from tensorflow)
                                //float weight = weightData.get<fp32>( (m * (filterHeight * filterWidth * filterDepth)) + (c * (filterWidth * filterHeight)) + (r * filterWidth) +  s); 
                                //float input = dataIn.get<fp32>( (c * (inputHeight * inputWidth)) + ((output_y + r) * inputWidth) + (output_x + s) ); 
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

                if(first){
                    std::cout << "Sum: " << sum << "\n"; 
                    first = false; 
                }

                // getOutputData().get<fp32>((m * (outputHeight * outputWidth)) + output_y * outputWidth + output_x) = ReLUOutput;

                float output_val = sum + biasData.get<fp32>(m);
                getOutputData().get<fp32>(
                    (output_y * outputWidth * outputDepth) + (output_x * outputDepth) + m
                ) = std::max(0.0f, output_val);
            
        
            }
        }   
    }
    

    

    // The following line is an example of copying a single 32-bit floating point integer from the input layer data to the output layer data
    //getOutputData().get<fp32>(0) = dataIn.get<fp32>(0);
}

// Compute the convolution using threads
void ConvolutionalLayer::computeThreaded(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using a tiled approach
void ConvolutionalLayer::computeTiled(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using SIMD
void ConvolutionalLayer::computeSIMD(const LayerData& dataIn) const {
    // TODO: Your Code Here...
}

// Compute the convolution using SIMD
void ConvolutionalLayer::computeHardware(const LayerData& dataIn) const {
        #ifdef ZEDBOARD

        #include <xllfifo_hw.h>
        #include <xil_io.h>
        
        const std::vector<std::size_t> weightParam = getWeightParams().dims; // Get dims of the filters
        const std::vector<std::size_t> inputParam = getInputParams().dims; // Get dims of the filters
        const std::vector<std::size_t> outputParam = getOutputParams().dims; // Get dims of the filters


        int filterHeight = weightParam[1]; //r
        int filterWidth = weightParam[0]; //s
        int filterDepth = weightParam[2]; //c

        //int inputHeight = inputParam[1]; //h
        int inputWidth = inputParam[0]; //w
        //int inputDepth = inputParam[2]; //c UNEEDED?
        
        int outputHeight = outputParam[1]; //h'
        int outputWidth = outputParam[0]; //w'
        int outputDepth = outputParam[2];//m This should be the same as weightParam[2]

        

        //float bias = biasParam[0];//b
        bool first = true;
        // TODO: make sure that we dont need to worry about stride (i dont think so bc like we bascially just have a stride of 1?)

        //float output[outputHeight][outputWidth][outputDepth];
        for(int m = 0; m < outputDepth; m++){
            for(int output_y = 0; output_y < outputHeight; output_y++){
                for(int output_x = 0; output_x < outputWidth; output_x++){    

                    // do filter stuff, i thought this was 4d but the 4th dim is in the output depth ig
                    float sum = 0.0;
                        for (int c = 0; c < filterDepth; c++){
                            for(int r = 0; r < filterHeight; r++){
                                for(int s = 0; s < filterWidth; s++){
                                    
                                    int input_y = output_y + r;
                                    int input_x = output_x + s;
                                    // TODO: maybe add safety checks so we dont go out of bounds?
                                    // we can get the values from the flat array by calculating the index (hopefully this is how it was formatted from tensorflow)
                                    //float weight = weightData.get<fp32>( (m * (filterHeight * filterWidth * filterDepth)) + (c * (filterWidth * filterHeight)) + (r * filterWidth) +  s); 
                                    //float input = dataIn.get<fp32>( (c * (inputHeight * inputWidth)) + ((output_y + r) * inputWidth) + (output_x + s) ); 
                                    float weight = weightData.get<fp32>(
                                    (r * filterWidth * filterDepth * outputDepth) +
                                    (s * filterDepth * outputDepth) +
                                    (c * outputDepth) +
                                    m);               
                                    
                                    float input = dataIn.get<fp32>(
                                    (input_y * inputWidth * filterDepth) +
                                    (input_x * filterDepth) +
                                    c);
                                    
                                    Xil_Out32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_TDFD_OFFSET, float_to_u32(weight));
                                    Xil_Out32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_TDFD_OFFSET, float_to_u32(input));
                            }
                        }
                        }

                    int numPackets = filterDepth * filterHeight * filterWidth * 2;

                    Xil_Out32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_TLF_OFFSET, numPackets * 4);

                    //std::cout << "Test\n";

                    ui32 in_data; 


                    while (true) {
                        // Then read how many words are available to us right now.
                        // Bit 31 = 1 when this is all the words in the current packet
                        // Bit 31 = 0 when this is how many words are available,
                        // but no TLAST has been sent to us yet
                        uint32_t read_len = Xil_In32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_RLF_OFFSET);



                        // Read out every word we have access to right now
                        for (int i = 0; i < (read_len & 0x7FFFFFFFUL); i+=4) {
                            in_data = (ui32)Xil_In32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_RDFD_OFFSET);
                            // Process in_data here from your MAC unit
                        }

                        if (!(read_len & (1 << 31))) {
                            break; // This is all the data in this packet, done
                        }
                    // There is more in this data packet, wait for more to come in
                    }

                    //std::cout << "Test2\n";

                    // --- Add Bias ---
                    // The bias is pre-quantized to int32 and added directly to the accumulator.
                    // It is assumed S_bias = S_input * S_weight.
                    // std::cout << (float)accumulator<< " ";
                    sum = u32_to_float(in_data);
                    // TODO: add relu activation function here?
                    // output is assigned in a flat manner, basicaly caluclated by multiplying and adding for each dim
                    
                    // float outputValue = sum + biasData.get<fp32>(m);

                    //std::cout << "Sum: " << sum << "\n"; 

                    // float ReLUOutput = std::max(0.0f, outputValue);

                    // getOutputData().get<fp32>((m * (outputHeight * outputWidth)) + output_y * outputWidth + output_x) = ReLUOutput;

                    float output_val = sum + biasData.get<fp32>(m);
                    getOutputData().get<fp32>(
                        (output_y * outputWidth * outputDepth) + (output_x * outputDepth) + m
                    ) = std::max(0.0f, output_val);
                
            
                }
            }   
        }
        
        #else
            computeNaive(dataIn);
        #endif
}

}  // namespace ML
