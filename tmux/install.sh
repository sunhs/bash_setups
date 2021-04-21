ln -sf $(pwd)/tmux.conf $HOME/.tmux.conf

echo "========================================================="
echo "Installing tmux."
echo "========================================================="
if [ ! -f $HOME/.local/bin/tmux ]; then
    sudo apt-get -y install libevent-dev libncurses-dev > /dev/null
    mkdir -p $HOME/.tmux && cd $HOME/.tmux
    wget https://github.com/tmux/tmux/releases/download/3.1/tmux-3.1.tar.gz > /dev/null
    tar zxf tmux-3.1.tar.gz && rm tmux-3.1.tar.gz
    cd tmux-3.1
    mkdir build && cd build
    ../configure > /dev/null
    make > /dev/null
    ln -s $HOME/.tmux/tmux-3.1/build/tmux $HOME/.local/bin/tmux
fi

echo "========================================================="
echo "Installing tmux theme."
echo "========================================================="
if [ ! -d $HOME/.tmux/tmux-themepack ]; then
    cd $HOME/.tmux
    git clone https://github.com/jimeh/tmux-themepack.git
fi