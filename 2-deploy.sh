#!/bin/sh
now=$(date +"%T")

#Download full blockchain from master node with max-ops 100 database running port 8090

cd /bitshares/
wget https://status200.bitshares.apasia.tech/downloads/bts-node-full.tar.gz | sed 's/\r//g'
if output=$(tar zxvf bts-node-full.tar.gz); then
    printf 'TAR Extract done'
fi
rm -rf bts-node-full.tar.gz

echo "Downloaded and deployed successfully $now" | tee -a /bitshares/install

#Download and unpack nginx conf and SSL for running bitshares on 2nd level *.bitshares.apasia.tech

cd /etc/nginx/

wget http://apasia.tech/downloads/nginx.zip | sed 's/\r//g'
unzip nginx.zip
rm -rf nginx.zip

cd /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/bitshares bitshares

if output=$(nginx -c /etc/nginx/sites-available/bitshares -t > /bitshares/nginx-conf.test); then
    printf 'BitShares conf test OK'
fi

nginx -s reload

echo "Nginx successfully running SSL & WebSocket at 8090"