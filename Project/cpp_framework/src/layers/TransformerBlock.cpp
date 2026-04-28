#include "TransformerBlock.h"
#include "../Utils.h"
#include "../Types.h"
#include "Layer.h"
#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>

namespace ML {

    // --- Helper Math Functions ---
    static void runLayerNorm(const LayerData& in, LayerData& out, 
                             const LayerData& gamma, const LayerData& beta, 
                             int seqLen, int dim) {
        const float eps = 1e-6f;
        for(int i=0; i<seqLen; ++i) {
            float sum = 0;
            for(int j=0; j<dim; ++j) sum += in.get<float>(i*dim + j);
            float mean = sum / dim;
            
            float sum_sq = 0;
            for(int j=0; j<dim; ++j) {
                float val = in.get<float>(i*dim + j);
                sum_sq += (val - mean)*(val - mean);
            }
            float var = sum_sq / dim;
            float inv_std = 1.0f / std::sqrt(var + eps);

            for(int j=0; j<dim; ++j) {
                float val = in.get<float>(i*dim + j);
                float w = gamma.get<float>(j);
                float b = beta.get<float>(j);
                out.get<float>(i*dim + j) = ((val - mean) * inv_std) * w + b;
            }
        }
    }

    static void runLinear(const LayerData& in, LayerData& out, 
                          const LayerData& w, const LayerData& b, 
                          int seqLen, int inDim, int outDim) {
        for(int i=0; i<seqLen; ++i) {
            for(int j=0; j<outDim; ++j) {
                float sum = b.get<float>(j);
                for(int k=0; k<inDim; ++k) {
                    sum += in.get<float>(i*inDim + k) * w.get<float>(j*inDim + k);
                }
                out.get<float>(i*outDim + j) = sum;
            }
        }
    }

    static void runGELU(LayerData& data, int count) {
        for(int i=0; i<count; ++i) {
            float x = data.get<float>(i);
            // 0.5 * x * (1 + erf(x / sqrt(2)))
            float val = 0.5f * x * (1.0f + std::erf(x * 0.70710678f)); 
            data.get<float>(i) = val;
        }
    }

    // --- Allocation ---
void TransformerBlockLayer::allocLayer() {
        Layer::allocLayer(); 

        // 1. Allocate Weights
        norm1Weights.allocData(); norm1Weights.loadData();
        norm1Bias.allocData();    norm1Bias.loadData();
        qkvWeights.allocData();   qkvWeights.loadData();
        qkvBias.allocData();      qkvBias.loadData();
        projWeights.allocData();  projWeights.loadData();
        projBias.allocData();     projBias.loadData();
        norm2Weights.allocData(); norm2Weights.loadData();
        norm2Bias.allocData();    norm2Bias.loadData();
        fc1Weights.allocData();   fc1Weights.loadData();
        fc1Bias.allocData();      fc1Bias.loadData();
        fc2Weights.allocData();   fc2Weights.loadData();
        fc2Bias.allocData();      fc2Bias.loadData();

        // 2. Allocate Buffers
        norm1Out.allocData();
        qkvOut.allocData();
        attnScores.allocData();
        attnOut.allocData();
        norm2Out.allocData();
        mlpHidden.allocData();
        mlpOut.allocData();
    }

    void TransformerBlockLayer::freeLayer() {
        Layer::freeLayer();
        norm1Weights.freeData(); norm1Bias.freeData();
        qkvWeights.freeData();   qkvBias.freeData();
        projWeights.freeData();  projBias.freeData();
        norm2Weights.freeData(); norm2Bias.freeData();
        fc1Weights.freeData();   fc1Bias.freeData();
        fc2Weights.freeData();   fc2Bias.freeData();

        norm1Out.freeData();
        qkvOut.freeData();
        attnScores.freeData();
        attnOut.freeData();
        norm2Out.freeData();
        mlpHidden.freeData();
        mlpOut.freeData();
    }

    // --- Computation ---
    void TransformerBlockLayer::computeNaive(const LayerData& dataIn) const {
        // logInfo("Running Naive Transformer Block Computation...");
        int seqLen = getInputParams().dims[0];
        int dim = getInputParams().dims[1];
        int headDim = dim / numHeads;
        // int hiddenDim = fc1WeightsParam.dims[0];
        int hiddenDim = dim * 2; // Hardcoded ratio 2
        float scale = 1.0f / std::sqrt((float)headDim);

        //logInfo("Running LayerNorm 1");
        // 1. Norm 1
        runLayerNorm(dataIn, norm1Out, norm1Weights, norm1Bias, seqLen, dim);

        //logInfo("Running QKV Linear");
        // 2. QKV
        runLinear(norm1Out, qkvOut, qkvWeights, qkvBias, seqLen, dim, 3*dim);

        //logInfo("Running Attention");
        // 3. Attention
        for (int h = 0; h < numHeads; ++h) {
            //logInfo("  Processing Head " + std::to_string(h));
            // Scores
            for (int i = 0; i < seqLen; ++i) {
                for (int j = 0; j < seqLen; ++j) {
                    float dot = 0;
                    for (int d = 0; d < headDim; ++d) {
                        int q_idx = i * (3*dim) + (0 * dim) + (h * headDim) + d;
                        int k_idx = j * (3*dim) + (1 * dim) + (h * headDim) + d;
                        dot += qkvOut.get<float>(q_idx) * qkvOut.get<float>(k_idx);
                    }
                    attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j) = dot * scale;
                }
            }
            //logInfo("  Softmax for Head " + std::to_string(h));
            // Softmax
            for (int i = 0; i < seqLen; ++i) {
                float max_val = -1e9;
                for (int j = 0; j < seqLen; ++j) {
                    float val = attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j);
                    if (val > max_val) max_val = val;
                }
                float sum_exp = 0;
                for (int j = 0; j < seqLen; ++j) {
                    float val = std::exp(attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j) - max_val);
                    attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j) = val;
                    sum_exp += val;
                }
                for (int j = 0; j < seqLen; ++j) {
                    attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j) /= sum_exp;
                }
            }
            //logInfo("  Weighted Sum for Head " + std::to_string(h));
            // Weighted Sum
            for (int i = 0; i < seqLen; ++i) {
                for (int d = 0; d < headDim; ++d) {
                    float sum = 0;
                    for (int j = 0; j < seqLen; ++j) {
                        float score = attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j);
                        int v_idx = j * (3*dim) + (2 * dim) + (h * headDim) + d;
                        sum += score * qkvOut.get<float>(v_idx);
                    }
                    attnOut.get<float>(i*dim + h*headDim + d) = sum;
                }
            }
        }

        // 4. Proj & Residual
        // We reuse norm1Out as temp buffer for Projection result
        runLinear(attnOut, norm1Out, projWeights, projBias, seqLen, dim, dim);
        for(int i=0; i<seqLen*dim; ++i) {
            attnOut.get<float>(i) = dataIn.get<float>(i) + norm1Out.get<float>(i);
        }

        // 5. MLP
        runLayerNorm(attnOut, norm2Out, norm2Weights, norm2Bias, seqLen, dim);
        runLinear(norm2Out, mlpHidden, fc1Weights, fc1Bias, seqLen, dim, hiddenDim);
        runGELU(mlpHidden, seqLen * hiddenDim);
        runLinear(mlpHidden, mlpOut, fc2Weights, fc2Bias, seqLen, hiddenDim, dim);

        // 6. Final Residual
        for(int i=0; i<seqLen*dim; ++i) {
            getOutputData().get<float>(i) = attnOut.get<float>(i) + mlpOut.get<float>(i);
        }
    }

    // Placeholders
    void TransformerBlockLayer::computeAccelerated(const LayerData& dataIn) const { computeNaive(dataIn); }
    void TransformerBlockLayer::computeThreaded(const LayerData& dataIn) const { computeNaive(dataIn); }
    void TransformerBlockLayer::computeTiled(const LayerData& dataIn) const { computeNaive(dataIn); }
    void TransformerBlockLayer::computeSIMD(const LayerData& dataIn) const { computeNaive(dataIn); }
    void TransformerBlockLayer::computeQuantized(const LayerData& dataIn) const { computeNaive(dataIn); }

}