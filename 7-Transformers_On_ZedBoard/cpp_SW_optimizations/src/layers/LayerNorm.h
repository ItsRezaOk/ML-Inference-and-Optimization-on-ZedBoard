#pragma once

#include "Layer.h"

namespace ML {
    class LayerNormLayer : public Layer {
    public:
        // Constructor: Now accepts Weights (Gamma) and Biases (Beta)
        LayerNormLayer(const LayerParams inParams, const LayerParams outParams, 
                       const LayerParams weightParams, const LayerParams biasParams)
            : Layer(inParams, outParams, LayerType::LAYERNORM),
              weightParams(weightParams),
              biasParams(biasParams),
              weightData(weightParams),
              biasData(biasParams) 
        {}

        // Allocate resources and Load data
        virtual void allocLayer() override {
            Layer::allocLayer(); // Allocate Output Buffer
            
            weightData.loadData();
            biasData.loadData();
        }

        // Free resources
        virtual void freeLayer() override {
            Layer::freeLayer();
            weightData.freeData();
            biasData.freeData();
        }

        // Virtual functions
        virtual void computeNaive(const LayerData& dataIn) const override;
        virtual void computeAccelerated(const LayerData& dataIn) const override;
        virtual void computeThreaded(const LayerData& dataIn) const override;
        virtual void computeTiled(const LayerData& dataIn) const override;
        virtual void computeSIMD(const LayerData& dataIn) const override;
        virtual void computeQuantized(const LayerData& dataIn) const override;

    private:
        LayerParams weightParams;
        LayerParams biasParams;
        
        LayerData weightData; // Stores Gamma
        LayerData biasData;   // Stores Beta
    };

}