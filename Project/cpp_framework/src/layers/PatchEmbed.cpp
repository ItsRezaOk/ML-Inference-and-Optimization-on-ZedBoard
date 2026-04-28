#include "PatchEmbed.h"

#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"

#include <iostream>
#include <vector>

namespace ML {

    // Naive PatchEmbed computation
    // Performs: 
    // 1. Conv2d (Stride=PatchSize) to flatten patches
    // 2. Prepend CLS token
    // 3. Add Position Embeddings
    void PatchEmbedLayer::computeNaive(const LayerData& dataIn) const {
        // logInfo("Running Naive PatchEmbed Computation...");
        // --- Dimensions ---
        // Input: [H, W, C] (e.g., 64, 64, 3)
        const int inputHeight = getInputParams().dims[0];
        const int inputWidth = getInputParams().dims[1];
        const int channels = getInputParams().dims[2];

        // Weights: [OutChannels, InChannels, Kernel, Kernel] (e.g., 96, 3, 8, 8)
        const int embedDim = projWeightsParams.dims[0]; 
        // const int inChannels = projWeightsParams.dims[1]; // Should match 'channels'
        const int patchSize = projWeightsParams.dims[2];

        // Output: [SeqLen, EmbedDim] (e.g., 65, 96)
        //const int seqLen = getOutputParams().dims[0]; 
        // const int outDim = getOutputParams().dims[1]; // Should match 'embedDim'

        // Grid sizes (e.g., 64 / 8 = 8)
        const int gridH = inputHeight / patchSize;
        const int gridW = inputWidth / patchSize;

        // const size_t outputSize = getOutputParams().flat_count();

        // std::cout << "Debug: H=" << inputHeight 
        //           << " Dim=" << embedDim 
        //           << " Patch=" << patchSize 
        //           << " TotalOut=" << outputSize << std::endl;

        //logInfo("Starting Patch Embedding at step 1");
        // --- Step 1: Handle the CLS Token (Index 0) ---
        // Output[0] = CLS_Token + Pos_Embed[0]
        for (int d = 0; d < embedDim; d++) {
            float clsVal = clsTokenData.get<float>(d);
            float posVal = posEmbedData.get<float>(d); // Index 0 of pos embed
            
            // Set first row of output
            getOutputData().get<float>(0 * embedDim + d) = clsVal + posVal;
        }


        //logInfo("Patch Embedding at step 2");
        // --- Step 2: Handle Image Patches (Indices 1 to N) ---
        // Iterate over the grid of patches
        for (int h = 0; h < gridH; h++) {
            for (int w = 0; w < gridW; w++) {
                
                // Calculate which token index this patch corresponds to
                // +1 because index 0 is taken by CLS
                int tokenIdx = (h * gridW + w) + 1; 

                // For every embedding dimension (e.g., 0 to 95)
                for (int d = 0; d < embedDim; d++) {
                    //std::cout << "output index at start: " << (tokenIdx * embedDim + d) << std::endl;
                    
                    // Start with the bias
                    float sum = projBiasesData.get<float>(d);

                    // Perform Convolution (Dot Product) on this patch
                    // Loop over the patch pixels
                    for (int c = 0; c < channels; c++) {
                        for (int ph = 0; ph < patchSize; ph++) {
                            for (int pw = 0; pw < patchSize; pw++) {
                                
                                // Input Image Index (HWC format)
                                int imgY = h * patchSize + ph;
                                int imgX = w * patchSize + pw;
                                int imgIdx = (imgY * inputWidth * channels) + (imgX * channels) + c;
                                
                                float pixelVal = dataIn.get<float>(imgIdx);

                                // Weight Index (NCHW format from PyTorch)
                                // [Out, In, K, K] -> [d, c, ph, pw]
                                // Flattened: d * (C*P*P) + c * (P*P) + ph * P + pw
                                int weightIdx = d * (channels * patchSize * patchSize) 
                                              + c * (patchSize * patchSize) 
                                              + ph * patchSize 
                                              + pw;
                                
                                float weightVal = projWeightsData.get<float>(weightIdx);

                                sum += pixelVal * weightVal;
                            }
                        }
                    }

                    // Add Positional Embedding for this specific token
                    float posVal = posEmbedData.get<float>(tokenIdx * embedDim + d);
                    //std::cout << "posVal: " << posVal << std::endl;
                    //std::cout << "output index: " << (tokenIdx * embedDim + d) << std::endl;
                    // Write final value
                    getOutputData().get<float>(tokenIdx * embedDim + d) = sum + posVal;
                }
            }
        }
    }

    // Accelerated PatchEmbed computation (placeholder for actual acceleration)
    void PatchEmbedLayer::computeAccelerated(const LayerData& dataIn) const {
        computeNaive(dataIn);
    }

    void PatchEmbedLayer::computeThreaded(const LayerData& dataIn) const {

    }

        void PatchEmbedLayer::computeTiled(const LayerData& dataIn) const {

    }

        void PatchEmbedLayer::computeSIMD(const LayerData& dataIn) const {

    }

    void PatchEmbedLayer::computeQuantized(const LayerData& dataIn) const {

    }

}  // namespace ML