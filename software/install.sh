#!/bin/bash

echo "<<< INSTALL autojump."
tar -zxf ./autojump_v21.1.2.tar.gz -C ~/GitHub

cd ~/GitHub/autojump_v21.1.2
bash install.sh

cd .. && rm -rf autojump_v21.1.2


echo "<<< INSTALL redshift-gtk."
sudo apt install redshift redshift-gtk -y

echo "<<< INSTALL moc."
sudo apt install moc moc-ffmpeg-plugin
[ -d ~/.moc ] || mkdir ~/.moc
cp -r moc ~/.moc

echo "<<< INSTALL mpv."
sudo add-apt-repository ppa:mc3man/mpv-tests
sudo apt install mpv 
[ -d ~/.config/mpv ] || mkdir ~/.config/mpv
cp -r ./mpv ~/.config/mpv

echo "<<< INSTALL zathura."
echo ">>> some libaraies need to be installed for"
echo ">>> Supporting Forward/Backward Search"
echo ">>> with vimtex"""
sudo apt install libsynctex1 xdotool -y
sudo apt install zathura zathura-pdf-poppler zathura-djvu zathura-dev zathura-ps -y
[ -d ~/.config/zathura ] || mkdir ~/.config/zathura
[ -f ~/.config/zathura/zathurarc ] || cp ./zathura/zathurarc ~/.config/zathura/zathurarc

echo "<<< modify guake"
sudo cp -a ./guake/guake.glade /usr/share/guake
sudo cp -a ./guake/guake_app.py /usr/lib/python2.7/dist-packages/guake
