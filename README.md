# BitShares Mainnet API 'pre-compiled-witness_node' [Ubuntu 18.10 x64]
Bash scripts that deploy precompiled BitShares API node fully synced/replayed (optional: NGINX + SSL certs example)

## Minimum server requirements

CPU: 2 (v)Core
RAM: 8GB RAM
HDD: 100GB SSD Higher IOPS drive
Bandwidth: Minimum 100Mbit/s | Recommended +1Gbit/s (up/down)


**Notice:**  This is default configuration for API Node owner (max-ops 100, rpc 8090, p2p 1776). 

## Description

- These bash scripts will install/deploy everything needed for *Ubuntu 18.10* to run **BitShares Public Mainnet API node**, as per clone provisioned and weekly backed up from [Toronto Mainnet BitShares.org API](https://toronto.ca.api.bitshares.org) - Currently listed in [BitShares DEX](https://wallet.bitshares.org), maintained through [Consensus/Worker](https://www.bitshares.foundation/workers/2018-08-flash-global-infrastructure) and used by [BitShares DEXBot](https://github.com/Codaone/DEXBot/)

- [optional - see 2.1 and 2.2] nginx installation and configuration to run websocket on 8090 and ssl example deployed with your default server $hostname (whatever is /etc/hostname content)
*SSL WARNING: You will have to replace cert and key for your own domain and edit '/etc/nginx/sites-available/bitshares' for changes*

- WebSocket/API available with endings '/ws' & '/wss' - Default '/' left for port 80 (nginx webserver).

- TREE of Deployed folders/files:

```
/bitshares/
/bitshares/witness_node/
/bitshares/swap
/etc/nginx/ssl/
/etc/nginx/sites-available/
/etc/nginx/sites-enabled/
```

### 1.1 - Preparing the environment and swap

**Be logged in as root or use sudo command**

```
wget https://raw.githubusercontent.com/dls-cipher/pre-compiled-witness_node/master/1-buildenv.sh
chmod a+x 1-buildenv.sh
./1-buildenv.sh
```

*Once fully processed your server will be restarted within **1 minute**. Wait!*

### 2.1 - WGET/Deploy pre-compiled witness_node and nginx configuration /w SSL

**Be logged in as root or use sudo command**

```
wget https://raw.githubusercontent.com/dls-cipher/pre-compiled-witness_node/master/2-deploy.sh
chmod a+x 2-deploy.sh
./2-deploy.sh
#comment: run last command through SCREEN to prevent session drop - e.g. screen -dmS build ./2-deploy.sh
```

*This will take some time. Usually it takes around 10-12 minutes to download node with blockchain database not older than 1 week. After successful download, untar can possibly make your screen/ssh session look frozen for about 20-30 mins. Be patient, please.*

Replace:

```
/etc/nginx/ssl/ssl-bundle.crt
/etc/nginx/ssl/apasia3rd.key
```

with your own set of SSL cert/key, and their replacements edit within nginx configuration:

```
/etc/nginx/sites-available/bitshares
```

### 2.2 - WGET/Deploy pre-compiled witness_node (NO nginx/websocket/ssl configuration)

**Be logged in as root or use sudo command**

```
wget https://raw.githubusercontent.com/dls-cipher/pre-compiled-witness_node/master/2-deploy-nonginx.sh
chmod a+x 2-deploynonginx.sh
./2-deploynonginx.sh
```

*This will take some time. Usually it takes around 15-20 minutes to download node with blockchain database not older than 1 week. After successful download, untar can possibly make your screen/ssh session look frozen for about 20-30 mins. Be patient, please.*

### 3.1 - Start witness_node with screen

**Be logged in as root or use sudo command**

```
cd /bitshares/witness_node
screen -dmS btsd ./witness_node
```



