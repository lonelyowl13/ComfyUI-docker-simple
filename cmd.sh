#!/bin/sh

cp -r --update /tmp_models/* /ComfyUI/models
cp -r --update /tmp_input/* /ComfyUI/input
cp -r --update /tmp_output/* /ComfyUI/output 
cp -r --update /tmp_custom_nodes/* /ComfyUI/custom_nodes

python3 /ComfyUI/main.py --listen
