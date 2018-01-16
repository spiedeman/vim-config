#!/bin/bash

echo "<<< INSTALL autojump."
tar -zxf ./autojump_v21.1.2.tar.gz -C ~/GitHub

cd ~/GitHub/autojump_v21.1.2
bash install.sh

cd .. && rm -rf autojump_v21.1.2


echo "<<< INSTALL flux."
sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo apt update
sudo apt install fluxgui
