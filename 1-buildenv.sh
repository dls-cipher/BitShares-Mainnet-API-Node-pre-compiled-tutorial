#!/bin/bash
DIR=/

#Preparing Ubuntu 19 environment

sudo apt-get update && apt-get autoconf cmake make \ 
                               automake libtool git libboost-all-dev \ 
			       libssl-dev g++ libcurl4-openssl-dev \
			       htop joe screen unzip -y                     

#Building Swap and Structure

sudo mkdir /bitshares

sudo fallocate -l 15G /swap #Asuming you are having minimum 8GB of real RAM
sudo chmod 0600 /swap
sudo mkswap /swap
if output=$(sudo swapon /swap); then
    printf 'SWAP succeded, the output was stored «»\n' "$output"
fi
sudo sysctl vm.swappiness=25
sudo sysctl vm.vfs_cache_pressure=40
sudo echo "vm.swappiness = 25" | sudo tee -a /etc/sysctl.conf
sudo echo "vm.vfs_cache_pressure = 40" | sudo tee -a /etc/sysctl.conf
sudo echo "/swap none  swap  sw 0  0" | sudo tee -a /etc/fstab

#Reboot in 1 minute

sudo shutdown -r +1
