import pathlib, os, sys, operator, re, datetime
from functools import reduce
import numpy as np
import tensorflow_datasets as tfds
import tensorflow as tf
from tiny_imagenet import TinyImagenetDataset
import matplotlib.pyplot as plt
from pathlib import Path


# model_path = os.path.abspath(""/home/<NETID>/path/to/your/lab1/CNN_TinyImageNet.h5)" # Uncomment this to use a non-relative path
model_path = os.path.abspath("CNN_TinyImageNet.h5")
model = tf.keras.models.load_model(model_path)

layer_outputs = [layer.output for layer in model.layers]
layer_inputs = [layer.input for layer in model.layers]
feature_map_model = tf.keras.Model(inputs=model.inputs, outputs=layer_outputs)

### build image datasets ###
tiny_imagenet_builder = TinyImagenetDataset()
tiny_imagenet_builder.download_and_prepare(download_dir="~/tensorflow-datasets/downloads")

ds = tiny_imagenet_builder.as_dataset()
ds_train, ds_val = ds["train"], ds["validation"]
assert(isinstance(ds_train, tf.data.Dataset))
assert(isinstance(ds_val, tf.data.Dataset))
ds_train = ds_train.prefetch(tf.data.AUTOTUNE)
ds_val = ds_val.prefetch(tf.data.AUTOTUNE)

# We need to read the "human readable" labels so we can translate with the numeric values
# Read the labels file (words.txt)
with open(os.path.abspath('wnids.txt'), 'r') as f:
    wnids = [x.strip() for x in f]

# Map wnids to integer labels
wnid_to_label = {wnid: i for i, wnid in enumerate(wnids)}
label_to_wnid = {v: k for k, v in wnid_to_label.items()}

# Use words.txt to get names for each class
with open(os.path.abspath('words.txt'), 'r') as f:
    wnid_to_words = dict(line.split('\t') for line in f)
    for wnid, words in wnid_to_words.items():
        wnid_to_words[wnid] = [w.strip() for w in words.split(',')]

class_names = [str(wnid_to_words[wnid]) for wnid in wnids]

val_data = ds_val.take(1000).batch(1)

# non quantized prediction
for batch in ds_val.batch(1000).take(1):
    all_activations = feature_map_model.predict(tf.cast(batch["image"], tf.float32) / 255.0)
    print("FUCK")

# build validation dataset
val_imgs = []
for index, img_data in enumerate(val_data):
  val_imgs.append(img_data)


print(f"Total validation images collected: {len(val_imgs)}")


##########################################
# Helper Functions
##########################################

# Change this for different quantization ranges
# int8 is -128 to 127
maxInt = 127
minInt = -128

def plot_histogram(data, title, filename, save_dir, bins=100, data_range=None):
    """Plots and saves a histogram of the given data."""
    plt.figure(figsize=(10, 6))
    flat_data = data.flatten()
    
    # Determine range automatically if not provided, but use (minInt, maxInt) for int8
    if data_range is None:
        if flat_data.dtype == np.int8:
            data_range = (minInt, maxInt)
        else:
            data_min, data_max = np.min(flat_data), np.max(flat_data)
            data_range = (data_min, data_max)
            # If min/max are too close, give a small buffer
            if data_range[0] == data_range[1]:
                    data_range = (data_range[0] - 1, data_range[1] + 1)

    plt.hist(flat_data, bins=bins, range=data_range)
    plt.title(title)
    plt.xlabel("Quantized Value")
    plt.ylabel("Frequency")
    plt.grid(True)
    full_path = os.path.join(save_dir, filename + ".png")
    plt.savefig(full_path)
    plt.close() # Close the figure to save memory
    print(f"Saved plot: {full_path}")

###########################################
# Getters for Quantization Parameters #
############################################

def get_average(flat_input):
    """ Get the average value of the input """
    sum = 0
    for input in flat_input:
        sum += input
    average = sum / len(flat_input)
    return average

def get_max_difference(flat_input, average):
    """ Get the maximum absolute difference from the average value """
    max_diff = 0.0
    for input in flat_input:
        diff = abs(input - average)
        if diff > max_diff:
            max_diff = diff
    return max_diff

def get_max_weight(weights):
    """ Get the maximum absolute weight value """
    max_weight = 0
    flat_weights = weights.flatten()
    for weight in flat_weights:
        abs_weight = abs(weight)
        if abs_weight > max_weight:
            max_weight = abs_weight
    return max_weight

def get_input_zero_point(scale, avgIx):
    """ Get the input zero point """
    zp = -1 * round(scale * (avgIx))
    return zp

def get_input_scale(maxIx):
    """ Get the input scale """
    scale = maxInt / maxIx
    return scale

def get_weight_scale(maxIw):
    """ Get the weight scale """
    scale = maxInt / maxIw
    return scale

def get_bias_scale(scale_input, scale_weight):
    """ Get the bias scale """
    scale_bias = scale_input * scale_weight
    return scale_bias

##########################################
# Computational Functions #
##########################################

def quantize_inputs(inputs, scale, zero_point):
    """ Quantize the input activations """
    quantized = np.round(inputs * scale) + zero_point
    quantized = np.clip(quantized, minInt, maxInt).astype(np.int8)
    return quantized

def quantize_weights(weights, scale):
    """ Quantize the weights """
    quantized = np.round(weights * scale)
    quantized = np.clip(quantized, minInt, maxInt).astype(np.int8) # SHOULD NEVER EXCEED ANYWAYS
    return quantized

def compute_wi_zp_sum(weights, zero_point):
    """ Compute the sum of weights times input zero point """
    sum = 0
    flat_weights = weights.flatten()
    for weight in flat_weights:
        sum += weight * (zero_point)
    return sum

def quantize_biases(biases, scale_bias, zero_point_sum):
    """ Quantize the biases """
    quantized = np.round(biases * scale_bias) - zero_point_sum # Compute Sum wi * zp_i ahead of time!
    quantized = np.clip(quantized, -2147483648, 2147483647).astype(np.int32)  # int32 range, TODO change if not int8
    return quantized


#########################################
# Save Values to binary files #
#########################################

def output_to_bin(filename, path, flattened_data):
    """ Save the flattened data to a binary file """
    full_path = os.path.join(img_dir, path)
    full_path = os.path.join(full_path, filename + ".bin")
    flattened_data.tofile(full_path)
    #print(f"Saved {filename} to {full_path}")
    return


#########################################
# Quantize Images and Save to Binary Files #
#########################################

img_dir = os.path.abspath('img_data')
pathlib.Path(img_dir).mkdir(exist_ok=True)
plot_dir = os.path.abspath('plots')
pathlib.Path(plot_dir).mkdir(exist_ok=True) 

for subdir in ['quant_val', 'quant_weights', 'layer_outputs']:
    subdir_path = os.path.join(img_dir, subdir)
    if not os.path.exists(subdir_path):
        Path(subdir_path).mkdir()

# Note: compare quantized outputs to non-quantized outputs for validation

############################################
# Do image inputs #
###########################################

activation_scales = []
zero_points = []
weight_scales = []

#weight_scales.append(1.0) # Input layer has no weights

flat_images = []
for i, img_data in enumerate(val_imgs):
    img = tf.cast(img_data['image'], tf.float32) / 255.0  # Normalize to [0, 1]
    img = img[0]
    #print(f"Processing image {i} with shape {img.shape}")
    #img = img.numpy().transpose(2,0,1)  # Change to CHW for easier flattening
    flat_img = img.numpy().flatten()
    #print(f"Processing image {i} with shape {img.shape}")
    flat_images.append(flat_img)

flat_flat_images = np.concatenate(flat_images)

image_average = get_average(flat_flat_images)

image_max_diff = get_max_difference(flat_flat_images, image_average)

activation_scales.append(get_input_scale(image_max_diff))

zero_points.append(get_input_zero_point(activation_scales[0], image_average))

print(f"Image Quantization Parameters: scale {activation_scales[0]}, zero_point {zero_points[0]}")
print(f"Image average {image_average}, max_difference {image_max_diff}")
print(f"All Activations Len: {len(all_activations)}")

# Quantize and save images
quantized_images = []

for i, image in enumerate(flat_images):
    quantized_image = quantize_inputs(image, activation_scales[0], zero_points[0])
    quantized_images.append(quantized_image)
    output_to_bin(f"image_{i}", "quant_val", quantized_image)

# # print one non-quantized image as a grid/image
# plt.imshow(flat_images[0].reshape(64, 64, 3), cmap='gray')
# plt.title("Non-Quantized Image 0")
# plt.show()

# #print one quantized image as a grid/image, dequantize first
# dequantized_image = (quantized_images[0].astype(np.float32) - zero_points[0]) / activation_scales[0]
# plt.imshow(dequantized_image.reshape(64, 64, 3), cmap='gray')
# plt.title("Quantized Image 0")
# plt.show()


##########################################
# Layer by Layer quantization #
##########################################

for i, layer_name in enumerate([layer.name for layer in model.layers]):
    print(f"Processing layer {i}: {layer_name} with activation shape {all_activations[i].shape}")
    layer = model.get_layer(layer_name)
    layer_activation = all_activations[i]
    first_image_activation = layer_activation[0]
    #print(f"First image activation shape: {first_image_activation.shape}")
    #layer_activation = layer_activation.transpose(0,3,1,2)  # Change to NCHW for easier flattening if needed
    #first_image_activation = first_image_activation.transpose(2,0,1)  # Change to CHW for easier flattening if needed
    #print(f"First image activation shape after transpose: {first_image_activation.shape}")


    if 'conv' in layer_name or 'dense' in layer_name:
        # Input quantization parameters (from previous layer's output)
        input_scale = activation_scales[-1]
        input_zp = zero_points[-1]
        #input_weight_scale = weight_scales[-1]

        # 3. get weights and bias parameters
        weights = layer.get_weights()[0]  # Get weights
        max_weight = get_max_weight(weights)
        weight_scale = get_weight_scale(max_weight)
        weight_scales.append(weight_scale)
        quantized_weights = quantize_weights(weights, weight_scale)

        wi_zp_sum = compute_wi_zp_sum(quantized_weights, input_zp)
        wi_zp_sum = 0

        biases = layer.get_weights()[1] if len(layer.get_weights()) > 1 else np.zeros(layer.output_shape[-1])
        print(f"debug: Layer {layer_name} input_scale {input_scale}, input_zp {input_zp}, weight_scale {weight_scale}, wi_zp_sum {wi_zp_sum}, average quantized weight {get_average(quantized_weights.flatten())}, max weight {max_weight}")
        bias_scale = get_bias_scale(input_scale, weight_scale)
        quantized_biases = quantize_biases(biases, bias_scale, wi_zp_sum)
        
        # <--- ADDED VISUALIZATION FOR WEIGHTS --->
        plot_histogram(quantized_weights,
                       f"Distribution of Quantized Weights - {layer_name}",
                       f"{layer_name}_weights_dist",
                       plot_dir,
                       bins=100,
                       data_range=(minInt, maxInt))
        

        # <--- ADDED VISUALIZATION FOR BIASES --->
        plot_histogram(quantized_biases,
                       f"Distribution of Quantized Biases - {layer_name}",
                       f"{layer_name}_biases_dist",
                       plot_dir,
                       bins=100) # Let range be auto for int32
        
        plot_histogram(biases,
                       f"Distribution of Biases - {layer_name}",
                       f"{layer_name}_nonQuant_biases_dist",
                       plot_dir,
                       bins=100) # Let range be auto for int32


        #quantized_weights = quantized_weights.transpose(3,2,0,1)  # Change to OIHW for saving
        # Save quantized weights and biases
        output_to_bin(f"{layer_name}_weights", "quant_weights", quantized_weights.flatten())
        output_to_bin(f"{layer_name}_biases", "quant_weights", quantized_biases.flatten())
        print(f"Weight Scales {weight_scales}")
        print(f"Bias Scale {bias_scale}")
        # Now compute output quantization parameters for all layers
        flat_output = np.concatenate([layer_activation[j].flatten() for j in range(layer_activation.shape[0])])
        output_average = get_average(flat_output)
        output_max_diff = get_max_difference(flat_output, output_average)
        output_scale = get_input_scale(output_max_diff)
        output_zp = get_input_zero_point(output_scale, output_average)

        # Append the output params
        activation_scales.append(output_scale)
        zero_points.append(output_zp)



    # For max pooling and flatten, to match C++ approximation, quantize input, apply operation on int8, then use same params for output if same
    if 'pool' in layer_name or 'flatten' in layer_name:
        # Use input params for output to simulate int8 operation without requant
        output_scale = activation_scales[-1]
        output_zp = zero_points[-1]

        # Get previous activation (input to this layer)
        if i > 0:
            first_image_input = all_activations[i-1][0]
            input_shape = first_image_input.shape
            quantized_input = quantize_inputs(first_image_input, activation_scales[-1], zero_points[-1])

            if 'pool' in layer_name:
                # Implement max pooling on quantized input (assuming 2x2 pool, stride 2)
                h, w, c = input_shape
                q_input_reshaped = quantized_input.reshape(h, w, c)
                pooled_h, pooled_w = h//2, w//2
                quantized_pooled = np.zeros((pooled_h, pooled_w, c), dtype=np.int8)
                for ph in range(pooled_h):
                    for pw in range(pooled_w):
                        for pc in range(c):
                            patch = q_input_reshaped[ph*2:ph*2+2, pw*2:pw*2+2, pc]
                            quantized_pooled[ph, pw, pc] = np.max(patch)
                quantized_activation = quantized_pooled
            elif 'flatten' in layer_name:
                # Flatten doesn't change values
                quantized_activation = quantized_input.reshape(-1)

        else:
            # Should not happen
            quantized_activation = quantize_inputs(first_image_activation, output_scale, output_zp)

    else:
        # For other layers, quantize the output directly
        quantized_activation = quantize_inputs(first_image_activation, output_scale, output_zp)



    # <--- ADDED VISUALIZATION FOR ACTIVATIONS --->
    plot_histogram(quantized_activation,
                   f"Distribution of Quantized Activations (Image 0) - {layer_name}",
                   f"layer_{i}_{layer_name}_activation_dist",
                   plot_dir,
                   bins=100,
                   data_range=(minInt, maxInt))
        # <--- ADDED VISUALIZATION FOR ACTIVATIONS --->
    plot_histogram(first_image_activation,
                   f"Distribution of Pre-Quantized Activations (Image 0) - {layer_name}",
                   f"layer_{i}_{layer_name}_nonquant_activation_dist",
                   plot_dir,
                   bins=100)
    
    # Save quantized activations
    output_to_bin(f"layer_{i}_output", "layer_outputs", quantized_activation.flatten())

    # Dequantize and compare error
    original_flat = first_image_activation.flatten()
    quant_flat = quantized_activation.flatten()
    dequant_flat = (quant_flat.astype(np.float32) - output_zp) / output_scale
    mae = np.mean(np.abs(original_flat - dequant_flat))
    mse = np.mean((original_flat - dequant_flat)**2)
    max_err = np.max(np.abs(original_flat - dequant_flat))
    print(f"Layer {i} {layer_name} - MAE: {mae}, MSE: {mse}, Max Error: {max_err}")
    plot_histogram(dequant_flat,
                    f"Distribution of De-Quantized Activations (Image 0) - {layer_name}",
                    f"layer_{i}_{layer_name}_dequant_activation_dist",
                    plot_dir,
                    bins=100)

# output the final layer output to bin (non quantized!)
output_to_bin("layer_11_output", "layer_outputs", all_activations[-1][0])
print(f"Activation Scales: {activation_scales}")
print(f"Zero Points: {zero_points}")
