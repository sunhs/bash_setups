shell_chosen=$1
platform=$2

if [ $shell_chosen = "bash" ]; then
    echo "Setting up bash"
elif [ $shell_chosen = "zsh" ]; then
    if [ $platform == "linux" ]; then
        echo "Setting up zsh for linux"
    elif [ $platform == "mac" ]; then
        echo "Setting up zsh for mac"
    else
        echo "Unknown platform $platform"
        exit 1
    fi
else
    echo "Please choose bash or zsh"
    exit 1
fi

if [ $shell_chosen = "bash" ]; then
    rm -rf ~/.oh-my-bash/
    git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
    source ~/.bashrc

    rm -f ~/.profile ~/.bashrc*
    ln -sf $(pwd)/bashrc-$platform ~/.profile
    ln -sf $(pwd)/bashrc-$platform ~/.bashrc

    cp -r $(pwd)/oh-my-bash/* ~/.oh-my-bash/
else
    ln -sf $(pwd)/zshrc-$platform ~/.zshrc
fi
