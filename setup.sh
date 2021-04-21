mkdir -p $HOME/.local/bin

shell_chosen=zhs
platform=linux

if [ $# -ge 1 ]; then
    shell_chosen=$1
fi
if [ $# -ge 2 ]; then
    platform=$2
fi


bash shrc/install.sh $shell_chosen $platform || exit 1
bash fastjump/install.sh || exit 1
bash vim/install.sh || exit 1

if [ $platform == "linux" ]; then
    bash tmux/install.sh || exit 1
fi