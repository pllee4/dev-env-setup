#!/bin/bash

ZSDK_VERSION=0.13.2
GCC_ARM_NAME=gcc-arm-none-eabi-10-2020-q4-major
WGET_ARGS="-q --show-progress --progress=bar:force:noscroll --no-check-certificate"

sudo apt-get install -y tzdata
sudo ln -fs /usr/share/zoneinfo/Asia/Singapore /etc/localtime
sudo dpkg-reconfigure --frontend noninteractive tzdata

sudo apt -y install --no-install-recommends software-properties-common \
	lsb-release autoconf build-essential ccache \
	chrpath cpio device-tree-compiler dfu-util \
	g++ gawk gcc gcc-multilib g++-multilib gcovr \
	git git-core gperf \
	libglib2.0-dev \
	libgtk2.0-0 \
	liblocale-gettext-perl \
	libncurses5-dev \
	libpcap-dev \
	libpopt0 \
	libsdl1.2-dev \
	libsdl2-dev \
	libssl-dev \
	libtool \
	libtool-bin \
	locales \
	make \
	net-tools \
	ninja-build \
	openssh-client \
	pkg-config \
	protobuf-compiler \
	python3-dev \
	python3-pip \
	python3-ply \
	python3-setuptools \
    wget

wget ${WGET_ARGS} https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/${GCC_ARM_NAME}-x86_64-linux.tar.bz2  && \
	sudo tar -xf ${GCC_ARM_NAME}-x86_64-linux.tar.bz2 -C /opt/ && \
	rm -f ${GCC_ARM_NAME}-x86_64-linux.tar.bz2

# wget ${WGET_ARGS} https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh && \
# 	chmod +x cmake-${CMAKE_VERSION}-Linux-x86_64.sh && \
# 	sudo ./cmake-${CMAKE_VERSION}-Linux-x86_64.sh --skip-license --prefix=/usr/local && \
# 	rm -f ./cmake-${CMAKE_VERSION}-Linux-x86_64.sh

wget ${WGET_ARGS} https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZSDK_VERSION}/zephyr-sdk-${ZSDK_VERSION}-linux-x86_64-setup.run && \
	sudo sh "zephyr-sdk-${ZSDK_VERSION}-linux-x86_64-setup.run" --quiet -- -d /opt/zephyr-sdk-${ZSDK_VERSION} -y -norc && \
	rm "zephyr-sdk-${ZSDK_VERSION}-linux-x86_64-setup.run"

pip3 install wheel pip -U &&\
pip3 install -r https://raw.githubusercontent.com/zephyrproject-rtos/zephyr/master/scripts/requirements.txt && \
pip3 install -r https://raw.githubusercontent.com/zephyrproject-rtos/mcuboot/master/scripts/requirements.txt && \
pip3 install west &&\
pip3 install sh &&\
pip3 install awscli PyGithub junitparser pylint \
		     statistics numpy \
		     imgtool \
		     protobuf

echo 'export PATH=~/.local/bin:"$PATH"' >>~/.bashrc
source ~/.bashrc

west init ~/zephyrproject
cd ~/zephyrproject

west update
west zephyr-export

pip3 install --upgrade pip
pip3 install --user -r ~/zephyrproject/zephyr/scripts/requirements.txt

echo "export GNUARMEMB_TOOLCHAIN_PATH=/opt/${GCC_ARM_NAME}" >> ~/.bashrc
echo "export ZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk-${ZSDK_VERSION}" >> ~/.bashrc
echo "export ZEPHYR_BASE=~/zephyrproject/zephyr" >> ~/.bashrc

source ~/.bashrc
