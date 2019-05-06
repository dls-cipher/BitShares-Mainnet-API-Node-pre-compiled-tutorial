#!/bin/sh
now=$(date +"%T")

#Download full blockchain from master node with max-ops 100 database running port 8090

cd /bitshares/
wget https://toronto.ca.api.bitshares.org/downloads/bts-full-node.tar.gz
if output=$(tar zxvf bts-full-node.tar.gz); then
    printf 'TAR Extract done'
fi
rm -rf bts-full-node.tar.gz

echo "Downloaded and deployed successfully $now" | tee -a /bitshares/install

#Download and unpack nginx conf and SSL for running bitshares on 2nd level *.bitshares.apasia.tech

cd /etc/nginx/

wget https://toronto.ca.api.bitshares.org/downloads/nginx.tar.gz | sed 's/\r//g'
tar zxvf nginx.tar.gz
rm -rf nginx.zip

if output=$(nginx -c /etc/nginx/sites-available/bitshares -t > /bitshares/nginx-conf.test); then
    printf 'BitShares conf test OK'
fi

nginx -s reload

echo "Nginx successfully running SSL & WebSocket at 8090"
