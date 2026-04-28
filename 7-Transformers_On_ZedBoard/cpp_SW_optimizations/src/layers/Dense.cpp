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
    // Dimensions from Weight Params to be safe
    // PyTorch Weights are [OutChannels, InChannels]
    const std::vector<std::size_t>& wDims = weightParam.dims;
    
    int outputSize = wDims[0]; // Rows (Out features)
    int inputSize = wDims[1];  // Cols (In features)

    bool applyReLU = getReLUBoolean();

    // Loop over Output Neurons
    for(int j = 0; j < outputSize; j++){ 
        
        // Start with Bias
        float sum = biasData.get<float>(j);

        // Dot Product
        for(int i = 0; i < inputSize; i++){ 
            // Weight Access: [Out, In] -> Row-Major
            // Index = j * inputSize + i
            float weight = weightData.get<float>(j * inputSize + i);
            float input = dataIn.get<float>(i); 
            
            sum += weight * input;
        }

        // Apply ReLU if needed (left over from CNN approach tho)
        if (applyReLU && sum < 0) {
            sum = 0;
        }

        getOutputData().get<float>(j) = sum;
    }
}

// Compute using threads
void DenseLayer::computeThreaded(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

// Compute using a tiled approach
void DenseLayer::computeTiled(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

// Compute using SIMD
void DenseLayer::computeSIMD(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

// Compute Quantized (Placeholder / Legacy)
void DenseLayer::computeQuantized(const LayerData& dataIn) const {
    // Revert to naive float for this model implementation to ensure accuracy
    // unless you specifically need int8 inference logic here.
    computeNaive(dataIn);
}

// Compute Accelerated (Placeholder)
void DenseLayer::computeAccelerated(const LayerData& dataIn) const {
    #ifdef ZEDBOARD

    #include <xllfifo_hw.h>
    #include <xil_io.h>
    
    const std::vector<std::size_t>& wDims = weightParam.dims;
    
    int outputSize = wDims[0]; // Rows (Out features)
    int inputSize = wDims[1];  // Cols (In features)
    //int weightInputSize = weightParam[0];
    //int biasSize = biasParam[0];

    bool ReLUBoolean = getReLUBoolean();
    

    // now, its densing time (also known as a fully connected layering time)
    // this is basically the same as the conv layer but 1D and much easier and we should've started with this layer
    for(int j = 0; j < outputSize; j++){ 
        float sum = 0.0;
        for(int i = 0; i < inputSize; i++){ 
            //float weight = weightData.get<fp32>( j * weightInputSize + i);
            float weight = weightData.get<float>(j * inputSize + i);
            float input = dataIn.get<float>(i); 

            Xil_Out32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_TDFD_OFFSET, float_to_u32(weight));
            Xil_Out32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_TDFD_OFFSET, float_to_u32(input));
        }

        int numPackets = inputSize * 2;

        Xil_Out32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_TLF_OFFSET, numPackets * 4);

        //while (Xil_In32(XPAR_AXI_FIFO_0_BASEADDR + XLLF_RDFO_OFFSET) == 0);

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

        sum = u32_to_float(in_data);
        
        sum += biasData.get<fp32>(j); // add bias
        // relu
        if ((sum < 0) && (ReLUBoolean)){
            sum = 0;
        }
        getOutputData().get<fp32>(j) = sum;
    }

    #else
        computeNaive(dataIn);
    #endif
}

} // namespace ML