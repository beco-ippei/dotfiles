# this theme is ippei's org

# set defaults
if [ -z $MY_PROMPT_COLOR ]; then
  MY_PROMPT_COLOR="green"
fi
if [ -z $MY_HOST_NAME ]; then
  MY_HOST_NAME="%m"
fi

PROMPT='%{$fg_bold[$MY_PROMPT_COLOR]%}@$MY_HOST_NAME%{$fg_bold[blue]%}$(git_prompt_info) %{$reset_color%}» '

RPROMPT=$'%{$fg[cyan]%}[%2~]%{$fg[white]%}%*%{$fg[green]%}(%h)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="(git:%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

