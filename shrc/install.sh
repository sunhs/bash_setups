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
    profile="$HOME/.bashrc"

    if [ -f "$HOME/.bash_profile" ]; then
        profile="$HOME/.bash_profile"
    fi

    if [ -f "$HOME/.profile" ]; then
      profile="$HOME/.profile"
    fi

    ln -sf $(pwd)/bashrc $HOME/.bashrc
    ln -sf $(pwd)/bashrc $HOME/$profile
else
    ln -sf $(pwd)/zshrc-$platform $HOME/.zshrc
fi