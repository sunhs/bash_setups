shell_chosen=$1
platform=$2

tmpfn="tmp.sh"
touch $tmpfn

echo "Setting up ${shell_chosen} for ${platform}"

if [ $shell_chosen = "bash" ]; then
    if [ ! -d ~/.oh-my-bash ]; then
        git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
    fi

    cp -r $(pwd)/oh-my-bash/* ~/.oh-my-bash/
fi

cat common.sh >> $tmpfn
cat "${platform}.sh" >> $tmpfn
cat "${shell_chosen}.sh" >> $tmpfn
cat oh-my-posh/oh-my-posh.sh >> $tmpfn

rm -f ~/.${shell_chosen}rc*
mv $tmpfn ~/.${shell_chosen}rc

if [ $shell_chosen = "bash" ]; then
    rm -f ~/.profile
    ln -sf ~/.bashrc ~/.profile
fi

rm -f ~/.omp.json
cp oh-my-posh/omp.json ~/.omp.json