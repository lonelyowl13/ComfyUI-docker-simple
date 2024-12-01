#!/bin/bash

cp -r --update /tmp_models/* /ComfyUI/models
cp -r --update /tmp_input/* /ComfyUI/input
cp -r --update /tmp_output/* /ComfyUI/output 
cp -r --update /tmp_custom_nodes/* /ComfyUI/custom_nodes

chown -R 1000:1000 /ComfyUI/models
chown -R 1000:1000 /ComfyUI/input
chown -R 1000:1000 /ComfyUI/output
chown -R 1000:1000 /ComfyUI/custom_nodes
chown -R 1000:1000 /ComfyUI/my_workflows
chown -R 1000:1000 /ComfyUI_temp

/create_venv.bash

source /venv/bin/activate

python3 /ComfyUI/main.py --listen --temp-directory /ComfyUI_temp
