#!/bin/bash

sudo apt -y install valgrind
sudo apt -y install openssh-server
sudo apt -y install sshpass

# sshpass -p "$password" scp /<PATH>/final.txt $username@$Ip:/root/<PATH>