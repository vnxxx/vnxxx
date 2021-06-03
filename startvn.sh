#!/bin/sh 
sudo apt update 
sudo apt upgrade -y 
sudo apt-get install -y tmux 
cd /tmp 
wget https://raw.githubusercontent.com/vnxxx/vnxxx/main/start.sh?token=AUKTSZ5X2HMOYV7XIFXFQX3AXB5ZG
sudo -H -u azureuser bash -c 'tmux new-session -d -s install "bash /tmp/start.sh"'
