#!/bin/bash

tar -zxf ./autojump_v21.1.2.tar.gz -C ~/GitHub

cd ~/GitHub/autojump_v21.1.2
bash install.sh

cd .. && rm -rf autojump_v21.1.2

