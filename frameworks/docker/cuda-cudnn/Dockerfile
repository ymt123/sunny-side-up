FROM ubuntu:14.04
MAINTAINER Yonas Tesfaye <yonast@lab41.org>

# Based on kaixhin/cuda-caffe but updated version of CUDA/cuDNN3

# Install wget and build-essential
RUN apt-get update && apt-get install -y \
  build-essential \
  wget

# Change to the /tmp directory
RUN cd /tmp && \
# Download run file
  wget --quiet http://developer.nvidia.com/compute/cuda/7.5/RC/local_installers/cuda_7.5.7_rc_linux.run && \
# Make the run file executable and extract
  chmod +x cuda_*_linux.run && ./cuda_*_linux.run -extract=`pwd` && \
# Install CUDA drivers (silent, no kernel)
  ./NVIDIA-Linux-x86_64-*.run -s --no-kernel-module && \
# Install toolkit (silent)  
  ./cuda-linux64-rel-*.run -noprompt && \
# Clean up
  rm -rf *

# Move cuDNN over and extract
ADD cudnn-7.0-linux-x64-v3.0-rc.tgz /root/

# Install cuDNN
RUN cd /root/cuda && \
  cp include/*.h /usr/local/cuda/include/ && \
  cp --preserve=links lib64/*.so* /usr/local/cuda/lib64/ && \
  cp lib64/*.a /usr/local/cuda/lib64/

# Add to path
ENV PATH=/usr/local/cuda/bin:$PATH \
  LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH