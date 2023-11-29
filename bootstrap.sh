#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

# Update and upgrade the system
apt update && apt upgrade -y

# Install necessary packages
apt install -y software-properties-common curl wget gpg git build-essential sudo

# Add Ansible's GPG key and its repository
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | gpg --dearmor -o /usr/share/keyrings/ansible-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu jammy main" | tee /etc/apt/sources.list.d/ansible.list

# Update the package list again and install Ansible
apt update && apt install -y ansible

# Clean up
apt clean autoclean
apt autoremove --yes

echo "Bootstrap process completed."