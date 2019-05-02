#!/bin/bash
DIR=/

#Preparing Ubuntu 18.10 environment

apt-get update && apt-get install gcc-5 g++-5 cmake make \
                     libbz2-dev libdb++-dev libdb-dev \
                     libssl-dev openssl libreadline-dev \
                     autoconf libtool git libcurl4-openssl-dev \
		     autotools-dev automake build-essential \
		     doxygen libboost-all-dev automake nginx \
		     g++ libbz2-dev libicu-dev python-dev screen -y
                     
apt-get install joe htop

apt-get install unzip

#Building Swap and Structure

mkdir /bitshares

fallocate -l 10G /swap #Asuming you are having minimum 8GB of real RAM
chmod 0600 /swap
mkswap /swap
if output=$(swapon /swap); then
    printf 'SWAP succeded, the output was stored «»\n' "$output"
fi
sysctl vm.swappiness=25
sysctl vm.vfs_cache_pressure=40
echo "vm.swappiness = 25" | tee -a /etc/sysctl.conf
echo "vm.vfs_cache_pressure = 40" | tee -a /etc/sysctl.conf
echo "/swap none  swap  sw 0  0" | tee -a /etc/fstab

#Reboot in 1 minute

shutdown -r +1
