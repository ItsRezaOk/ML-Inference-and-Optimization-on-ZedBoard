#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <fstream> 

#include "Config.h"
#include "Model.h"
#include "Types.h"
#include "Utils.h"
#include "layers/Dense.h"
#include "layers/Layer.h"
#include "layers/Softmax.h"

// --- NEW INCLUDES FOR ViT ---
#include "layers/PatchEmbed.h"
#include "layers/LayerNorm.h"
#include "layers/TransformerBlock.h"
#include "layers/TokenExtract.h"

#ifdef ZEDBOARD
#include <file_transfer/file_transfer.h>
#endif

namespace ML {

// Helper to easily create string paths
// e.g. "blocks_0_norm1_weight.bin"
std::string getBlockFileName(int blockIdx, const std::string& layerName, const std::string& type) {
    std::stringstream ss;
    ss << "blocks_" << blockIdx << "_" << layerName << "_" << type << ".bin";
    return ss.str();
}

// Build our Nano-ViT Model
Model buildToyModel(const Path modelPath) {
    Model model;
    logInfo("--- Building Nano-ViT Model ---\n");

    // --- ViT Configuration ---
    // Matches the Python training script
    const int img_size = 64;
    const int patch_size = 8;
    const int embed_dim = 96;
    const int num_heads = 4;
    const int depth = 8;
    const int num_classes = 200;
    const int mlp_ratio = 2;
    const int hidden_dim = embed_dim * mlp_ratio; // 192
    
    // Calculated Seq Len: (64/8 * 64/8) + 1 CLS token = 65
    const int num_patches = (img_size / patch_size) * (img_size / patch_size);
    const int seq_len = num_patches + 1;

    // ------------------------------------------------------------------------
    // 1. Patch Embedding Layer
    // Input: 64x64x3 Image
    // Output: 65x96 Sequence
    // ------------------------------------------------------------------------
    logInfo("Creating PatchEmbed Layer...");
    
    LayerParams pe_in(sizeof(fp32), {img_size, img_size, 3});
    LayerParams pe_out(sizeof(fp32), {seq_len, embed_dim});
    
    // PatchEmbed needs 4 weight files: Proj Weight, Proj Bias, CLS Token, Pos Embed
    LayerParams pe_proj_w(sizeof(fp32), {embed_dim, 3, patch_size, patch_size}, modelPath / "patch_embed_proj_weight.bin");
    LayerParams pe_proj_b(sizeof(fp32), {embed_dim}, modelPath / "patch_embed_proj_bias.bin");
    LayerParams pe_cls(sizeof(fp32), {1, 1, embed_dim}, modelPath / "cls_token.bin");
    LayerParams pe_pos(sizeof(fp32), {1, seq_len, embed_dim}, modelPath / "pos_embed.bin");

    //model.addLayer<PatchEmbedLayer>(pe_in, pe_out, pe_proj_w, pe_proj_b, pe_cls, pe_pos);
    model.addLayer<PatchEmbedLayer>(pe_in, pe_out, pe_proj_w, pe_proj_b, pe_cls, pe_pos);
    //model.addLayer<PatchEmbedLayer>(*patchEmbedLayer);


    // ------------------------------------------------------------------------
    // 2. Transformer Encoder Blocks (x8)
    // Input: 65x96
    // Output: 65x96
    // ------------------------------------------------------------------------
    LayerParams block_io(sizeof(fp32), {seq_len, embed_dim});

    for(int i = 0; i < depth; i++) {
        logInfo("Creating Transformer Block " + std::to_string(i) + "...");

        // Define params for all sub-layers inside the block
        // Norm 1
        LayerParams norm1_w(sizeof(fp32), {embed_dim}, modelPath / getBlockFileName(i, "norm1", "weight"));
        LayerParams norm1_b(sizeof(fp32), {embed_dim}, modelPath / getBlockFileName(i, "norm1", "bias"));

        // Attention QKV (Combined in PyTorch) -> Shape: {288, 96} (3 * 96)
        LayerParams qkv_w(sizeof(fp32), {3 * embed_dim, embed_dim}, modelPath / getBlockFileName(i, "attn_qkv", "weight"));
        LayerParams qkv_b(sizeof(fp32), {3 * embed_dim}, modelPath / getBlockFileName(i, "attn_qkv", "bias"));

        // Attention Proj
        LayerParams proj_w(sizeof(fp32), {embed_dim, embed_dim}, modelPath / getBlockFileName(i, "attn_proj", "weight"));
        LayerParams proj_b(sizeof(fp32), {embed_dim}, modelPath / getBlockFileName(i, "attn_proj", "bias"));

        // Norm 2
        LayerParams norm2_w(sizeof(fp32), {embed_dim}, modelPath / getBlockFileName(i, "norm2", "weight"));
        LayerParams norm2_b(sizeof(fp32), {embed_dim}, modelPath / getBlockFileName(i, "norm2", "bias"));

        // MLP FC1 (Expand) -> Shape: {192, 96}
        LayerParams fc1_w(sizeof(fp32), {hidden_dim, embed_dim}, modelPath / getBlockFileName(i, "mlp_fc1", "weight"));
        LayerParams fc1_b(sizeof(fp32), {hidden_dim}, modelPath / getBlockFileName(i, "mlp_fc1", "bias"));

        // MLP FC2 (Contract) -> Shape: {96, 192}
        LayerParams fc2_w(sizeof(fp32), {embed_dim, hidden_dim}, modelPath / getBlockFileName(i, "mlp_fc2", "weight"));
        LayerParams fc2_b(sizeof(fp32), {embed_dim}, modelPath / getBlockFileName(i, "mlp_fc2", "bias"));

        // Add the Block
        model.addLayer<TransformerBlockLayer>(
            block_io, block_io, // Input/Output shapes are same
            norm1_w, norm1_b,
            qkv_w, qkv_b,
            proj_w, proj_b,
            norm2_w, norm2_b,
            fc1_w, fc1_b,
            fc2_w, fc2_b,
            num_heads // Pass num_heads as config
        );
    }


    // ------------------------------------------------------------------------
    // 3. Final Normalization
    // Input: 65x96 -> Output: 65x96
    // ------------------------------------------------------------------------
    logInfo("Creating Final Norm Layer...");
    LayerParams norm_w(sizeof(fp32), {embed_dim}, modelPath / "norm_weight.bin");
    LayerParams norm_b(sizeof(fp32), {embed_dim}, modelPath / "norm_bias.bin");
    
    model.addLayer<LayerNormLayer>(block_io, block_io, norm_w, norm_b);


    // ------------------------------------------------------------------------
    // 4. Token Extraction (Flatten / CLS)
    // Extract index 0 only.
    // Input: 65x96 -> Output: 1x96 (effectively flat 96)
    // ------------------------------------------------------------------------
    logInfo("Creating Token Extract Layer...");
    LayerParams extract_out(sizeof(fp32), {1, embed_dim});
    
    model.addLayer<TokenExtractLayer>(block_io, extract_out);


    // ------------------------------------------------------------------------
    // 5. Classification Head (Dense)
    // Input: 1x96 -> Output: 1x200
    // ------------------------------------------------------------------------
    logInfo("Creating Head Layer...");
    LayerParams head_out(sizeof(fp32), {1, num_classes});
    LayerParams head_w(sizeof(fp32), {num_classes, embed_dim}, modelPath / "head_weight.bin");
    LayerParams head_b(sizeof(fp32), {num_classes}, modelPath / "head_bias.bin");

    model.addLayer<DenseLayer>(extract_out, head_out, head_w, head_b, false);


    // ------------------------------------------------------------------------
    // 6. Softmax
    // Input: 1x200 -> Output: 1x200
    // ------------------------------------------------------------------------
    logInfo("Creating Softmax Layer...");
    model.addLayer<SoftmaxLayer>(head_out, head_out);

    return model;
}

void runInferenceTest(const Model& model, const Path& basePath) {
    // Load an image
    logInfo("--- Running Inference Test ---");

    // Construct a LayerData object from a LayerParams one
    LayerData img(model[0].getInputParams(), basePath / "image_0.bin");
    img.loadData();
    logInfo("Input data loaded.");
    Timer timer("Full Inference");

    // Run inference on the model
    timer.start();
    const LayerData& output = model.inference(img, Layer::InfType::COMPUTEACCELERATED);
    timer.stop();

    // Compare the output
    // Construct a LayerData object from a LayerParams one
    LayerData expected(model.getOutputLayer().getOutputParams(), basePath / "image_0_data" / "layer_12_output.bin");
    expected.loadData();
    output.compareWithinPrint<fp32>(expected);
}
// -------------------------------------------------------------------------
// Layer Test: Runs a specific layer in isolation using recorded intermediate data
// -------------------------------------------------------------------------
void runLayerTest(int layerIdx, const Model& model, const Path& basePath) {
    const Layer* layer = &model.getLayer(layerIdx);
    
    std::cout << "\n============================================\n";
    std::cout << " Testing Layer " << layerIdx << "\n";
    std::cout << "============================================\n";

    // Logic: Layer 0 uses image_0.bin. Layer N uses layer_(N-1)_output.bin
    Path inputPath = (layerIdx == 0) 
        ? basePath / "image_0.bin" 
        : basePath / "image_0_data" / ("layer_" + std::to_string(layerIdx - 1) + "_output.bin");

    std::cout << "  Input File: " << inputPath << "\n";

    // 2. Load Input Data
    LayerData inputData(layer->getInputParams(), inputPath);
    try {
        inputData.allocData();
        inputData.loadData();
    } catch (const std::exception& e) {
        std::cerr << "  [FAIL] Could not load input: " << e.what() << "\n";
        return;
    }

    // 3. Run Inference (Naive)
    std::cout << "  Running Compute...\n";
    layer->computeAccelerated(inputData);

    // 4. Load Expected Output
    Path outputPath = basePath / "image_0_data" / ("layer_" + std::to_string(layerIdx) + "_output.bin");
    
    std::cout << "  Expect File: " << outputPath << "\n";

    LayerData expectedData(layer->getOutputParams(), outputPath);
    try {
        expectedData.allocData();
        expectedData.loadData();
    } catch (const std::exception& e) {
        std::cerr << "  [SKIP] Could not load expectation file. (End of trace?)\n";
        return;
    }

    // 5. Compare
    float epsilon = 0.001f; 
    bool pass = layer->getOutputData().compareWithinPrint<float>(expectedData, epsilon);

    if (pass) {
        std::cout << "  [SUCCESS] Layer " << layerIdx << " Matches Python!\n";
    } else {
        std::cout << "  [FAILURE] Layer " << layerIdx << " Mismatch.\n";
    }
}

// -------------------------------------------------------------------------
// Bulk Inference Test: Reads 1000 images, runs model, saves outputs
// -------------------------------------------------------------------------
void runRecordedTest(const Model& model, const Path& basePath) {
        // Load an image
    logInfo("--- Running Inference Test ---");
    for(int i = 0; i < 1000; i++) {
        std::string img_num = std::to_string(i);

        // Construct a LayerData object from a LayerParams one
        LayerData img(model[0].getInputParams(), basePath / "image_inputs"/ ("image_" + img_num + ".bin"));
        img.loadData();

        Timer timer("Full Inference");

        // Run inference on the model
        timer.start();
        LayerData output = model.inference(img, Layer::InfType::NAIVE);
        timer.stop();

        // Manually save to binary file
        std::string filename = basePath / "inference_outputs" /("inference_" + img_num + ".bin");
        std::ofstream outFile(filename, std::ios::binary);
        if (!outFile) {
            std::cerr << "Error opening " << filename << std::endl;
            continue;
        }
        const size_t totalBytes = output.getParams().byte_size();
        outFile.write(static_cast<const char*>(output.raw()), totalBytes);
        outFile.close();
    }
}

void runTests() {
    Path basePath("data");
    // Build the model and allocate the buffers
    Model model = buildToyModel(basePath / "model");
    model.allocLayers();

    // Run Layer-by-Layer Tests
    
    // Example: Test PatchEmbed (Layer 0)
    // runLayerTest(0, model, basePath); 

    runLayerTest(0, model, basePath);

    // Layers 1-8: Transformer Blocks
    for(int i=1; i<=8; i++) {
        runLayerTest(i, model, basePath);
    }

    // Layer 9: Final Norm
    runLayerTest(9, model, basePath);

    // Layer 10: Token Extract
    runLayerTest(10, model, basePath);

    // Layer 11: Head (Dense)
    runLayerTest(11, model, basePath);

    // Layer 12: Softmax
    runLayerTest(12, model, basePath);

    // Run Full Inference Test
    runInferenceTest(model, basePath);

    // Run 1000 Images and record outputs
    //runRecordedTest(model, basePath);

    // Clean up
    model.freeLayers();
    std::cout << "\n\n----- ML::runTests() COMPLETE -----\n";
}

} // namespace ML

#ifdef ZEDBOARD
extern "C"
int main() {
    try {
        static FATFS fatfs;
        if (f_mount(&fatfs, "/", 1) != FR_OK) {
            throw std::runtime_error("Failed to mount SD card. Is it plugged in?");
        }
        
        ML::runTests();
    } catch (const std::exception& e) {
        std::cerr << "\n\n----- EXCEPTION THROWN -----\n" << e.what() << '\n';
    }
    return 0;
}
#else
int main() {
    ML::runTests();
}
#endif