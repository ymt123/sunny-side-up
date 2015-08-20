#!/bin/bash

# image name
__image=lab41/cuda-cudnn

# build image
docker build -t $__image .
