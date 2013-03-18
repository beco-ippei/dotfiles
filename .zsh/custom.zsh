unsetopt correct
unsetopt correct_all
unsetopt share_history
bindkey -v

alias :q='exit'

alias greps='grep -rn --exclude-dir "\.svn" '
alias swap='~/tools/bin/swap.sh'
alias iphp='~/tools/bin/iphp'


# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# color
export CLICOLOR=1
export LSCOLORS=dxgxcxdxcxegedabagacad

export TODAY=`date +%Y%m%d`

