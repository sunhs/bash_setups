#! bash oh-my-bash.module

# rr is a simple one-liner prompt inspired by robbyrussell from ohmyzsh themes.
#
# Looks:
#
# ➜  anish ~ cd .bash-it/themes/dulcie
# ➜  anish custom-dulcie git:(master ✓) # with git
#
# Configuration. Change these by adding them in your .bash_profile

function _omb_theme_PROMPT_COMMAND() {
    local code=$?
    local arrow_color="${_omb_prompt_bold_red}"
    if [ $code -eq 0 ]; then
        arrow_color="${_omb_prompt_bold_green}"
    fi
    local arrow="${arrow_color}➜${_omb_prompt_reset_color}"
    local base_directory="${_omb_prompt_bold_cyan}\W${_omb_prompt_reset_color}"
    local SCM_THEME_PROMPT_PREFIX="${_omb_prompt_bold_blue}(${_omb_prompt_red}"
    local SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_bold_blue})${_omb_prompt_reset_color}"
    local SCM_THEME_PROMPT_CLEAN="${_omb_prompt_bold_green} ✓${_omb_prompt_reset_color}"
    local SCM_THEME_PROMPT_DIRTY="${_omb_prompt_bold_red} ✗${_omb_prompt_reset_color}"

    local conda_env=""
    if [ ! "$CONDA_DEFAULT_ENV" == "" ] && [ ! "$CONDA_DEFAULT_ENV" == "base" ]; then
        conda_env="($CONDA_DEFAULT_ENV) ";
    fi

    PS1="${arrow} ${conda_env}${base_directory} "

    local scm_info=$(scm_prompt_info)

    PS1+=${scm_info:+$scm_info }
    PS1+=${_omb_prompt_normal}
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
