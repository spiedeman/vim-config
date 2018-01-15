#!/bin/bash

echo -e "<< change source to Tsinghua"
sudo -S cp /etc/apt/sources.list /etc/apt/sources.list.old << EOF
xiaomei1102
EOF
sudo cp ./config/sources.list /etc/apt/sources.list
sudo apt autoremove libreoffice-common unity-webapps-common
echo "\n" | sudo -S add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt upgrade
sudo apt install vim-gtk3-py2
vimpy2=`echo '1' | sudo -S update-alternatives --config vim | grep py2` 
echo ${vimpy2%%/*} | sudo update-alternatives --config vim

cp ./config/bashrc ~/.bashrc
cp ./config/vimrc ~/.vimrc
cp ./config/tmux.conf ~/.tmux.conf

python config/get-pip.py --user
tar -zxf software/auto* -C ..
