shell_chosen=$1

if [ $shell_chosen = "bash" ]; then
    echo "Setting up bash"
elif [ $shell_chosen = "zsh" ]; then
    echo "Setting up zsh"
else
    echo "Please choose bash or zsh"
    exit 1
fi

echo "========================================================="
echo "Copying files."
echo "========================================================="
if [ $shell_chosen = "bash" ]; then
    profile="$HOME/.bashrc"

    if [ -f "$HOME/.bash_profile" ]; then
        profile="$HOME/.bash_profile"
    fi

    if [ -f "$HOME/.profile" ]; then
      profile="$HOME/.profile"
    fi

    ln -sf $(pwd)/.bashrc $HOME
    ln -sf $(pwd)/.bashrc $HOME/$profile
else
    ln -sf $(pwd)/.zshrc $HOME
fi