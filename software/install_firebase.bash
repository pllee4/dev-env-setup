#!/bin/bash

curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
chmod +x ./nodesource_setup.sh
sudo ./nodesource_setup.sh
sudo apt -y install nodejs
rm ./nodesource_setup.sh
sudo npm install -g firebase-tools