#!/bin/bash
now=$(date +"%T")

#Download pre-compiled witness_node software with fully synced blockchain database

cd /bitshares/
wget https://toronto.ca.api.bitshares.org/downloads/bts-node-full.tar.gz | sed 's/\r//g'
if output=$(tar zxvf bts-node-full.tar.gz); then
    printf 'TAR Extract successful on «$now»\n' "$output"
fi
rm -rf bts-node-full.tar.gz

echo "Downloaded and deployed successfully $now" | tee -a /bitshares/install
