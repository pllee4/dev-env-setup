#!/bin/bash
sudo apt -y install xrdp
sudo systemctl start xrdp
sudo systemctl enable xrdp
sudo adduser xrdp ssl-cert
sudo systemctl restart xrdp