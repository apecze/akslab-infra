#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
echo "Setting prerequisites for Ansible"
sudo apt update
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible

echo "Installing Ansible..."
sudo apt install ansible -y

echo "Setting host & SSH configuration"
sudo cp /vagrant/hosts /etc/hosts
yes y | ssh-keygen -t rsa -b 4096 -f "/home/vagrant/.ssh/id_rsa" -q -N ""
sudo chown vagrant /home/vagrant/.ssh/id_rsa && sudo chown vagrant /home/vagrant/.ssh/id_rsa.pub
sudo chgrp vagrant /home/vagrant/.ssh/id_rsa && sudo chgrp vagrant /home/vagrant/.ssh/id_rsa.pub

sudo -u vagrant -H sh -c "sshpass -p "vagrant" ssh-copy-id -o StrictHostKeyChecking=no ansible"
sudo -u vagrant -H sh -c "sshpass -p "vagrant" ssh-copy-id -o StrictHostKeyChecking=no k8s-node-1"
sudo -u vagrant -H sh -c "sshpass -p "vagrant" ssh-copy-id -o StrictHostKeyChecking=no dv01jkn01"

echo -e "Deployment has been: ${GREEN}COMPLETED SUCCESSFULLY${NC}!"
