#!/bin/bash
DIR=/

#Preparing Ubuntu 18.10 environment

sudo apt-get update && apt-get install gcc-5 g++-5 cmake make \
                     libbz2-dev libdb++-dev libdb-dev \
                     libssl-dev openssl libreadline-dev \
                     autoconf libtool git libcurl4-openssl-dev \
		     autotools-dev automake build-essential \
		     doxygen libboost-all-dev automake nginx \
		     g++ libbz2-dev libicu-dev python-dev screen -y
                     
sudo apt-get install joe htop

sudo apt-get install unzip

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
sudo echo "vm.swappiness = 25" | tee -a /etc/sysctl.conf
sudo echo "vm.vfs_cache_pressure = 40" | tee -a /etc/sysctl.conf
sudo echo "/swap none  swap  sw 0  0" | tee -a /etc/fstab

#Reboot in 1 minute

sudo shutdown -r +1
