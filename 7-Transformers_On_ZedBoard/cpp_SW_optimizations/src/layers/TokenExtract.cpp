#include "TokenExtract.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"

#include <iostream>
#include <vector>

namespace ML {

// Extract the CLS token (Index 0) from the sequence
// Input: [SeqLen, Dim] (e.g., 65 x 96)
// Output: [1, Dim] (e.g., 1 x 96)
void TokenExtractLayer::computeNaive(const LayerData& dataIn) const {
    // logInfo("Running Naive TokenExtract Computation...");

    // The output size is simply the size of one embedding vector (e.g., 96)
    const size_t count = getOutputParams().flat_count();

    // Since the CLS token is at index 0 of the sequence, 
    // it occupies the first 'count' elements of the input buffer.
    // We simply copy them.
    for (size_t i = 0; i < count; i++) {
        getOutputData().get<float>(i) = dataIn.get<float>(i);
    }
}

// Compute using threads
void TokenExtractLayer::computeThreaded(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

// Compute using a tiled approach
void TokenExtractLayer::computeTiled(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

// Compute using SIMD
void TokenExtractLayer::computeSIMD(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

// Quantized version
void TokenExtractLayer::computeQuantized(const LayerData& dataIn) const {
    const size_t count = getOutputParams().flat_count();

    for (size_t i = 0; i < count; i++) {
        getOutputData().get<int8_t>(i) = dataIn.get<int8_t>(i);
    }
}

// Accelerated placeholder
void TokenExtractLayer::computeAccelerated(const LayerData& dataIn) const {
    computeNaive(dataIn);
}

} // namespace ML