#pragma once



#include "../Types.h"
#include "../Utils.h"
#include "Layer.h"

namespace ML {
class MaxPoolingLayer : public Layer {
   public:
    MaxPoolingLayer(const LayerParams inParams, const LayerParams outParams, int poolSize, int stride)
        : Layer(inParams, outParams, LayerType::MAX_POOLING), poolSize(poolSize), stride(stride) {}

    // Allocate all resources needed for the layer & Load all of the required data for the layer
    virtual void allocLayer() override {
        Layer::allocLayer();
    }

    // Fre all resources allocated for the layer
    virtual void freeLayer() override {
        Layer::freeLayer();
    }

    // Getters
    int getPoolSize() const { return poolSize; }
    int getStride() const { return stride; }

    // Virtual functions
    virtual void computeNaive(const LayerData& dataIn) const override;
    virtual void computeThreaded(const LayerData& dataIn) const override;
    virtual void computeTiled(const LayerData& dataIn) const override;
    virtual void computeSIMD(const LayerData& dataIn) const override;
    virtual void computeQuantized(const LayerData& dataIn) const override;
    virtual void computeAccelerated(const LayerData& dataIn) const override;

   private:
    int poolSize;
    int stride;
};

}  // namespace ML