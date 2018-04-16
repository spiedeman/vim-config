#!/bin/bash

#echo "<<< CHANGE SOURCE TO Tsinghua"
#echo "xiaomei1102" | sudo -S cp /etc/apt/sources.list /etc/apt/sources.list.old

#sudo cp sources.list /etc/apt/sources.list
sudo apt autoremove libreoffice-common unity-webapps-common -y

gsetting set com.canonical.indicator.datetime time-format 'custom'
gsetting set com.canonical.indicator.datetime custom-time-format '%Y年%m月%d %A %H:%M:%S'

sudo apt update 
sudo apt upgrade -y
sudo apt install tree -y

cp bashrc ~/.bashrc
cp dir_colors ~/.dir_colors
