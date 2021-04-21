mkdir -p $HOME/.local/bin

shell_chosen=zsh
platform=linux

if [ $# -ge 1 ]; then
    shell_chosen=$1
fi
if [ $# -ge 2 ]; then
    platform=$2
fi


cd shrc && bash install.sh $shell_chosen $platform && cd - || exit 1
cd fastjump && bash install.sh && cd - || exit 1
cd vim && bash install.sh && cd - || exit 1

if [ $platform = "linux" ]; then
    cd tmux && bash install.sh && cd - || exit 1
fi