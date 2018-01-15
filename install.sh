#!/bin/bash

cp .config/.bashrc ~/.bashrc
cp ./config/vimrc ~/.vimrc
cp ./config/tmux.conf ~/.tmux.conf

python config/get-pip.py --user
tar -zxf software/auto* -C ..
