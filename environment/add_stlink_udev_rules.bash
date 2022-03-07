#!/bin/bash
sudo cp ./100-stlink.rules /lib/udev/rules.d
sudo udevadm control --reload-rules
sudo udevadm trigger
