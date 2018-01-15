#!/bin/bash

cd ./shell
bash install.sh

cd ..
for dir in $(ls .)
do
    if [ -d $dir -a $dir != "shell" ]; then
        cd $dir && bash install.sh
    fi
done

