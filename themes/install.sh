#!/bin/bash

# echo "xiaomei1102" | sudo -S add-apt-repository ppa:snwh/pulp -y
sudo add-apt-repository ppa:snwh/pulp
sudo apt update
sudo apt install paper-gtk-theme -y
sudo apt install paper-icon-theme -y


echo "<<< INSTALL arc-theme"
if ! [ -d ~/tmp ]; then
    mkdir ~/tmp
fi
cd ~/tmp

git clone https://github.com/horst3180/arc-theme --depth 1
cd arc-theme
./autogen.sh --prefix=/usr
sudo make install
# cd .. && rm -rf arc-theme

echo "TO UNINSTALL arc-theme..."
echo "Type: "
echo "      sudo rm -rf /usr/share/{Arc,Arc-Darker,Arc-Dark}"
echo "UNINSTALL COMPLETE..."


echo "<<< INSTALL numix-gtk-theme"
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install numix-gtk-theme numix-icon-theme-circle -y
