#include "LayerNorm.h"

#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"

#include <iostream>
#include <vector>
#include <cmath>

namespace ML {

    // Naive LayerNorm computation
    // Formula: y = (x - mean) / sqrt(var + eps) * gamma + beta
    void LayerNormLayer::computeNaive(const LayerData& dataIn) const {
        //logInfo("Running Naive LayerNorm Computation...");
        
        // Input Shape: [SeqLen, EmbedDim] (e.g., 65, 96)
        const int num_tokens = getInputParams().dims[0];
        const int dim = getInputParams().dims[1];
        
        // Epsilon for numerical stability
        // IMPORTANT: Must match the Python model (usually 1e-6 for ViTs, 1e-5 for standard PyTorch)
        // We verified 1e-6 in the Python verification step.
        const float eps = 1e-6f; 

        for (int t = 0; t < num_tokens; ++t) {
            // 1. Calculate Mean per token
            float sum = 0.0f;
            for (int d = 0; d < dim; ++d) {
                sum += dataIn.get<float>(t * dim + d);
            }
            float mean = sum / dim;

            // 2. Calculate Variance per token
            // PyTorch LayerNorm uses "biased" variance (division by N, not N-1)
            float sum_sq_diff = 0.0f;
            for (int d = 0; d < dim; ++d) {
                float diff = dataIn.get<float>(t * dim + d) - mean;
                sum_sq_diff += diff * diff;
            }
            float var = sum_sq_diff / dim;

            // 3. Normalize, Scale (Gamma), and Shift (Beta)
            float inv_std = 1.0f / std::sqrt(var + eps);
            
            for (int d = 0; d < dim; ++d) {
                float val = dataIn.get<float>(t * dim + d);
                float gamma = weightData.get<float>(d);
                float beta = biasData.get<float>(d);
                
                // Apply formula
                getOutputData().get<float>(t * dim + d) = ((val - mean) * inv_std) * gamma + beta;
            }
        }
    }

    // Placeholders for abstract methods
    void LayerNormLayer::computeAccelerated(const LayerData& dataIn) const { computeNaive(dataIn); }
    void LayerNormLayer::computeThreaded(const LayerData& dataIn) const { computeNaive(dataIn); }
    void LayerNormLayer::computeTiled(const LayerData& dataIn) const { computeNaive(dataIn); }
    void LayerNormLayer::computeSIMD(const LayerData& dataIn) const { computeNaive(dataIn); }
    void LayerNormLayer::computeQuantized(const LayerData& dataIn) const { computeNaive(dataIn); }

}  // namespace ML