#!/bin/bash

# install Conan
sudo apt -y install python3-pip
# recent bugfix (8/21)
pip3 install requests
sudo python3 -m pip install conan && conan user

# to add remote for gitlab
# conan remote add gitlab https://gitlab.com/api/v4/packages/conan
# conan user $USERNAME -r gitlab -p $CI_DEPLOY_PASSWORD