ln -sf $(pwd).vimrc $HOME

echo "========================================================="
echo "Installing vim color scheme."
echo "========================================================="
if [ ! -d $HOME/.vim/colors ]; then
    mkdir -p $HOME/.vim/colors && cd $HOME/.vim
    git clone https://github.com/rafi/awesome-vim-colorschemes.git
    cp awesome-vim-colorschemes/colors/* colors && rm -rf awesome-vim-colorschemes
fi