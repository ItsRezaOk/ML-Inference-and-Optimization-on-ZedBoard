#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <fstream>
#include <random>
#include <string>
#include <vector>

#include "../Model.h"
#include "../Utils.h"

namespace ML {

// Runs full inference (conv=4bit, others 8bit) on K random images found in `basePath` (data folder)
// Prints per-image cosine vs 8-bit baseline and vs golden, plus summary stats.
void runConv4BitBatchSimple(const Model& model, const Path& basePath, std::size_t K, unsigned seed) {
    logInfo("--- Simple Conv4Bit Batch (K=%zu) ---", K);

    // Discover available indices (look for image_i.bin and image_i_data/layer_11_output.bin)
    const std::size_t maxIdx = 1000;
    std::vector<int> idxs;
    idxs.reserve(maxIdx);
    for (std::size_t i = 0; i < maxIdx; ++i) {
        Path imgPath = basePath / (std::string("image_") + std::to_string(i) + std::string(".bin"));
        Path goldDir = basePath / (std::string("image_") + std::to_string(i) + std::string("_data"));
        Path goldOut = goldDir / "layer_11_output.bin";
        std::ifstream a(imgPath.c_str(), std::ios::binary);
        std::ifstream b(goldOut.c_str(), std::ios::binary);
        if (a.is_open() && b.is_open()) idxs.push_back(static_cast<int>(i));
    }
    if (idxs.empty()) {
        logWarn("No images found under %s", std::string(basePath).c_str());
        return;
    }

    std::mt19937 rng(seed ? seed : static_cast<unsigned>(std::random_device{}()));
    std::shuffle(idxs.begin(), idxs.end(), rng);
    if (K > idxs.size()) K = idxs.size();

    std::vector<float> sims_4_vs_8; sims_4_vs_8.reserve(K);
    std::vector<float> sims_4_vs_gold; sims_4_vs_gold.reserve(K);

    for (std::size_t n = 0; n < K; ++n) {
        int i = idxs[n];
        Path imgPath = basePath / (std::string("image_") + std::to_string(i) + std::string(".bin"));
        Path goldDir = basePath / (std::string("image_") + std::to_string(i) + std::string("_data"));
        Path goldOut = goldDir / "layer_11_output.bin";

        LayerData img(model[0].getInputParams(), imgPath);
        img.loadData();

        // Baseline 8-bit
        const LayerData& out8_ref = model.inference(img, Layer::InfType::QUANTIZED);
        LayerData out8_copy(out8_ref); // snapshot

        // Simple conv=4bit
        const LayerData& out4 = model.inference(img, Layer::InfType::QUANTIZED);

        // Golden fp32 output
        LayerData golden(model.getOutputLayer().getOutputParams(), goldOut);
        golden.loadData();

        float cos_4_vs_8 = out4.compare<fp32>(out8_copy);
        float cos_4_vs_g = out4.compare<fp32>(golden);
        sims_4_vs_8.push_back(cos_4_vs_8);
        sims_4_vs_gold.push_back(cos_4_vs_g);

        std::cout << "idx=" << i
                  << " cos(4vs8)=" << cos_4_vs_8
                  << " cos(4vsGold)=" << cos_4_vs_g << "\n";
    }

    float m1, a1, b1, m2, a2, b2;
    {
        float s=0, mn=1e9f, mx=-1e9f; for (float x : sims_4_vs_8){ s+=x; if (x<mn) mn=x; if (x>mx) mx=x; }
        m1 = s/static_cast<float>(sims_4_vs_8.size()); a1 = mn; b1 = mx;
    }
    {
        float s=0, mn=1e9f, mx=-1e9f; for (float x : sims_4_vs_gold){ s+=x; if (x<mn) mn=x; if (x>mx) mx=x; }
        m2 = s/static_cast<float>(sims_4_vs_gold.size()); a2 = mn; b2 = mx;
    }
    std::cout << "Summary K=" << K
              << " cos(4vs8): mean=" << m1 << " min=" << a1 << " max=" << b1
              << " cos(4vsGold): mean=" << m2 << " min=" << a2 << " max=" << b2
              << "\n";
}

} // namespace ML
