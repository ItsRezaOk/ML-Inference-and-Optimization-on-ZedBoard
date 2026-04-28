#pragma once

#include "Layer.h"

namespace ML {
    class TransformerBlockLayer : public Layer {
    public:
        TransformerBlockLayer(
            const LayerParams inParams, 
            const LayerParams outParams,
            const LayerParams norm1W, const LayerParams norm1B,
            const LayerParams qkvW,   const LayerParams qkvB,
            const LayerParams projW,  const LayerParams projB,
            const LayerParams norm2W, const LayerParams norm2B,
            const LayerParams fc1W,   const LayerParams fc1B,
            const LayerParams fc2W,   const LayerParams fc2B,
            const int numHeads)
            : Layer(inParams, outParams, LayerType::TRANSFORMERBLOCK),
              // 1. Metadata
              numHeads(numHeads),
              norm1WeightsParam(norm1W), norm1BiasParam(norm1B),
              qkvWeightsParam(qkvW),     qkvBiasParam(qkvB),
              projWeightsParam(projW),   projBiasParam(projB),
              norm2WeightsParam(norm2W), norm2BiasParam(norm2B),
              fc1WeightsParam(fc1W),     fc1BiasParam(fc1B),
              fc2WeightsParam(fc2W),     fc2BiasParam(fc2B),
              
              // 2. Weights Memory
              norm1Weights(norm1W), norm1Bias(norm1B),
              qkvWeights(qkvW),     qkvBias(qkvB),
              projWeights(projW),   projBias(projB),
              norm2Weights(norm2W), norm2Bias(norm2B),
              fc1Weights(fc1W),     fc1Bias(fc1B),
              fc2Weights(fc2W),     fc2Bias(fc2B),

              // 3. Intermediate Buffers (CALCULATED SIZES)
              // We must use the input dimensions to set the size correctly here.
              // inParams.dims[0] = SeqLen (65)
              // inParams.dims[1] = EmbedDim (96)
              
              // norm1Out: [SeqLen, Dim]
              norm1Out(LayerParams(sizeof(float), {inParams.dims[0], inParams.dims[1]})),
              
              // qkvOut: [SeqLen, 3 * Dim]
              qkvOut(LayerParams(sizeof(float), {inParams.dims[0], 3 * inParams.dims[1]})),
              
              // attnScores: [Heads, SeqLen, SeqLen]
              attnScores(LayerParams(sizeof(float), {(size_t)numHeads, inParams.dims[0], inParams.dims[0]})),
              
              // attnOut: [SeqLen, Dim]
              attnOut(LayerParams(sizeof(float), {inParams.dims[0], inParams.dims[1]})),
              
              // norm2Out: [SeqLen, Dim]
              norm2Out(LayerParams(sizeof(float), {inParams.dims[0], inParams.dims[1]})),
              
              // mlpHidden: [SeqLen, HiddenDim]
              // HiddenDim is the output of FC1 weights (fc1W.dims[0])
              mlpHidden(LayerParams(sizeof(float), {inParams.dims[0], fc1W.dims[0]})),
              
              // mlpOut: [SeqLen, Dim]
              mlpOut(LayerParams(sizeof(float), {inParams.dims[0], inParams.dims[1]}))
        {}

        virtual void allocLayer() override;
        virtual void freeLayer() override;

        virtual void computeNaive(const LayerData& dataIn) const override;
        virtual void computeAccelerated(const LayerData& dataIn) const override;
        virtual void computeThreaded(const LayerData& dataIn) const override;
        virtual void computeTiled(const LayerData& dataIn) const override;
        virtual void computeSIMD(const LayerData& dataIn) const override;
        virtual void computeQuantized(const LayerData& dataIn) const override;

    private:
        int numHeads;
        LayerParams norm1WeightsParam, norm1BiasParam;
        LayerParams qkvWeightsParam,   qkvBiasParam;
        LayerParams projWeightsParam,  projBiasParam;
        LayerParams norm2WeightsParam, norm2BiasParam;
        LayerParams fc1WeightsParam,   fc1BiasParam;
        LayerParams fc2WeightsParam,   fc2BiasParam;

        LayerData norm1Weights, norm1Bias;
        LayerData qkvWeights,   qkvBias;
        LayerData projWeights,  projBias;
        LayerData norm2Weights, norm2Bias;
        LayerData fc1Weights,   fc1Bias;
        LayerData fc2Weights,   fc2Bias;

        // Marked mutable so computeNaive (const) can write to them
        mutable LayerData norm1Out;    
        mutable LayerData qkvOut;      
        mutable LayerData attnScores;  
        mutable LayerData attnOut;     
        mutable LayerData norm2Out;    
        mutable LayerData mlpHidden;   
        mutable LayerData mlpOut;      
    };
}