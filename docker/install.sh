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
