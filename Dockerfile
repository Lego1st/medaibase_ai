# only images whose names contain 'devel' will provide nvcc.
FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-devel 

# install libs
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    python3-magic \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /     
RUN git clone https://github.com/NVIDIA/apex && cd apex && pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
RUN conda install -c conda-forge gdcm

WORKDIR /workspace
