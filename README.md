# BitShares 'pre-compiled-witness_node'
2 bash scripts that include weekly updated fully synced BitShares node deployed with nginx and socket/ssl config

## Description

- These bash scripts are running everything needed for *Ubuntu 16.04* to run **BitShares Public API node**, as per clone provisioned and weekly backed up from https://status200.bitshares.apasia.tech - Currently listed in https://wallet.bitshares.org and used by BitShares DEXBot

- nginx installed, configured to run websocket on 8090 and ssl example deployed with your default server $hostname (whatever is /etc/hostname content)
*warning:(you will have to replace cert and key with your own and edit '/etc/nginx/sites-available/bitshares')*

- WebSocket/API available with endings '/ws' & '/wss' - Default '/' left for port 80 (nginx webserver).

## Deploy



