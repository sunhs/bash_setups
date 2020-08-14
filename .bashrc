## settings
function set_prompt() {
    PS1="\[\e[1;36m\]\w\[\e[0m\] "
    local branch=`parse_git_branch`
    if [ ! "${branch}" == "" ]; then
        status=`parse_git_dirty`
        PS1="$PS1(\[\e[1;91m\]${branch}\[\e[0m\]\[\e[1;93m\]${status}\[\e[0m\]) "
    fi
    if [ ! "$CONDA_PROMPT_MODIFIER" == "" ] && [ ! "$CONDA_PROMPT_MODIFIER" == "(base) " ]; then
        PS1="$CONDA_PROMPT_MODIFIER $PS1";
    fi
}

# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        echo "${BRANCH}"
    else
        echo ""
    fi
}

# get current status of git repo
# 0 means true, 1 means false
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    # dirty
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    notstaged=`echo -n "${status}" 2> /dev/null | grep "Changes not staged for commit" &> /dev/null; echo "$?"`
    dirty="1"
    if [ "${untracked}" == "0" ] || [ "${notstaged}" == "0" ]; then
        dirty="0"
    fi
    # staged
    staged=`echo -n "${status}" 2> /dev/null | grep "Changes to be committed" &> /dev/null; echo "$?"`
    # committed
    committed=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    bits=''
    if [ "${dirty}" == "0" ]; then
        bits="~"
    fi
    if [ "${staged}" == "0" ]; then
        bits="${bits}+"
    fi
    if [ "${committed}" == "0" ]; then
        bits="${bits}>"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

PROMPT_COMMAND=set_prompt
export LANG=en_US.UTF-8 
export TERM=xterm-256color
export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb
bind 'set completion-ignore-case on'
#bind 'set show-all-if-ambiguous on'

## paths
export CONDA_HOME=$HOME/conda
export CUDA_HOME=/usr/local/cuda
export LIBRARY_PATH=$CUDA_HOME/lib64:/usr/local/lib:/usr/lib:/usr/lib/x86_64-linux-gnu:/lib:/lib/x86_64-linux-gnu
export LD_LIBRARY_PATH=$LIBRARY_PATH
export PATH=$HOME/.local/bin:$CONDA_HOME/bin:$PATH:${CUDA_HOME}/bin
export HISTCONTROL=ignoredups

## sources
source $HOME/.local/bin/fj.sh

## aliases
alias grep='grep --color=auto'
alias ls='ls --color'
alias cown='sudo chown -R zhuhaisheng:zhuhaisheng'
