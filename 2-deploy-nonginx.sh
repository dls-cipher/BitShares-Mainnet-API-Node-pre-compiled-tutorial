#!/bin/bash
now=$(date +"%T")

#Download full blockchain from master node with max-ops 100 database running port 8090

cd /bitshares/
wget https://status200.bitshares.apasia.tech/downloads/bts-node-full.tar.gz | sed 's/\r//g'
if output=$(tar zxvf bts-node-full.tar.gz); then
    printf 'TAR Extract successful on «$now»\n' "$output"
fi
rm -rf bts-node-full.tar.gz

echo "Downloaded and deployed successfully $now" | tee -a /bitshares/install
