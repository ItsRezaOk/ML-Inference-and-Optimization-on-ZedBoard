import numpy as np
import os

# --- Configuration ---
FILE_EXPECTED = "layer_11_output.bin"
FILE_GIVEN = "softmax_output.bin"
DATA_TYPE = np.float32
# ---------------------

def calculate_cosine_similarity(vec_a, vec_b):
    """Calculates the cosine similarity between two vectors."""
    # Convert to a larger type (float64) for stable math
    vec_a_f64 = vec_a.astype(np.float64)
    vec_b_f64 = vec_b.astype(np.float64)

    dot_product = np.dot(vec_a_f64, vec_b_f64)
    
    norm_a = np.linalg.norm(vec_a_f64)
    norm_b = np.linalg.norm(vec_b_f64)
    
    if norm_a == 0 or norm_b == 0:
        print("Warning: Cannot calculate cosine similarity, one or both vectors are zero.")
        return 0.0
        
    return dot_product / (norm_a * norm_b)

def compare_files(file_a, file_b, dtype):
    """Loads and compares two binary files as the specified data type."""
    
    # --- 1. Load Data ---
    print(f"Loading expected file: {file_a}")
    if not os.path.exists(file_a):
        print(f"Error: File not found: {file_a}")
        return
    data_a = np.fromfile(file_a, dtype=dtype)
    
    print(f"Loading given file: {file_b}")
    if not os.path.exists(file_b):
        print(f"Error: File not found: {file_b}")
        return
    data_b = np.fromfile(file_b, dtype=dtype)

    # --- 2. Check Size ---
    print(f"\n--- Size Check ---")
    print(f"Expected elements: {data_a.size}")
    print(f"Given elements:    {data_b.size}")
    
    if data_a.size != data_b.size:
        print("Error: Files are different sizes. Comparing the smaller, overlapping portion.")
        min_len = min(data_a.size, data_b.size)
        data_a = data_a[:min_len]
        data_b = data_b[:min_len]
    
    if data_a.size == 0:
        print("Error: Files are empty.")
        return

    #data_a.sort()
    #data_b.sort()

    # print 10 elements from each for sanity check
    print("\n--- Sample Data ---")
    print("Expected (first 10):", data_a[:10])
    print("Given (first 10):   ", data_b[:10])
    # print("Expected (last 10): ", data_a[-10:])
    # print("Given (last 10):    ", data_b[-10:])

    # --- 3. Check for Exact Match ---
    print("\n--- Comparison ---")
    if np.array_equal(data_a, data_b):
        print("✅ Success: Files are identical!")
        return

    print("❌ Failure: Files are NOT identical.")

    # --- 4. Calculate Statistics (if not identical) ---
    print("\n--- Statistics ---")
    
    # Cosine Similarity
    cos_sim = calculate_cosine_similarity(data_a, data_b)
    print(f"Cosine Similarity: {cos_sim:.6f}")
    
    # Error Metrics
    # Convert to larger int type for subtraction to avoid overflow
    diff = data_a.astype(np.int32) - data_b.astype(np.int32)
    abs_error = np.abs(diff)
    num_diffs = np.count_nonzero(diff)
    
    print(f"Differing elements: {num_diffs} / {data_a.size} ({100.0 * num_diffs / data_a.size:.2f}%)")
    print(f"Mean Absolute Error (MAE): {np.mean(abs_error):.4f}")
    print(f"Max Absolute Error:        {np.max(abs_error)}")

    # --- 5. Show Sample Differences ---
    print("\n--- Sample of Differences (up to 10) ---")
    print("Index | Expected | Given | Diff")
    print("---------------------------------")
    diff_indices = np.where(diff != 0)[0]
    
    for i in diff_indices[:10]:
        print(f"{i:<5} | {data_a[i]:<8} | {data_b[i]:<5} | {diff[i]:<4}")
        
    if len(diff_indices) > 4096:
        print("...and more.")

if __name__ == "__main__":
    compare_files(FILE_EXPECTED, FILE_GIVEN, DATA_TYPE)