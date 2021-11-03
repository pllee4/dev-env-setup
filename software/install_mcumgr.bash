#!/bin/bash

install mcumgr
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt -y install golang-go
go get github.com/apache/mynewt-mcumgr-cli/mcumgr
sudo mv go ~

echo 'export PATH="$PATH":~/go/bin' >> ~/.bashrc
source ~/.bashrc