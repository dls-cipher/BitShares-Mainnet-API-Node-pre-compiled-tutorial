#!/bin/bash

#copy latest witness_node software and print web report
cp -rfv /bitshares-core/programs/witness_node/ /bts/ > /var/www/html/copy-report.html
#print node version and output as web report
cd /bts/witness_node/
./witness_node -v > /var/www/html/node-version.html
#print size of the blockchain database as web report
du -h /bts/witness_node/witness_node_data_dir/blockchain > /var/www/html/size.html
#pack entire witness node software

cd /bts/
tar zcvf bts-node-full.tar.gz witness_node/
if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi
rm -rf /bts/witness_node/
mv /bts/bts-node-full.tar.gz /var/www/html/downloads/

echo "Script success and download available at https://status200.bitshares.apasia.tech/downloads/bts-node-full.tar.gz"

