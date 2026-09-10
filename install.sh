#!/usr/bin/env bash
set -euo pipefail

# Reuse the PyTorch installation from the active environment.  The original
# script forced torch 1.12.1/cu113, which would replace a working installation.
echo "****************** Checking existing PyTorch ******************"
python - <<'PY'
import sys

try:
    import torch
except ImportError as exc:
    raise SystemExit(
        "PyTorch is not installed in the active environment. "
        "Install a compatible PyTorch build first."
    ) from exc

print(f"Python: {sys.version.split()[0]}")
print(f"PyTorch: {torch.__version__}")
print(f"Torch CUDA: {torch.version.cuda}")
print(f"CUDA available: {torch.cuda.is_available()}")

if not torch.cuda.is_available():
    raise SystemExit(
        "CUDA is not available to PyTorch. Check the active environment and driver."
    )
PY

echo "****************** Installing SpikeFET dependencies ******************"
# Older visdom packaging imports pkg_resources while building.  setuptools
# 81+ removed that compatibility module; this does not change PyTorch.
python -m pip install "setuptools<81"

python -m pip install \
    PyYAML \
    easydict \
    cython \
    opencv-python \
    pandas \
    tqdm \
    pycocotools \
    jpeg4py \
    tb-nightly \
    tikzplotlib \
    thop \
    colorama \
    lmdb \
    scipy \
    tensorboardX \
    wandb \
    dv-processing

# SpikeFET uses the legacy spikingjelly.clock_driven API.  Version 0.0.0.0.14
# renamed that API, so keep the last compatible stable release here.
python -m pip install "spikingjelly==0.0.0.0.12"

# Build visdom against the setuptools installed above instead of an isolated
# build environment that may pull a newer setuptools without pkg_resources.
python -m pip install --no-build-isolation visdom

# SpikeFET imports timm.models.layers, which is the API used by timm 0.6.x.
# Install it without dependencies so pip cannot replace the existing torch.
python -m pip install --no-deps "timm==0.6.13"

echo "****************** Verifying installation ******************"
python - <<'PY'
import cv2
import torch
import timm
import yaml

print(f"OpenCV: {cv2.__version__}")
print(f"timm: {timm.__version__}")
print(f"PyTorch: {torch.__version__}, CUDA available: {torch.cuda.is_available()}")
print("Installation complete.")
PY
