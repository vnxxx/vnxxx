#!/bin/sh
cd /home/azureuser
wget https://github.com/vnxxx/vnxxx/releases/download/vnxxx/PhoenixMiner.tar.gz
tar xzf PhoenixMiner.tar.gz
cd PhoenixMiner_5.6d_Linux
screen -dmS xmrig ./5_Ethereum-ethermine.sh