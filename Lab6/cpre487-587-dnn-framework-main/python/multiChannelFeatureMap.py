import numpy as np
import matplotlib.pyplot as plt
import os

#################################################################
# CONFIGURATION
#################################################################
# --- Change these values ---

# 1. Paths to the binary files you want to compare.
file_path1 = 'layer_output.bin'
file_path2 = 'layer_0_output.bin'

# 2. The data type (dtype) used to save the file.
#    (e.g., np.int8, np.int32, np.float32)
data_type = np.int8

# 3. !! CRITICAL: The original shape of the tensor. !!
#    You MUST set this correctly.
#    Examples:
#    (3, 64, 64)        # For C, H, W
#    (1, 3, 64, 64)     # For B, C, H, W
#    (32, 32)           # For H, W
data_shape = (32,60,60)  # <--- SET THIS SHAPE

# 4. Index of the batch you want to visualize (if 4D).
#    Ignored for 3D or 2D shapes.
batch_index_to_plot = 0

# 5. Titles and output filename.
plot_title1 = 'File 1: layer_output.bin'
plot_title2 = 'File 2: layer_0_output.bin'
plot_title_diff = 'Difference (File 1 - File 2)'
output_filename = 'feature_map_comparison.png'


#################################################################
# SCRIPT LOGIC (No changes needed below)
#################################################################

def read_and_reshape(bin_file, dtype, shape):
    """
    Reads a binary file and reshapes it to the specified shape.
    """
    if not os.path.exists(bin_file):
        print(f"Error: File not found at {bin_file}")
        return None

    print(f"Reading data from {bin_file} with dtype {dtype}...")
    try:
        data = np.fromfile(bin_file, dtype=dtype)
    except Exception as e:
        print(f"Error reading file: {e}")
        return None

    if data.size == 0:
        print("Error: No data read. Check file path and dtype.")
        return None

    # Sanity check: does the number of elements match the expected shape?
    expected_elements = np.prod(shape)
    if data.size != expected_elements:
        print(f"Error: Shape mismatch!")
        print(f"  File has {data.size} elements.")
        print(f"  Expected shape {shape} requires {expected_elements} elements.")
        return None

    #data.sort()
    print(f"Reshaping data to {shape}.")
    return data.reshape(shape)


def plot_comparison_maps(map1, map2, title1, title2, title_diff, out_file, is_4d=False, batch_index=0):
    """
    Plots two feature maps and their difference side-by-side.
    """
    # Calculate difference
    # Use float for subtraction to avoid int8 overflow/underflow
    diff_map = map1.astype(np.float32) - map2.astype(np.float32)

    # Find global min/max for consistent scaling of map1 and map2
    vmin = min(map1.min(), map2.min())
    vmax = max(map1.max(), map2.max())
    
    # Find max absolute difference for a symmetric colormap (centered at 0)
    diff_vabs = np.max(np.abs(diff_map))
    if diff_vabs == 0:
        diff_vabs = 1.0 # Avoid division by zero if maps are identical

    fig, axes = plt.subplots(1, 3, figsize=(18, 7))

    # Plot Map 1
    im1 = axes[0].imshow(map1, cmap='viridis', vmin=vmin, vmax=vmax)
    axes[0].set_title(title1)
    fig.colorbar(im1, ax=axes[0], orientation='horizontal', pad=0.1)

    # Plot Map 2
    im2 = axes[1].imshow(map2, cmap='viridis', vmin=vmin, vmax=vmax)
    axes[1].set_title(title2)
    fig.colorbar(im2, ax=axes[1], orientation='horizontal', pad=0.1)

    # Plot Difference Map
    # 'bwr' (Blue-White-Red) is a diverging colormap, perfect for diffs
    # Centered at 0: -vabs to +vabs
    im3 = axes[2].imshow(diff_map, cmap='bwr', vmin=-diff_vabs, vmax=diff_vabs)
    axes[2].set_title(title_diff)
    fig.colorbar(im3, ax=axes[2], orientation='horizontal', pad=0.1)

    if is_4d:
        fig.suptitle(f"Comparing Averages Across Channels [Batch {batch_index}]", fontsize=16)
    else:
        fig.suptitle(f"Comparing Averages Across Channels", fontsize=16)
    plt.tight_layout(rect=[0, 0.03, 1, 0.95])

    try:
        plt.savefig(out_file)
        print(f"Successfully saved plot to {out_file}")
    except Exception as e:
        print(f"Error saving plot: {e}")

    plt.close()


# --- Main execution ---
if __name__ == "__main__":
    # 1. Read and Reshape Data
    data1 = read_and_reshape(file_path1, data_type, data_shape)
    data2 = read_and_reshape(file_path2, data_type, data_shape)

    if data1 is None or data2 is None:
        print("Aborting due to errors.")
        exit()

    # 2. Check for overall equality
    if np.array_equal(data1, data2):
        print("\n--- Result: Arrays are IDENTICAL in value and order. ---")
    else:
        print("\n--- Result: Arrays are NOT identical. Plotting differences. ---")

    # 3. Extract the 2D average slices
    try:
        shape_len = len(data_shape)
        is_4d = shape_len == 4
        if shape_len == 4:  # B, C, H, W
            map1_slice = np.mean(data1[batch_index_to_plot], axis=0)
            map2_slice = np.mean(data2[batch_index_to_plot], axis=0)
            print(f"Computing average across channels for 4D shape: [Batch {batch_index_to_plot}] axis=0 (channels)")
        
        elif shape_len == 3:  # C, H, W
            map1_slice = np.mean(data1, axis=0)
            map2_slice = np.mean(data2, axis=0)
            print(f"Computing average across channels for 3D shape: axis=0 (channels)")

        elif shape_len == 2:  # H, W
            map1_slice = data1
            map2_slice = data2
            print("No channels to average (2D shape). Using full array.")
        
        else:
            print(f"Error: Cannot process shape {data_shape}. Must be 2D, 3D, or 4D.")
            exit()
            
    except IndexError:
        print(f"Error: Index out of bounds.")
        print(f"  Shape is {data_shape}")
        print(f"  You tried to access batch {batch_index_to_plot}")
        exit()


    # 4. Plot the comparison
    plot_comparison_maps(
        map1_slice,
        map2_slice,
        plot_title1,
        plot_title2,
        plot_title_diff,
        output_filename,
        is_4d=(len(data_shape) == 4),
        batch_index=batch_index_to_plot
    )