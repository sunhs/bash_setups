echo "========================================================="
echo "Copying files."
echo "========================================================="
profile="$HOME/.bashrc"

if [ -f "$HOME/.bash_profile" ]; then
    profile="$HOME/.bash_profile"
fi

if [ -f "$HOME/.profile" ]; then
    profile="$HOME/.profile"
fi

echo "Replace $profile"
cp .bashrc $HOME
cp .bashrc $profile
cp .tmux.conf $HOME
cp .vimrc $HOME
mkdir -p $HOME/.local/bin
cp fj.sh fastjump $HOME/.local/bin

echo "========================================================="
echo "Installing tmux."
echo "========================================================="
if [ ! -f $HOME/.local/bin/tmux ]; then
    sudo apt-get -y install libevent-dev libncurses-dev
    mkdir -p $HOME/.tmux && cd $HOME/.tmux
    wget https://github.com/tmux/tmux/releases/download/3.1/tmux-3.1.tar.gz
    tar zxf tmux-3.1.tar.gz && rm tmux-3.1.tar.gz
    cd tmux-3.1
    mkdir build && cd build && ../configure && make
    ln -s $HOME/.tmux/tmux-3.1/build/tmux $HOME/.local/bin/tmux
fi

echo "========================================================="
echo "Installing tmux theme."
echo "========================================================="
if [ ! -d $HOME/.tmux/tmux-themepack ]; then
    cd $HOME/.tmux
    git clone https://github.com/jimeh/tmux-themepack.git
fi

echo "========================================================="
echo "Installing vim color scheme."
echo "========================================================="
if [ ! -d $HOME/.vim/colors ]; then
    mkdir -p $HOME/.vim/colors && cd $HOME/.vim
    git clone https://github.com/rafi/awesome-vim-colorschemes.git
    cp awesome-vim-colorschemes/colors/* colors && rm -rf awesome-vim-colorschemes
fi
