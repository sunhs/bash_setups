


#################### common section ####################
export LANG=en_US.UTF-8
# export LC_ALL=C.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f $HOME/.terminfo/x/xterm-24bit ]; then
    export TERM=xterm-24bit
else
    export TERM=xterm-256color
fi

## sources
source $HOME/.local/bin/fj.sh

## aliases
alias grep='grep --color=auto'
alias kc='kubectl'
alias kcsg='kubectl --kubeconfig ~/.kube/admin --context sg'
alias kc-test-sg='kubectl --kubeconfig ~/.kube/rancher --context rancher-test-sg'
alias kceu='kubectl --kubeconfig ~/.kube/admin --context eu'
alias kcna='kubectl --kubeconfig ~/.kube/admin --context na'
alias kccn='kubectl --kubeconfig ~/.kube/admin --context cn'
alias kcin='kubectl --kubeconfig ~/.kube/admin --context in'

function emk() {
    emd_pid=$(ps aux | grep "[e]macs.*-daemon" | grep -v gnupg | awk '{print $2}')
    if [ "$emd_pid" != "" ]; then
        emacsclient -e '(kill-emacs)'
    fi
}
function e() {
    emd_exists=$(ps aux | grep -i "[e]macs.*-daemon" | grep -v gnupg | wc -l)
    if [ $emd_exists -eq 0 ]; then
        emacs --daemon
    fi
    emacsclient -nw $@
}

alias flush='echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"'
