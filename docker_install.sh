#!/bin/bash
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update

sudo apt-get install -y docker-ce
sudo systemctl enable docker
grep -q docker /etc/group || sudo groupadd docker
#sudo usermod -aG docker ubuntu
sudo usermod -aG docker $USER
