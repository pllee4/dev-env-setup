#!/bin/bash

# install Doxygen
# Reference:
# 1. hhttps://www.doxygen.nl/download.html

sudo apt install python flex bison git -y
git clone https://github.com/doxygen/doxygen.git
cd doxygen
mkdir build
cd build
cmake -G "Unix Makefiles" ..
make
sudo make install
cd ../../
rm -rf doxygen
