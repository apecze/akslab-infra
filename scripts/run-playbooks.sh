#!/bin/bash
echo "Installing and configuring has been completed successfully!"
echo "Starting ansible playbooks.."

# run playbooks
cd /vagrant/ansible

ansible-playbook -i myhosts -K playbooks/initial-patching.yml
