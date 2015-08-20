FROM lab41/cuda-cudnn
MAINTAINER Yonas Tesfaye <yonast@lab41.org>

# Based on kaixhin/cuda-caffe but updated version of CUDA/cuDNN3

# Install git, bc and dependencies
RUN apt-get update && apt-get install -y \
  git \
  bc \
  libatlas-base-dev \
  libatlas-dev \
  libboost-all-dev \
  libopencv-dev \
  libprotobuf-dev \
  libgoogle-glog-dev \
  libgflags-dev \
  protobuf-compiler \
  libhdf5-dev \
  libleveldb-dev \
  liblmdb-dev \
  libsnappy-dev

# Clone Caffe repo and move into it
RUN cd /root && git clone https://github.com/BVLC/caffe.git && cd caffe && \
# Copy Makefile
  cp Makefile.config.example Makefile.config && \
  sed -i 's!# USE_CUDNN := 1!USE_CUDNN := 1!' Makefile.config && \
# Make
  make -j"$(nproc)" all
# Set ~/caffe as working directory
WORKDIR /root/caffe

RUN apt-get update && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    cd / && wget --quiet https://repo.continuum.io/archive/Anaconda-2.3.0-Linux-x86_64.sh && \
    /bin/bash /Anaconda-2.3.0-Linux-x86_64.sh -b -p /opt/conda && \
    rm /Anaconda-2.3.0-Linux-x86_64.sh  && /opt/conda/bin/conda install --yes conda==3.14.1

ENV PATH /opt/conda/bin:$PATH

CMD ["/bin/bash"]
