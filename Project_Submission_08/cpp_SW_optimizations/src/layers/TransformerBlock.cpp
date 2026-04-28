#include "TransformerBlock.h"
#include "../Utils.h"
#include "../Config.h"
#include "../Types.h"
#include "Layer.h"
#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#if !defined(ZEDBOARD) || defined(ENABLE_ZEDBOARD_THREADS)
#include <thread>
#endif
#if defined(__ARM_NEON)
#include <arm_neon.h>
#endif

namespace ML {

    // --- Helper Math Functions ---
    // (Kept static to match your previous style)
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
    //UPDATED RUNLINEAR
    // Blocked matmul with optional NEON fast path.
    // Keeps the interface the same but tiles over output channels (JB) and input (BK)
    // so each tile fits better in caches. On ARM with NEON enabled, we vectorize the
    // inner dot product for fp32.
    static void runLinear(const LayerData& in, LayerData& out, 
                          const LayerData& w, const LayerData& b, 
                          int seqLen, int inDim, int outDim) {
        if (!Config::ENABLE_OPTIMIZED_LINEAR) {
            for (int i = 0; i < seqLen; ++i) {
                for (int j = 0; j < outDim; ++j) {
                    float sum = b.get<float>(j);
                    for (int k = 0; k < inDim; ++k) {
                        sum += in.get<float>(i * inDim + k) * w.get<float>(j * inDim + k);
                    }
                    out.get<float>(i * outDim + j) = sum;
                }
            }
            return;
        }
#if defined(ZEDBOARD)
        constexpr int BJ = 8;   // smaller tiles for Cortex-A9 cache
        constexpr int BK = 16;
#else
        constexpr int BJ = 16;  // best fit desktop tiling
        constexpr int BK = 32;
#endif

#if defined(__ARM_NEON)
        if (Config::ENABLE_SIMD) {
            const float* inBase = reinterpret_cast<const float*>(in.raw());
            const float* wBase  = reinterpret_cast<const float*>(w.raw());
            const float* bBase  = reinterpret_cast<const float*>(b.raw());
            float* outBase      = reinterpret_cast<float*>(out.raw());

            for (int i = 0; i < seqLen; ++i) {
                const float* inRow = inBase + i * inDim;
                float* outRow = outBase + i * outDim;

                for (int j = 0; j < outDim; ++j) {
                    const float* wRow = wBase + j * inDim;
                    float32x4_t acc = vdupq_n_f32(0.0f);
                    int k = 0;
                    for (; k <= inDim - 4; k += 4) {
                        float32x4_t wVec = vld1q_f32(wRow + k);
                        float32x4_t inVec = vld1q_f32(inRow + k);
                        acc = vmlaq_f32(acc, wVec, inVec);
                    }
                    // horizontal add acc
                    float32x2_t pair = vadd_f32(vget_low_f32(acc), vget_high_f32(acc));
                    pair = vpadd_f32(pair, pair);
                    float sum = vget_lane_f32(pair, 0);
                    // tail
                    for (; k < inDim; ++k) sum += wRow[k] * inRow[k];

                    outRow[j] = sum + bBase[j];
                }
            }
            return;
        }
#endif

        // Base pointers for contiguous access
        const float* inBase = reinterpret_cast<const float*>(in.raw());
        const float* wBase  = reinterpret_cast<const float*>(w.raw());
        const float* bBase  = reinterpret_cast<const float*>(b.raw());
        float* outBase      = reinterpret_cast<float*>(out.raw());

        // Loop over sequence elements (rows)
        for (int i = 0; i < seqLen; ++i) {
            const float* inRow = inBase + i * inDim;      // input row pointer
            float* outRow = outBase + i * outDim;         // output row pointer

            // Tile over output channels
            for (int jb = 0; jb < outDim; jb += BJ) {
                const int jLimit = std::min(jb + BJ, outDim); // end of this output tile

                // Local accumulators seeded with bias
                float acc[BJ];
                for (int j = jb; j < jLimit; ++j) {
                    acc[j - jb] = bBase[j];                // start with bias
                }

                // Tile over input dimension
                for (int kb = 0; kb < inDim; kb += BK) {
                    const int kLimit = std::min(kb + BK, inDim); // end of this input tile
                    for (int j = jb; j < jLimit; ++j) {
                        const float* wRow = wBase + j * inDim + kb; // weights for output j, input tile
                        float sum = acc[j - jb];                    // bring in current accumulator
                        for (int k = kb; k < kLimit; ++k) {
                            sum += inRow[k] * wRow[k - kb];         // dot product for this tile chunk
                        }
                        acc[j - jb] = sum;                          // store partial sum
                    }
                }

                // Write out the finished tile
                for (int j = jb; j < jLimit; ++j) {
                    outRow[j] = acc[j - jb];
                }
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

    // Optional streaming attention (avoids writing/reading the full score matrix)
    static void runAttentionHeadStreaming(const LayerData& qkvOut,
                                          LayerData& attnOut,
                                          int head,
                                          int seqLen,
                                          int dim,
                                          int headDim,
                                          float scale) {
        std::vector<float> scores(seqLen); // per-row scratch
        const float* qkvBase = reinterpret_cast<const float*>(qkvOut.raw());
        float* attnBase = reinterpret_cast<float*>(attnOut.raw());

        for (int i = 0; i < seqLen; ++i) {
            const float* qRow = qkvBase + i * (3 * dim) + head * headDim;

            // 1) compute scaled dot-products and track max
            float max_val = -1e9f;
            for (int j = 0; j < seqLen; ++j) {
                const float* kRow = qkvBase + j * (3 * dim) + dim + head * headDim;
                float dot = 0.0f;
                for (int d = 0; d < headDim; ++d) {
                    dot += qRow[d] * kRow[d];
                }
                float scaled = dot * scale;
                scores[j] = scaled;
                max_val = std::max(max_val, scaled);
            }

            // 2) softmax in-place on the scratch row
            float sum_exp = 0.0f;
            for (int j = 0; j < seqLen; ++j) {
                float e = std::exp(scores[j] - max_val);
                scores[j] = e;
                sum_exp += e;
            }
            const float inv_sum = 1.0f / sum_exp;

            // 3) weighted sum with V
            float* outRow = attnBase + i * dim + head * headDim;
            for (int d = 0; d < headDim; ++d) {
                float sum = 0.0f;
                for (int j = 0; j < seqLen; ++j) {
                    const float weight = scores[j] * inv_sum;
                    const float* vRow = qkvBase + j * (3 * dim) + (2 * dim) + head * headDim;
                    sum += weight * vRow[d];
                }
                outRow[d] = sum;
            }
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
        // Just call allocData(). The sizes are now correct from the Constructor.
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
        int seqLen = getInputParams().dims[0];
        int dim = getInputParams().dims[1];
        int headDim = dim / numHeads;
        int hiddenDim = dim * 2; // Hardcoded ratio 2 for now, or get from params
        float scale = 1.0f / std::sqrt((float)headDim);

        const bool doTiming = Config::ENABLE_LAYER_TIMING;
        const bool useStreaming = Config::ENABLE_STREAMING_ATTENTION;

        Timer t_norm_qkv("tb_norm_qkv");
        if (doTiming) t_norm_qkv.start();
        // 1. Norm 1 + QKV
        runLayerNorm(dataIn, norm1Out, norm1Weights, norm1Bias, seqLen, dim);
        runLinear(norm1Out, qkvOut, qkvWeights, qkvBias, seqLen, dim, 3*dim);
        if (doTiming) t_norm_qkv.stop();

        Timer t_attn("tb_attn_softmax");
        if (doTiming) t_attn.start();
        if (useStreaming) {
            for (int h = 0; h < numHeads; ++h) {
                runAttentionHeadStreaming(qkvOut, attnOut, h, seqLen, dim, headDim, scale);
            }
        } else {
            // 3. Attention (original path using attnScores buffer)
            for (int h = 0; h < numHeads; ++h) {
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
        }
        if (doTiming) t_attn.stop();

        // 4. Proj & Residual
        Timer t_proj("tb_proj_residual");
        if (doTiming) t_proj.start();
        runLinear(attnOut, norm1Out, projWeights, projBias, seqLen, dim, dim);
        for(int i=0; i<seqLen*dim; ++i) {
            attnOut.get<float>(i) = dataIn.get<float>(i) + norm1Out.get<float>(i);
        }
        if (doTiming) t_proj.stop();

        // 5. MLP
        Timer t_mlp("tb_mlp");
        if (doTiming) t_mlp.start();
        runLayerNorm(attnOut, norm2Out, norm2Weights, norm2Bias, seqLen, dim);
        runLinear(norm2Out, mlpHidden, fc1Weights, fc1Bias, seqLen, dim, hiddenDim);
        runGELU(mlpHidden, seqLen * hiddenDim);
        runLinear(mlpHidden, mlpOut, fc2Weights, fc2Bias, seqLen, hiddenDim, dim);
        if (doTiming) t_mlp.stop();

        // 6. Final Residual
        for(int i=0; i<seqLen*dim; ++i) {
            getOutputData().get<float>(i) = attnOut.get<float>(i) + mlpOut.get<float>(i);
        }
    }

#if !defined(ZEDBOARD) || defined(ENABLE_ZEDBOARD_THREADS)
    void TransformerBlockLayer::computeThreaded(const LayerData& dataIn) const {
        int seqLen = getInputParams().dims[0];
        int dim = getInputParams().dims[1];
        int headDim = dim / numHeads;
        int hiddenDim = dim * 2;
        float scale = 1.0f / std::sqrt((float)headDim);

        const bool doTiming = Config::ENABLE_LAYER_TIMING;
        const bool useStreaming = Config::ENABLE_STREAMING_ATTENTION;

        Timer t_norm_qkv("tb_norm_qkv");
        if (doTiming) t_norm_qkv.start();
        // Norm1 and QKV (shared)
        runLayerNorm(dataIn, norm1Out, norm1Weights, norm1Bias, seqLen, dim);
        runLinear(norm1Out, qkvOut, qkvWeights, qkvBias, seqLen, dim, 3*dim);
        if (doTiming) t_norm_qkv.stop();

        auto workHead = [&](int h) {
            if (useStreaming) {
                runAttentionHeadStreaming(qkvOut, attnOut, h, seqLen, dim, headDim, scale);
                return;
            }

            for (int i = 0; i < seqLen; ++i) {
                // scores = Q·K^T
                for (int j = 0; j < seqLen; ++j) {
                    float dot = 0;
                    for (int d = 0; d < headDim; ++d) {
                        int q_idx = i * (3*dim) + (0 * dim) + (h * headDim) + d;
                        int k_idx = j * (3*dim) + (1 * dim) + (h * headDim) + d;
                        dot += qkvOut.get<float>(q_idx) * qkvOut.get<float>(k_idx);
                    }
                    attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j) = dot * scale;
                }
                // softmax row
                float max_val = -1e9f;
                for (int j = 0; j < seqLen; ++j) {
                    float val = attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j);
                    max_val = std::max(max_val, val);
                }
                float sum_exp = 0;
                for (int j = 0; j < seqLen; ++j) {
                    float v = std::exp(attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j) - max_val);
                    attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j) = v;
                    sum_exp += v;
                }
                float inv_sum = 1.0f / sum_exp;
                for (int j = 0; j < seqLen; ++j) {
                    int idx = h*seqLen*seqLen + i*seqLen + j;
                    attnScores.get<float>(idx) *= inv_sum;
                }
            }
            // weighted sum -> attnOut slice
            for (int i = 0; i < seqLen; ++i) {
                for (int d = 0; d < headDim; ++d) {
                    float sum = 0;
                    for (int j = 0; j < seqLen; ++j) {
                        float score = attnScores.get<float>(h*seqLen*seqLen + i*seqLen + j);
                        int v_idx = j * (3*dim) + (2 * dim) + (h * headDim) + d;
                        sum += score * qkvOut.get<float>(v_idx);
                    }
                    attnOut.get<float>(i*dim + h*headDim + d) = sum; // writes only its head slice
                }
            }
        };

        std::vector<std::thread> threads;
        threads.reserve(numHeads);
        Timer t_attn("tb_attn_softmax");
        if (doTiming) t_attn.start();
        for (int h = 0; h < numHeads; ++h) threads.emplace_back(workHead, h);
        for (auto& t : threads) t.join();
        if (doTiming) t_attn.stop();

        // Projection + residual, MLP, final residual (same as naive)
        Timer t_proj("tb_proj_residual");
        if (doTiming) t_proj.start();
        runLinear(attnOut, norm1Out, projWeights, projBias, seqLen, dim, dim);
        for (int i = 0; i < seqLen*dim; ++i) attnOut.get<float>(i) = dataIn.get<float>(i) + norm1Out.get<float>(i);
        if (doTiming) t_proj.stop();

        Timer t_mlp("tb_mlp");
        if (doTiming) t_mlp.start();
        runLayerNorm(attnOut, norm2Out, norm2Weights, norm2Bias, seqLen, dim);
        runLinear(norm2Out, mlpHidden, fc1Weights, fc1Bias, seqLen, dim, hiddenDim);
        runGELU(mlpHidden, seqLen * hiddenDim);
        runLinear(mlpHidden, mlpOut, fc2Weights, fc2Bias, seqLen, hiddenDim, dim);
        if (doTiming) t_mlp.stop();

        for (int i = 0; i < seqLen*dim; ++i) getOutputData().get<float>(i) = attnOut.get<float>(i) + mlpOut.get<float>(i);
    }
#else
    // Fallback when std::thread is unavailable on Zedboard builds.
    void TransformerBlockLayer::computeThreaded(const LayerData& dataIn) const { computeNaive(dataIn); }
#endif


    // Placeholders / alt paths
    void TransformerBlockLayer::computeAccelerated(const LayerData& dataIn) const { computeNaive(dataIn); }

    // Cache-friendly single-thread path that streams attention rows (no full score matrix).
    void TransformerBlockLayer::computeTiled(const LayerData& dataIn) const {
        int seqLen = getInputParams().dims[0];
        int dim = getInputParams().dims[1];
        int headDim = dim / numHeads;
        int hiddenDim = dim * 2;
        float scale = 1.0f / std::sqrt((float)headDim);

        const bool doTiming = Config::ENABLE_LAYER_TIMING;
        const bool useStreaming = Config::ENABLE_STREAMING_ATTENTION;
        if (!useStreaming) {
            computeNaive(dataIn);
            return;
        }

        Timer t_norm_qkv("tb_norm_qkv_tiled");
        if (doTiming) t_norm_qkv.start();
        // Norm1 and QKV
        runLayerNorm(dataIn, norm1Out, norm1Weights, norm1Bias, seqLen, dim);
        runLinear(norm1Out, qkvOut, qkvWeights, qkvBias, seqLen, dim, 3*dim);
        if (doTiming) t_norm_qkv.stop();

        Timer t_attn("tb_attn_softmax_tiled");
        if (doTiming) t_attn.start();
        for (int h = 0; h < numHeads; ++h) {
            runAttentionHeadStreaming(qkvOut, attnOut, h, seqLen, dim, headDim, scale);
        }
        if (doTiming) t_attn.stop();

        Timer t_proj("tb_proj_residual_tiled");
        if (doTiming) t_proj.start();
        runLinear(attnOut, norm1Out, projWeights, projBias, seqLen, dim, dim);
        for (int i = 0; i < seqLen*dim; ++i) attnOut.get<float>(i) = dataIn.get<float>(i) + norm1Out.get<float>(i);
        if (doTiming) t_proj.stop();

        Timer t_mlp("tb_mlp_tiled");
        if (doTiming) t_mlp.start();
        runLayerNorm(attnOut, norm2Out, norm2Weights, norm2Bias, seqLen, dim);
        runLinear(norm2Out, mlpHidden, fc1Weights, fc1Bias, seqLen, dim, hiddenDim);
        runGELU(mlpHidden, seqLen * hiddenDim);
        runLinear(mlpHidden, mlpOut, fc2Weights, fc2Bias, seqLen, hiddenDim, dim);
        if (doTiming) t_mlp.stop();

        for (int i = 0; i < seqLen*dim; ++i) getOutputData().get<float>(i) = attnOut.get<float>(i) + mlpOut.get<float>(i);
    }

    void TransformerBlockLayer::computeSIMD(const LayerData& dataIn) const { computeNaive(dataIn); }
    void TransformerBlockLayer::computeQuantized(const LayerData& dataIn) const { computeNaive(dataIn); }

}
