FROM nvidia/cuda:12.6.2-cudnn-runtime-ubuntu22.04

RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/comfyanonymous/ComfyUI.git /ComfyUI

WORKDIR /ComfyUI

VOLUME [ \
    "/ComfyUI/models", \
    "/ComfyUI/input", \
    "/ComfyUI/output", \
    "/ComfyUI/custom_nodes", \
    "/ComfyUI/my_workflows", \
    "/ComfyUI_temp", \
    "/venv" \
  ]

RUN pip3 install --upgrade pip
RUN pip3 install virtualenv

RUN pip3 install -r requirements.txt

ENV PATH /usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:${LD_LIBRARY_PATH}

COPY ./cmd.bash /

RUN chmod +x /cmd.bash

COPY ./nodes_download.bash /

RUN bash /nodes_download.bash

RUN cp -TR "/ComfyUI/models" /tmp_models
RUN cp -TR "/ComfyUI/input" /tmp_input
RUN cp -TR "/ComfyUI/output" /tmp_output
RUN cp -TR "/ComfyUI/custom_nodes" /tmp_custom_nodes

CMD /cmd.bash
