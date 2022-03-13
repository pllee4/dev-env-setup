#!/bin/bash

sudo add-apt-repository --yes ppa:kicad/kicad-6.0-releases
sudo apt update
sudo apt install -y --install-recommends kicad
# # If you want demo projects
# sudo apt install kicad-demos