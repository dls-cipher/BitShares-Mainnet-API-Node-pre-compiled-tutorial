#!/bin/bash
DIR=/

#Preparing Ubuntu 16.04 for default requirements

apt-get update && apt-get install gcc-4.9 g++-4.9 cmake make \
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

fallocate -l 30G /bitshares/swap
chmod 0600 /bitshares/swap
mkswap /bitshares/swap
if output=$(swapon /bitshares/swap); then
    printf 'SWAP succeded, the output was stored «»\n' "$output"
fi
sysctl vm.swappiness=25
sysctl vm.vfs_cache_pressure=40
echo "vm.swappiness = 25" | tee -a /etc/sysctl.conf
echo "vm.vfs_cache_pressure = 40" | tee -a /etc/sysctl.conf
echo "/bitshares/swap none  swap  sw 0  0" | tee -a /etc/fstab

#Reboot in 1 minute

shutdown -r +1
