if [ -f $HOME/.zsh/local_env.zsh ]; then
  source $HOME/.zsh/local_env.zsh
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="ippei"
#ZSH_THEME="random"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git rbenv rails ruby svn php)
plugins=(git rbenv rails ruby php)

# Customize to your needs...
export PATH="$PATH:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin"

source $ZSH/oh-my-zsh.sh

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
#export PATH=$u

