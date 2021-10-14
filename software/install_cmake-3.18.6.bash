#!/bin/bash

curl -L https://github.com/Kitware/CMake/releases/download/v3.18.6/cmake-3.18.6-Linux-x86_64.sh > cmake-3.18.6-Linux-x86_64.sh
chmod +x cmake-3.18.6-Linux-x86_64.sh
sudo ./cmake-3.18.6-Linux-x86_64.sh --prefix=/usr/local/ --skip-license && ldconfig && rm cmake-3.18.6-Linux-x86_64.sh