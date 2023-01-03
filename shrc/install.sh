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
    bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

    rm -f $HOME/.profile $HOME/.bashrc
    ln -sf $(pwd)/bashrc-$platform $HOME/.profile
    ln -sf $(pwd)/bashrc-$platform $HOME/.bashrc

    cp -r oh-my-bash $HOME/.oh-my-bash
else
    ln -sf $(pwd)/zshrc-$platform $HOME/.zshrc
fi
