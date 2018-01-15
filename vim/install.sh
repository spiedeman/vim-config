#!/bin/bash

echo "<<< INSTALL VIM8.0 AND CONFIGURE IT."
# echo "\n" | sudo -S add-apt-repository ppa:jonathonf/vim
echo "xiaomei1102" | sudo -S add-apt-repository ppa:jonathonf/vim -y
sudo apt update
echo "y" | sudo apt upgrade

sudo apt install vim-gtk3-py2
vimpy2=$(echo "1" | sudo update-alternatives --config vim | grep py2)
echo ${vimpy2%%/*} | sudo update-alternatives --config vim

if ! $(which curl > /dev/null 2>&1); then
    echo ">>> INSTALL curl..."
    # echo "xiaomei1102" | sudo -S apt install curl
    sudo apt install curl -y
fi
echo ">>> INSTALL NECESSARY COMMANDS AND LIBARARY."
echo " "
sudo apt install build-essential cmake -y
sudo apt install libncurses5-dev python-dev -y

if ! [ -f ~/.vim/autoload/plug.vim ]; then
    echo ">>> INSTALL plug.vim..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo ">>> plug.vim EXISTS."
fi

if [ -d ~/.vim/UltiSnips ]; then
    rm -rf ~/.vim/UltiSnips
fi
mkdir ~/.vim/UltiSnips
cp UltiSnips/* ~/.vim/UltiSnips

echo ">>> INSTALL VIM configuration and plugins..."
if [ -f ~/.vimrc ]; then
    cp ~/.vimrc ~/.vimrc.old
fi
cp vimrc ~/.vimrc

# 
vim -c "PlugInstall" -c "PlugUpdate!" -c "q" -c "q"
