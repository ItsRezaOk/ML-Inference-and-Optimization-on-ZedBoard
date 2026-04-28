import os
from pathlib import Path
import numpy as np
import tensorflow as tf
from tiny_imagenet import TinyImagenetDataset


def main():
    # k_in8 from C++ conv scales (inverse scale), layer 0
    k_in8 = 227.28470265723197
    out_dir = Path('sw/cpre487-587-dnn-framework-main/data/batch')
    out_dir.mkdir(parents=True, exist_ok=True)

    builder = TinyImagenetDataset()
    builder.download_and_prepare(download_dir="~/tensorflow-datasets/downloads")
    ds = builder.as_dataset()["validation"].take(1000).batch(1)

    count = 0
    for item in ds:
        img = tf.cast(item["image"], tf.float32) / 255.0  # [1,64,64,3] in [0,1]
        arr = img.numpy().reshape(-1)
        q = np.round(arr * k_in8).astype(np.int32)
        # clip to int8
        q = np.clip(q, -128, 127).astype(np.int8)
        with open(out_dir / f"image_{count}.bin", 'wb') as f:
            f.write(q.tobytes())
        count += 1
    print(f"Wrote {count} images to {out_dir}")


if __name__ == '__main__':
    main()

