#include "Softmax.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"

#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <cfloat> // For FLT_MAX

namespace ML {

void SoftmaxLayer::computeNaive(const LayerData& dataIn) const {
    // Use flat_count to handle shapes like {1, 200} correctly
    const size_t count = getOutputParams().flat_count();

    // 1. Find Max (for Numerical Stability)
    // Formula: softmax(x) = exp(x - max(x)) / sum(exp(x - max(x)))
    float max_val = -FLT_MAX;
    for (size_t i = 0; i < count; i++) {
        float val = dataIn.get<float>(i);
        if (val > max_val) {
            max_val = val;
        }
    }

    // 2. Compute Exponentials and Sum
    float sum_exp = 0.0f;
    for (size_t i = 0; i < count; i++) {
        float val = dataIn.get<float>(i);
        // Compute exp(x - max)
        float exp_val = std::exp(val - max_val);
        
        // Store temporarily in output buffer to avoid recomputing exp later
        getOutputData().get<float>(i) = exp_val;
        sum_exp += exp_val;
    }

    // 3. Normalize
    for (size_t i = 0; i < count; i++) {
        getOutputData().get<float>(i) /= sum_exp;
    }
}

// Compute using threads
void SoftmaxLayer::computeThreaded(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

// Compute using a tiled approach
void SoftmaxLayer::computeTiled(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

// Compute using SIMD
void SoftmaxLayer::computeSIMD(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

// Compute Quantized (Placeholder)
void SoftmaxLayer::computeQuantized(const LayerData& dataIn) const {
    // Fallback to naive for now, or implement int8 softmax table lookup if needed
    computeNaive(dataIn);
}

// Compute Accelerated (Placeholder)
void SoftmaxLayer::computeAccelerated(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

} // namespace ML
