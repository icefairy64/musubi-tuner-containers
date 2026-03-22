FROM python:alpine AS base

RUN pip3 install hf
RUN hf download Wan-AI/Wan2.1-T2V-14B --include "google/umt5-xxl/**"
RUN hf download mistralai/Mistral-Small-3.1-24B-Instruct-2503 --include "*.json"
RUN hf download mistralai/Mistral-Small-3.1-24B-Instruct-2503 --include "*.txt"
RUN hf download Qwen/Qwen-Image --include "tokenizer/**"

#

FROM rocm/pytorch:rocm7.2_ubuntu22.04_py3.10_pytorch_release_2.8.0 AS final

ADD https://github.com/kohya-ss/musubi-tuner.git#0b2d69293f7037c273b18b1596719a17e0ce24f8 /opt/musubi-tuner

RUN pip3 install -e /opt/musubi-tuner/

COPY --from=base /root/.cache/huggingface /root/.cache/huggingface

WORKDIR /opt/musubi-tuner
