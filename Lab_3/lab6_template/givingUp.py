import pathlib
import os
import numpy as np
import tensorflow as tf
from tiny_imagenet import TinyImagenetDataset

# Fix CUDA-related warnings (optional, if using GPU)
os.environ['TF_ENABLE_ONEDNN_OPTS'] = '0'  # Disable oneDNN optimizations
os.environ['CUDA_VISIBLE_DEVICES'] = ''    # Force CPU usage to avoid CUDA errors

# Load the original model
model_path = os.path.abspath("CNN_TinyImageNet.h5")
try:
    model = tf.keras.models.load_model(model_path)
    print("Model loaded successfully.")
except Exception as e:
    print(f"Error loading model: {e}")
    exit(1)

# Print model summary to confirm layers
print("Model Summary:")
model.summary()

# Ensure fixed input shape (based on model summary: 64x64x3 assumed for Tiny ImageNet)
input_shape = (1, 64, 64, 3)  # Batch, Height, Width, Channels
model = tf.keras.Sequential(model.layers, input_shape=input_shape[1:])

# Prepare representative dataset
tiny_imagenet_builder = TinyImagenetDataset()
try:
    tiny_imagenet_builder.download_and_prepare(download_dir="~/tensorflow-datasets/downloads")
    ds = tiny_imagenet_builder.as_dataset()
    ds_train = ds["train"].shuffle(1000).batch(1)
except Exception as e:
    print(f"Error preparing dataset: {e}")
    exit(1)

def representative_dataset():
    for data in ds_train.take(100):
        image = tf.cast(data['image'], tf.float32) / 255.0  # Normalize to [0,1]
        image = tf.image.resize(image, [64, 64])  # Ensure correct input size
        yield [image]

# Configure TFLite converter for int8 quantization
converter = tf.lite.TFLiteConverter.from_keras_model(model)
converter.optimizations = [tf.lite.Optimize.DEFAULT]
converter.representative_dataset = representative_dataset
converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS_INT8]
converter.inference_input_type = tf.int8
converter.inference_output_type = tf.int8
converter.experimental_new_converter = True
converter.experimental_new_quantizer = True

# Try int8 conversion
try:
    tflite_model = converter.convert()
    print("Int8 quantization succeeded.")
except Exception as e:
    print(f"Int8 conversion error: {e}")
    # Fallback to float16 quantization to debug
    print("Attempting float16 quantization to isolate issue...")
    converter_float16 = tf.lite.TFLiteConverter.from_keras_model(model)
    converter_float16.optimizations = [tf.lite.Optimize.DEFAULT]
    converter_float16.target_spec.supported_types = [tf.float16]
    try:
        tflite_float16_model = converter_float16.convert()
        print("Float16 conversion succeeded. Issue is specific to int8 quantization.")
        with open("CNN_TinyImageNet_float16.tflite", 'wb') as f:
            f.write(tflite_float16_model)
        print("Saved float16 model to CNN_TinyImageNet_float16.tflite")
    except Exception as e_float16:
        print(f"Float16 conversion failed: {e_float16}")
        print("Model may contain unsupported ops. Check TFLite compatibility.")
    exit(1)

# Save the quantized model
quantized_model_path = os.path.abspath("CNN_TinyImageNet_quantized.tflite")
with open(quantized_model_path, 'wb') as f:
    f.write(tflite_model)
print(f"Quantized model saved to: {quantized_model_path}")

# Function to extract quantization parameters
def get_quantization_params(tflite_model_path):
    interpreter = tf.lite.Interpreter(model_path=tflite_model_path)
    interpreter.allocate_tensors()
    
    layer_params = []
    input_details = interpreter.get_input_details()
    output_details = interpreter.get_output_details()
    
    # Add input/output scales
    for detail in input_details + output_details:
        quantization = detail['quantization_parameters']
        if quantization['scales'].size > 0:
            layer_params.append({
                'name': detail['name'],
                'scale': float(quantization['scales'][0]),
                'zero_point': int(quantization['zero_points'][0]),
                'dtype': detail['dtype'].__name__
            })
    
    # Add weight/bias scales
    for tensor_details in interpreter.get_tensor_details():
        if 'quant' in tensor_details['name'].lower():
            quantization = tensor_details['quantization_parameters']
            if quantization['scales'].size > 0:
                layer_params.append({
                    'name': tensor_details['name'],
                    'scale': float(quantization['scales'][0]),
                    'zero_point': int(quantization['zero_points'][0]),
                    'dtype': tensor_details['dtype'].__name__
                })
    
    return layer_params

# Extract and print quantization parameters
quant_params = get_quantization_params(quantized_model_path)
print("\nQuantization Parameters:")
for param in quant_params:
    print(f"Layer: {param['name']}")
    print(f"  Scale: {param['scale']}")
    print(f"  Zero Point: {param['zero_point']}")
    print(f"  Data Type: {param['dtype']}")
    print()

# Verify quantized model
interpreter = tf.lite.Interpreter(model_path=quantized_model_path)
interpreter.allocate_tensors()
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Test with a single image
for data in ds_train.take(1):
    image = tf.cast(data['image'], tf.float32) / 255.0
    image = tf.image.resize(image, [64, 64])
    # Quantize input
    input_scale, input_zero_point = input_details[0]['quantization']
    image_quant = (image / input_scale + input_zero_point).numpy().astype(np.int8)
    interpreter.set_tensor(input_details[0]['index'], image_quant)
    interpreter.invoke()
    output = interpreter.get_tensor(output_details[0]['index'])
    print("Quantized model inference successful. Sample output shape:", output.shape)