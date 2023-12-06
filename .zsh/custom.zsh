unsetopt correct
unsetopt correct_all
unsetopt share_history
bindkey -v

alias :q='exit'

alias greps='grep -rn --exclude-dir "\.svn" '
alias swap='~/tools/bin/swap.sh'
alias iphp='~/tools/bin/iphp'
alias l='ls -lA1'

alias find_pi="arp -a | grep 'b8:27:eb' | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+'"

alias vim='nvim'

alias tmuxs='
tmux rename-window zsh
tmux split-window -h
tmux split-window -v -t zsh.0
'
#!/bin/sh
# 
# tmux rename-window zsh #zshの部分はなんでもいい
# # tmux new-window -n zsh #Windowを立ちあげて分割する場合はこっち
#  
#  tmux split-window -h
#  tmux split-window -v -t zsh.0


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

