#!/bin/bash

set -e

# open bbr
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh

# install docker 
curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
systemctl start docker
systemctl enable docker
usermod -aG docker $USER
 
apt-get install git -y
git clone https://github.com/Robot-Chen/ss-on-docker
cd ss-on-docker

docker build -t peacheychen/ss-on-docker .
docker run -d --name shadowsocks -p 20196:20196 --restart="always" peacheychen/ss-on-docker 
