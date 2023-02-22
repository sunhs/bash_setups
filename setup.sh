#!/bin/bash
mkdir -p $HOME/.local/bin

shell_chosen=zsh
platform=linux
use_posh=0

if [ $# -ge 1 ]; then
    shell_chosen=$1
fi
if [ $# -ge 2 ]; then
    platform=$2
fi
if [ $# -ge 3 ]; then
    use_posh=$3
fi

GREEN="\e[1;32m"
NOCOLOR="\e[0m"

printf "${GREEN}>>>>>>>>>> Installing bash/zsh${NOCOLOR}\n"
cd shrc && bash install.sh $shell_chosen $platform $use_posh && cd - || exit 1

printf "\n\n\n${GREEN}>>>>>>>>>> Installing fastjump${NOCOLOR}\n"
cd fastjump && bash install.sh && cd - || exit 1

#printf "${GREEN}>>>>>>>>>> Installing vim color scheme${NOCOLOR}\n"
#cd vim && bash install.sh && cd - || exit 1

if [ $platform = "linux" ]; then
    printf "\n\n\n${GREEN}>>>>>>>>>> Installing tmux${NOCOLOR}\n"
    cd tmux && bash install.sh && cd - || exit 1
fi
