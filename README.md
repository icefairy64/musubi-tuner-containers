# Container definitions for Musubi Tuner

## Introduction
This is just a set of my personal container definitions for Musubi Tuner.

No major features or changes here - just a set of known-good refs with some text encoder metadata baked in.

## Original project reference
Musubi Tuner by kohya-ss: https://github.com/kohya-ss/musubi-tuner

## Running guidelines
- `--ipc=host` - in my experience, without it training would soft-lock on early steps
- `-e HF_HUB_OFFLINE=1` / `--network=none` - since these Containerfiles already include (some) text encoder metadata, all the scripts should run offline just fine
