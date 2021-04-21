mkdir -p $HOME/.local/bin

bash shrc/install.sh || exit 1
bash fastjump/install.sh || exit 1
bash tmux/install.sh || exit 1
bash vim/install.sh || exit 1
