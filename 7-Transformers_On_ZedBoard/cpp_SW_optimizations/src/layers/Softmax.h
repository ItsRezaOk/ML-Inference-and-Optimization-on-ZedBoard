#pragma once

#include "../Types.h"
#include "../Utils.h"
#include "Layer.h"

namespace ML {
class SoftmaxLayer : public Layer {
   public:
    SoftmaxLayer(const LayerParams inParams, const LayerParams outParams)
        : Layer(inParams, outParams, LayerType::SOFTMAX) {}

    // Allocate resources
    virtual void allocLayer() override {
        Layer::allocLayer();
    }

    // Free resources
    virtual void freeLayer() override {
        Layer::freeLayer();
    }

    // Virtual functions
    virtual void computeNaive(const LayerData& dataIn) const override;
    virtual void computeThreaded(const LayerData& dataIn) const override;
    virtual void computeTiled(const LayerData& dataIn) const override;
    virtual void computeSIMD(const LayerData& dataIn) const override;
    virtual void computeQuantized(const LayerData& dataIn) const override;
    virtual void computeAccelerated(const LayerData& dataIn) const override;

   private:
};

}  // namespace ML