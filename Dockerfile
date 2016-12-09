FROM        ubuntu:14.04
MAINTAINER  dborn
RUN         apt-get update \
                && apt-get -y build-dep python-imaging \
                && apt-get install -y libopenal1 libopenal-dev \
                   libtiff5-dev libjpeg8-dev \
                   zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev \
                   tcl8.6-dev tk8.6-dev python-tk python-pip \
                   software-properties-common wget \
                && echo 'deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.4 main' >> /etc/apt/sources.list \
                && wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add - \
                && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
                && add-apt-repository -y ppa:afrank/boost \
                && apt-get update \
                && apt-get install -y \
                    libboost1.57 \
                    make git curl xorg-dev libglu1-mesa-dev \
                    gcc-4.9 g++-4.9 gcc-4.9-base \
                && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 \
                && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100 \
                && pip install Pillow

RUN         curl -O https://cmake.org/files/v3.3/cmake-3.3.0.tar.gz && tar -xvf cmake-3.3.0.tar.gz
WORKDIR     cmake-3.3.0
RUN         ./bootstrap \
                && make \
                && make install

