#!/bin/bash

sudo apt -y install valgrind
sudo apt -y install openssh-server
sudo apt -y install sshpass

# sshpass -p "$password" scp /<PATH>/final.txt $username@$Ip:/root/<PATH>

sudo apt -y install nmap

# sudo nmap -sn <ip_address>/24 // for example 192.168.10.0/24

# openocd 0.11.0
# https://forum.electro-smith.com/t/openocd-error-cant-find-interface-stlink-cfg/1904/4