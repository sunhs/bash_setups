ln -sf $(pwd)/vimrc $HOME/.vimrc

if [ ! -d $HOME/.vim/colors ]; then
    mkdir -p $HOME/.vim/colors && cd $HOME/.vim
    git clone https://github.com/rafi/awesome-vim-colorschemes.git
    cp awesome-vim-colorschemes/colors/* colors && rm -rf awesome-vim-colorschemes
fi