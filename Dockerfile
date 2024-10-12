FROM nvidia/cuda:12.6.1-cudnn-runtime-ubuntu20.04

RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/comfyanonymous/ComfyUI.git /ComfyUI

WORKDIR /ComfyUI

VOLUME [ \
    "/ComfyUI/models/diffusion_models", \
    "/ComfyUI/models/controlnet", \
    "/ComfyUI/models/upscale_models", \ 
    "/ComfyUI/models/photomaker", \
    "/ComfyUI/models/embeddings", \
    "/ComfyUI/models/checkpoints", \
    "/ComfyUI/models/style_models", \
    "/ComfyUI/models/clip", \
    "/ComfyUI/models/hypernetworks", \
    "/ComfyUI/models/diffusers", \
    "/ComfyUI/models/vae", \
    "/ComfyUI/models/gligen", \
    "/ComfyUI/models/unet", \
    "/ComfyUI/models/clip_vision", \
    "/ComfyUI/models/vae_approx", \
    "/ComfyUI/models/loras" \
    ]

RUN pip3 install --upgrade pip \
    && pip3 install -r requirements.txt

ENV PATH /usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:${LD_LIBRARY_PATH}

CMD ["python3", "/ComfyUI/main.py", "--listen"]
