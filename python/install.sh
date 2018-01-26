#!/bin/bash

sudo apt install python-dev -y
python get-pip.py --user
[ -d ~/.pip ] || mkdir ~/.pip
cp pip.conf ~/.pip
pip install --user powerline-status

cd ~
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
bash install.sh
cd .. && rm -rf fonts

if ! $(which wget > /dev/null 2>&1); then
    echo ">>> INSTALL wget..."
    # echo "xiaomei1102" | sudo -S apt install wget
    sudo apt install wget -y
fi

cd ~
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

if ! [ -d ~/.fonts ]; then
    mkdir ~/.fonts
fi
mv PowerlineSymbols.otf .fonts

if ! [ -d ~/.config/fontconfig/conf.d ]; then
    mkdir -p ~/.config/fontconfig/conf.d
fi
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d

fc-cache -vf ~/.fonts

pip install --user virtualenvwrapper
# pip install --user numpy scipy sympy pandas matplotlib
# pip install --user ipython theano seaborn pymc3
