# this theme is ippei's org

PROMPT='%{$fg_bold[green]%}@%m%{$fg_bold[blue]%}$(git_prompt_info) %{$reset_color%}» '

RPROMPT=$'%{$fg[cyan]%}[%2~]%{$fg[white]%}%*%{$fg[green]%}(%h)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="(git:%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

