#!/bin/bash

#copy latest witness_node software and print web report
cd /bitshares/bitshares-core/programs/witness_node/ 
du -h > /var/www/html/file-size-report.html
#print node version and output as web report
./witness_node -v > /var/www/html/node-version.html


#pack entire witness node software
cd /bitshares/bitshares-core/programs/
tar zcvf bts-precompiled-api.tar.gz witness_node/
if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi
mv /bitshares/bitshares-core/programs/bts-precompiled-api.tar.gz /var/www/html/downloads/

echo "Script success and download available at https://toronto.ca.api.bitshares.org/downloads/bts-precompiled-api.tar.gz"

