import numpy as np
import matplotlib.pyplot as plt
import os

#################################################################
# CONFIGURATION
#################################################################
# --- Change these values ---

# 1. Path to the binary file you want to plot.
# Example: 'img_data/quant_val/image_0.bin'
# Example: 'img_data/quant_weights/conv2d_weights.bin'
# Example: 'img_data/layer_outputs/layer_0_output.bin'
file_path = 'img_data/layer_outputs/layer_11_output.bin'
file_path2 = 'img_data/layer_outputs/softmax_output.bin'

# 2. The data type (dtype) used to save the file.
# - For quantized activations and weights: np.int8
# - For quantized biases: np.int32
# - For the final non-quantized output: np.float32
data_type = np.float32 

# 3. Title for your plot.
plot_title = 'Distribution of expected_output.bin'
plot_title2 = 'Distribution of actual_output.bin'

# 4. Filename for the saved plot image.
output_filename = 'expected_output_distribution.png'
output_filename2 = 'actual_output_distribution.png'

# 5. Number of bins for the histogram.
num_bins = 100

#################################################################
# SCRIPT LOGIC (No changes needed below)
#################################################################

def read_and_plot_distribution(bin_file, dtype, title, out_file, bins):
    """
    Reads a binary file and plots its data distribution as a histogram.
    """
    # Check if the file exists
    if not os.path.exists(bin_file):
        print(f"Error: File not found at {bin_file}")
        return

    print(f"Reading data from {bin_file} with dtype {dtype}...")
    
    # Read the binary file into a numpy array
    try:
        data = np.fromfile(bin_file, dtype=dtype)
    except Exception as e:
        print(f"Error reading file: {e}")
        return

    if data.size == 0:
        print("Error: No data was read from the file. Check file path and dtype.")
        return

    print(f"Data loaded successfully. {data.size} elements found.")
    print(f"Min: {data.min()}, Max: {data.max()}, Mean: {data.mean():.4f}, Std: {data.std():.4f}")

    # Create the plot
    plt.figure(figsize=(10, 6))
    
    # Determine plot range automatically, but for int8, fix to the expected range
    data_range = None
    if dtype == np.int8:
        data_range = (-128, 127)
    else:
        data_range = (data.min(), data.max())

    plt.hist(data, bins=bins, range=data_range, edgecolor='black')
    
    plt.title(title, fontsize=16)
    plt.xlabel("Value", fontsize=12)
    plt.ylabel("Frequency", fontsize=12)
    plt.grid(True)
    
    # Set x-axis limits for int8 to show the full potential range
    if dtype == np.int8:
        plt.xlim(-128, 127)
    elif dtype == np.float32:
        plt.xlim(0.0, 1.0)
    else:
        plt.xlim(data.min(), data.max())

    # Save the plot to a file
    try:
        plt.savefig(out_file)
        print(f"Successfully saved plot to {out_file}")
    except Exception as e:
        print(f"Error saving plot: {e}")

    # Close the plot figure to free up memory
    plt.close()

# --- Main execution ---
if __name__ == "__main__":
    read_and_plot_distribution(
        bin_file=file_path,
        dtype=np.float32,
        title=plot_title,
        out_file=output_filename,
        bins=num_bins
    )
    read_and_plot_distribution(
        bin_file=file_path2,
        dtype=np.float32,
        title=plot_title2,
        out_file=output_filename2,
        bins=num_bins
    )