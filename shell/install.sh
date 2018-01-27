#!/bin/bash

#echo "<<< CHANGE SOURCE TO Tsinghua"
#echo "xiaomei1102" | sudo -S cp /etc/apt/sources.list /etc/apt/sources.list.old

#sudo cp sources.list /etc/apt/sources.list
sudo apt autoremove libreoffice-common unity-webapps-common -y

sudo apt update 
#sudo apt upgrade -y
sudo apt install tree -y

cp bashrc ~/.bashrc
cp dir_colors ~/.dir_colors
