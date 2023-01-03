


#################### mac section ####################
## paths
export CONDA_HOME=$HOME/conda
export LIBRARY_PATH=$LIBRARY_PATH:$LD_LIBRARY_PATH:/opt/homebrew/opt:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
export LD_LIBRARY_PATH=$LIBRARY_PATH
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.cargo/bin:$HOME/.local/bin:$CONDA_HOME/bin:$HOME/go/bin:$PATH
export KUBECONFIG=$HOME/.kube/admin:$HOME/.kube/mlplat

## aliases
alias c="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias sg="ssh -t sg 'TERM=screen-256color tmux a -t fuck -d'"
alias cg="cargo"
