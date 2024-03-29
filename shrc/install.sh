shell_chosen=$1
platform=$2
use_posh=$3

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

if [ $use_posh -gt 0 ]; then
    echo "Using POSH"
    cat oh-my-posh/oh-my-posh.sh >> $tmpfn

    rm -f ~/.omp.json
    cp oh-my-posh/omp.json ~/.omp.json
fi

rm -f ~/.${shell_chosen}rc*
mv $tmpfn ~/.${shell_chosen}rc

if [ $shell_chosen = "bash" ]; then
    rm -f ~/.profile
    ln -sf ~/.bashrc ~/.profile
fi