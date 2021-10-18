#!/bin/bash

ZSDK_VERSION=0.13.1
GCC_ARM_NAME=gcc-arm-none-eabi-10-2020-q4-major

sudo apt -y install wget

wget -q --show-progress --progress=bar:force:noscroll --no-check-certificate https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZSDK_VERSION}/zephyr-sdk-${ZSDK_VERSION}-linux-x86_64-setup.run
wget -q --show-progress --progress=bar:force:noscroll --no-check-certificate https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/${GCC_ARM_NAME}-x86_64-linux.tar.bz2 &&

wget https://apt.kitware.com/kitware-archive.sh

sudo bash kitware-archive.sh

sudo apt -y install --no-install-recommends git cmake ninja-build gperf \
    ccache dfu-util device-tree-compiler wget \
    python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
    make gcc gcc-multilib g++-multilib libsdl2-dev

rm kitware-archive.sh

sudo sh "zephyr-sdk-${ZSDK_VERSION}-linux-x86_64-setup.run" --quiet -- -d /opt/zephyr-sdk-${ZSDK_VERSION} && \
     rm "zephyr-sdk-${ZSDK_VERSION}-linux-x86_64-setup.run"

sudo tar -xf ${GCC_ARM_NAME}-x86_64-linux.tar.bz2 -C /opt/ && \
    rm -f ${GCC_ARM_NAME}-x86_64-linux.tar.bz2


pip3 install --user -U west
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
