#!/bin/bash

sudo apt update

# install packages to allow `apt` to use a repository over HTTPS
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# setup the stable repository
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# update the `apt` package index
sudo apt update

# install the latest version of Docker CE
sudo apt install docker-ce

# create `docker` group 
sudo groupadd docker

# add user to the `docker` group
sudo usermod -aG docker $USER

# log out and log back so that the group membership is re-evaluated
# verify that run `docker` commands without `sudo`
docker run hello-world

# This command download a test image and runs it in a container.
# when the container runs, it prints an informational message and exits.

## Configure Docker to start on boot
# Most current Linux distributions (containing Ubuntu16.04 and higher) use
# `systemd` to manage which services start when the system boots.
sudo systemctl enable docker

# To disable this behavior, use `disable` instead
sudo systemctl disable docker

# Docker is automatically configured to start on boot using `upstart`. To
# disable this behavior, use the following command
echo manual | sudo tee /etc/init/docker.override

sudo chkconfig docker on
