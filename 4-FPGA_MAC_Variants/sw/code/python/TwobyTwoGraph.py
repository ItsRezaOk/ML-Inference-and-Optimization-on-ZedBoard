import numpy as np
import matplotlib.pyplot as plt
import os

#################################################################
# CONFIGURATION
#################################################################
# --- Change these values ---

# 1. Paths to the binary files you want to visualize.
file_path1 = 'img_data/layer_outputs/image_0.bin'
file_path2 = 'img_data/layer_outputs/8bit_layer_output.bin'
file_path3 = 'img_data/layer_outputs/4bit_layer_output.bin'  # Placeholder for 4-bit quantized
file_path4 = 'img_data/layer_outputs/2bit_layer_output.bin'  # Placeholder for 2-bit quantized

# 2. The data type (dtype) used to save the file.
#    (e.g., np.int8, np.int32, np.float32)
data_type = np.int8

# 3. !! CRITICAL: The original shape of the tensor. !!
#    You MUST set this correctly.
#    Examples:
#    (64, 64, 3)        # For H, W, C
#    (1, 64, 64, 3)     # For B, H, W, C
#    (32, 32)           # For H, W
data_shape = (60,60,32)  # <--- SET THIS SHAPE
image_data_shape = (64,64,3)  # Shape of the original image data

# 4. Indices of the 2D slice you want to visualize.
#    If 4D (B, H, W, C), set batch and channel.
#    If 3D (H, W, C), set channel (batch_index is ignored).
batch_index_to_plot = 0
channel_index_to_plot = 0

# 5. Titles and output filename.
plot_title1 = 'Image 1: Image data'
plot_title2 = 'Image 2: 8-bit actual'
plot_title3 = 'Image 3: 4-bit quantized'
plot_title4 = 'Image 4: 2-bit quantized'
output_filename = 'feature_maps_2x2.png'


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

    print(f"Reshaping data to {shape}.")
    return data.reshape(shape)


def plot_four_maps(map1, map2, map3, map4, title1, title2, title3, title4, out_file):
    """
    Plots four feature maps in a 2x2 grid.
    """
    fig, axes = plt.subplots(2, 2, figsize=(12, 10))

    # Plot Map 1 (special handling for possible RGB)
    if map1.ndim == 3 and map1.shape[-1] == 3:
        im1 = axes[0, 0].imshow(map1)
        axes[0, 0].set_title(title1)
        # No colorbar for RGB
    else:
        vmin1 = map1.min()
        vmax1 = map1.max()
        im1 = axes[0, 0].imshow(map1, cmap='viridis', vmin=vmin1, vmax=vmax1)
        axes[0, 0].set_title(title1)
        fig.colorbar(im1, ax=axes[0, 0], orientation='horizontal', pad=0.1)

    # Calculate shared min/max for maps 2, 3, 4
    vmin_acts = min(map2.min(), map3.min(), map4.min())
    vmax_acts = max(map2.max(), map3.max(), map4.max())

    # Plot Map 2
    im2 = axes[0, 1].imshow(map2, cmap='viridis', vmin=vmin_acts, vmax=vmax_acts)
    axes[0, 1].set_title(title2)
    fig.colorbar(im2, ax=axes[0, 1], orientation='horizontal', pad=0.1)

    # Plot Map 3
    im3 = axes[1, 0].imshow(map3, cmap='viridis', vmin=vmin_acts, vmax=vmax_acts)
    axes[1, 0].set_title(title3)
    fig.colorbar(im3, ax=axes[1, 0], orientation='horizontal', pad=0.1)

    # Plot Map 4
    im4 = axes[1, 1].imshow(map4, cmap='viridis', vmin=vmin_acts, vmax=vmax_acts)
    axes[1, 1].set_title(title4)
    fig.colorbar(im4, ax=axes[1, 1], orientation='horizontal', pad=0.1)

    fig.suptitle(f"Input Image and Layer Outputs [Channel {channel_index_to_plot}]", fontsize=16)
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
    data1 = read_and_reshape(file_path1, data_type, image_data_shape)
    data2 = read_and_reshape(file_path2, data_type, data_shape)
    data3 = read_and_reshape(file_path3, data_type, data_shape)
    data4 = read_and_reshape(file_path4, data_type, data_shape)

    if data1 is None or data2 is None or data3 is None or data4 is None:
        print("Aborting due to errors.")
        exit()

    # 2. Extract the 2D slices to plot
    try:
        # Special handling for map1 (input image)
        if len(image_data_shape) == 3 and image_data_shape[-1] == 3:
            map1_slice = data1.astype(np.float32)
            map1_slice = (map1_slice - map1_slice.min()) / (map1_slice.max() - map1_slice.min())
            print("Extracting full RGB for input image, normalized to 0-1.")
        else:
            if len(image_data_shape) == 4:  # B, H, W, C
                map1_slice = data1[batch_index_to_plot, :, :, channel_index_to_plot]
            elif len(image_data_shape) == 3:  # H, W, C
                map1_slice = data1[:, :, channel_index_to_plot]
            elif len(image_data_shape) == 2:  # H, W
                map1_slice = data1
            elif len(image_data_shape) == 1:  # 1D
                map1_slice = data1.reshape(1, -1)
            else:
                raise ValueError(f"Unsupported shape for image: {image_data_shape}")

        # For activations (maps 2,3,4)
        if len(data_shape) == 4:  # B, H, W, C
            map2_slice = data2[batch_index_to_plot, :, :, channel_index_to_plot]
            map3_slice = data3[batch_index_to_plot, :, :, channel_index_to_plot]
            map4_slice = data4[batch_index_to_plot, :, :, channel_index_to_plot]
            print(f"Extracting 4D slice: [Batch {batch_index_to_plot}, :, :, Channel {channel_index_to_plot}]")
        
        elif len(data_shape) == 3:  # H, W, C
            map2_slice = data2[:, :, channel_index_to_plot]
            map3_slice = data3[:, :, channel_index_to_plot]
            map4_slice = data4[:, :, channel_index_to_plot]
            print(f"Extracting 3D slice: [:, :, Channel {channel_index_to_plot}]")

        elif len(data_shape) == 2:  # H, W
            map2_slice = data2
            map3_slice = data3
            map4_slice = data4
            print("Extracting 2D slice (full array).")
        
        elif len(data_shape) == 1:  # 1D vector, reshape to 1xN for imshow
            map2_slice = data2.reshape(1, -1)
            map3_slice = data3.reshape(1, -1)
            map4_slice = data4.reshape(1, -1)
            print("Extracting 1D slice as 1xN.")
        
        else:
            print(f"Error: Cannot plot shape {data_shape}. Must be 1D, 2D, 3D, or 4D.")
            exit()
            
    except IndexError:
        print(f"Error: Index out of bounds.")
        print(f"  Shape is {data_shape}")
        print(f"  You tried to access batch {batch_index_to_plot} and channel {channel_index_to_plot}")
        exit()

    # 3. Plot the maps
    plot_four_maps(
        map1_slice,
        map2_slice,
        map3_slice,
        map4_slice,
        plot_title1,
        plot_title2,
        plot_title3,
        plot_title4,
        output_filename
    )