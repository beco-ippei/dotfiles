unsetopt correct
unsetopt correct_all
bindkey -v

alias ll='ls -la'

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# color
export CLICOLOR=1
export LSCOLORS=dxgxcxdxcxegedabagacad
