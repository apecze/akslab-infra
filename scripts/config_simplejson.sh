#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
sudo apt update
echo -e "Update of Apt repositories is: ${GREEN}SUCCESSFUL${NC}!"
sudo apt install python3 pip -y
sudo -u vagrant -H sh -c "pip install simplejson"
echo -e "Installation of Simplejson is: ${GREEN}SUCCESSFUL${NC}!"
