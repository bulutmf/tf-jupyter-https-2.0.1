#!/bin/bash
set -e

echo "Generating config file"
jupyter notebook --generate-config


echo "Copy config file"
cp jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py

# echo "Running now"
# jupyter notebook

