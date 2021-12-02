#!/bin/bash

curl -L https://github.com/Kitware/CMake/releases/download/v3.21.4/cmake-3.21.4-linux-x86_64.sh > cmake-3.21.4-Linux-x86_64.sh
chmod +x cmake-3.21.4-Linux-x86_64.sh
sudo bash ./cmake-3.21.4-Linux-x86_64.sh --prefix=/usr/local/ --skip-license && ldconfig && rm cmake-3.21.4-Linux-x86_64.sh