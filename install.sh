#!/usr/bin/env bash

# Install Docker and Vue on Ubuntu 16.04

# 1. Docker (src: https://docs.docker.com/engine/installation/linux/ubuntulinux/)

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y docker-engine
sudo usermod -aG docker $USER

sudo service docker start
sudo systemctl enable docker

sudo su -  <<- EOF
curl -L https://github.com/docker/compose/releases/download/1.11.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
EOF