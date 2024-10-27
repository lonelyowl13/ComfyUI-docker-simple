#!/bin/bash

export PIP_ROOT_USER_ACTION=ignore

# The list of nodes
NODES=(
  "https://github.com/ciri/comfyui-model-downloader.git comfyui-model-downloader"
  "https://github.com/11cafe/comfyui-workspace-manager.git comfyui-workspace-manager"
  "https://github.com/ltdrdata/ComfyUI-Manager.git ComfyUI-Manager"
  "https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git ComfyUI_UltimateSDUpscale"
)

# Node install function
clone_and_install() {

  cd /ComfyUI/custom_nodes

  for repo in "${NODES[@]}"; do
    url=$(echo "$repo" | cut -d' ' -f1)
    name=$(echo "$repo" | cut -d' ' -f2)

    if [ ! -d "$name" ] || [ -z "$(ls -A "$name")" ]; then
      echo "Cloning $name..."
      git clone "$url" "$name"

      if [ -f "$name/requirements.txt" ]; then
        echo "Installing requirements for $name..."
        cd "$name"
        pip install -r requirements.txt
        cd ..
      fi
    else
      echo "Skipping $name, folder is not empty or already exists."
    fi
  done
}

clone_and_install
