#!/bin/bash

if ! $(which tmux > /dev/null 2>&1); then
    echo ">>> INSTALL TMUX..."
    # echo "xiaomei1102" | sudo -S apt install tmux
    sudo apt install tmux -y
fi

cp tmux.conf ~/.tmux.conf
