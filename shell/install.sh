#!/bin/bash

echo "<<< CHANGE SOURCE TO Tsinghua"
echo "xiaomei1102" | sudo -S cp /etc/apt/sources.list /etc/apt/sources.list.old

sudo sources.list /etc/apt/sources.list
echo "y" | sudo -S apt autoremove libreoffice-common unity-webapps-common

sudo apt update 
echo "y" | sudo -S apt upgrade

cp bashrc ~/.bashrc
cp dir_colors ~/.dir_colors
