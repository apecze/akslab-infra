#!/bin/sh
# Update rpi4-ubuntu
sudo apt update && sudo apt upgrade
# Install dependencies for ansible
sudo apt install python3 pip -y
sudo -u vagrant -H sh -c "pip install simplejson"
