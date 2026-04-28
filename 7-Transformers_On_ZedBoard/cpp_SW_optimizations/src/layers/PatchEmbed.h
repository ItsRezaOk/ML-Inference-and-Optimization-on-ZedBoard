#pragma once

#include "Layer.h"

namespace ML {
    class PatchEmbedLayer : public Layer {
    public:
        // Constructor: Accepts the standard IO params PLUS the 4 specific weight definitions
        PatchEmbedLayer(const LayerParams inParams, 
                        const LayerParams outParams,
                        const LayerParams projWeights,
                        const LayerParams projBiases,
                        const LayerParams clsToken,
                        const LayerParams posEmbed)
            : Layer(inParams, outParams, LayerType::PATCHEMBED),
              projWeightsParams(projWeights),
              projBiasesParams(projBiases),
              clsTokenParams(clsToken),
              posEmbedParams(posEmbed),
              projWeightsData(projWeights),
              projBiasesData(projBiases),
              clsTokenData(clsToken),
              posEmbedData(posEmbed) 
        {}

        // Allocate resources and Load data from the binary files
        virtual void allocLayer() override {
            Layer::allocLayer(); // Allocates the Output Data buffer
            projWeightsData.loadData();
            projBiasesData.loadData();
            clsTokenData.loadData();
            posEmbedData.loadData();
        }

        // Free resources
        virtual void freeLayer() override {
            Layer::freeLayer();
            projWeightsData.freeData();
            projBiasesData.freeData();
            clsTokenData.freeData();
            posEmbedData.freeData();
        }

        // Virtual functions
        virtual void computeNaive(const LayerData& dataIn) const override;
        virtual void computeAccelerated(const LayerData& dataIn) const override;
        virtual void computeThreaded(const LayerData& dataIn) const override;
        virtual void computeTiled(const LayerData& dataIn) const override;
        virtual void computeSIMD(const LayerData& dataIn) const override;
        virtual void computeQuantized(const LayerData& dataIn) const override;

    private:
        // --- Layer Specific Parameters (Metadata) ---
        LayerParams projWeightsParams; 
        LayerParams projBiasesParams;  
        LayerParams clsTokenParams;    
        LayerParams posEmbedParams;    

        // --- Layer Specific Data (Actual Memory) ---
        LayerData projWeightsData;
        LayerData projBiasesData;
        LayerData clsTokenData;
        LayerData posEmbedData;
    };

}