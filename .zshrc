# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f $HOME/.zsh/local_env.zsh ]; then
  source $HOME/.zsh/local_env.zsh
fi

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "mafredri/zsh-async"
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# コマンドの履歴機能
# 履歴ファイルの保存先
HISTFILE=$HOME/.zsh_history
# メモリに保存される履歴の件数
HISTSIZE=10000
# HISTFILE で指定したファイルに保存される履歴の件数
SAVEHIST=10000
# Then, source plugins and add commands to $PATH
zplug load

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias ll="ls -l"
alias l="ls -al"


# Customize to your needs...
export PATH="$PATH:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin"

for file in `ls $HOME/.zsh/*.zsh`; do
  source $file
done

# uniq, keep sequence.
pathes=`echo $PATH | sed -e 's/:/\n/g'`
u=`echo $pathes | head -n1`
for p in `echo $pathes`; do
  echo ":${u}:" | grep -q ":${p}:"
  [ "$?" != "0" ] && u="${u}:${p}"
done
export PATH=$u

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh

