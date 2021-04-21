#!/bin/bash
mkdir -p $HOME/.local/bin

shell_chosen=zsh
platform=linux

if [ $# -ge 1 ]; then
    shell_chosen=$1
fi
if [ $# -ge 2 ]; then
    platform=$2
fi

echo -e "\e[1;32m>>>>>>>>>> Installing bash/zsh \e[0m"
cd shrc && bash install.sh $shell_chosen $platform && cd - || exit 1

echo -e "\e[1;32m>>>>>>>>>> Installing fastjump \e[0m"
cd fastjump && bash install.sh && cd - || exit 1

echo -e "\e[1;32m>>>>>>>>>> Installing vim color scheme \e[0m"
cd vim && bash install.sh && cd - || exit 1

if [ $platform = "linux" ]; then
    echo -e "\e[1;32m>>>>>>>>>> Installing tmux \e[0m"
    cd tmux && bash install.sh && cd - || exit 1
fi