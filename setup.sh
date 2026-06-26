#!/usr/bin/env bash
# setup.sh
# Creates the conda environment from environment.yml and registers it
# as a Jupyter kernel. Run from the project root.
#
# Usage: bash setup.sh

set -e

ENV_NAME="zas-python-reproducible-example"
DISPLAY_NAME="Python (zas-python-reproducible-example)"

echo "==> Creating conda environment from environment.yml..."
conda env create -f environment.yml

echo "==> Activating environment: ${ENV_NAME}"
# shellcheck disable=SC1091
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate "${ENV_NAME}"

echo "==> Checking ipykernel installation..."
if ! conda list ipykernel | grep -q ipykernel; then  # check if ipykernel is installed
  echo "    ipykernel not found, installing..."
  conda install -y ipykernel
fi

echo "==> Checking if kernel is already registered..."
if jupyter kernelspec list | grep -q "${ENV_NAME}"; then  # check if already registered
  echo "    Kernel already registered, skipping."
else
  echo "    Registering Jupyter kernel..."
  python -m ipykernel install --user --name "${ENV_NAME}" --display-name "${DISPLAY_NAME}"  # register kernel
fi

echo "==> Verifying kernel registration..."
jupyter kernelspec list

echo ""
echo "Setup complete."
echo "If the kernel does not appear in VS Code, reload the window"
echo "(Cmd+Shift+P -> \"Developer: Reload Window\") and select it manually"
echo "from the kernel picker."