if [[ $(hostname) == "$DEFAULT_HOST" ]] ; then
    host=""
else
    host="%m"
fi
if [[ $(whoami) == "$DEFAULT_USER" ]] ; then
    user=""
else
    user="%m"
fi
if [ -z "${user}${host}" ] ; then
    at=''
    userdirsep=''
else
    at='@'
    userdirsep=":"
fi
function pwdsubst(){
    cwd=$(pwd)
    #for subst in ~/.config/zsh/ps1_subst/* ; do
    for subst in "${PS1_SUBST[@]}"; do
        cwd=$(echo -n ${cwd} | sed -f <(cat - <<< "$subst"))
    done
    echo -n "${cwd}"
}
if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
    PROMPT='[%{$fg[red]%}${user}%{$reset_color%}${at}%{$fg[magenta]%}${host}%{$reset_color%}${userdirsep}%{$fg[blue]%}$(pwdsubst)%{$reset_color%}$(git_prompt_info)] %# '

    ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[green]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

    RPROMPT='${return_code}$(git_prompt_status)%{$reset_color%}'

    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else
    PROMPT='[%n@%m:$(pwdsubst)$(git_prompt_info)] %# '

    ZSH_THEME_GIT_PROMPT_PREFIX=" on"
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%? ↵)"

    RPROMPT='${return_code}$(git_prompt_status)'

    ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
    ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi
