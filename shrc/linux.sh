


#################### linux section ####################
## paths
export CONDA_HOME=$HOME/conda
export CUDA_HOME=/usr/local/cuda
export LIBRARY_PATH=$CUDA_HOME/lib64:/usr/local/lib:/usr/lib:/usr/lib/x86_64-linux-gnu:/lib:/lib/x86_64-linux-gnu
export LD_LIBRARY_PATH=$LIBRARY_PATH
export PATH=$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH:${CUDA_HOME}/bin
export KUBECONFIG=$HOME/.kube/admin:$HOME/.kube/mlplat

## aliases
alias cown='sudo chown -R zhuhaisheng:zhuhaisheng'
alias tmux='TERM=screen-256color tmux'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zhuhaisheng/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zhuhaisheng/conda/etc/profile.d/conda.sh" ]; then
        . "/home/zhuhaisheng/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/zhuhaisheng/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
