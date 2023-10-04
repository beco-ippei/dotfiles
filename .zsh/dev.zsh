export PAGER=less
export EDITOR=vim

#alias php_ctags="ctags --languages=php -f ~/.tags/php.tags `pwd`"
alias php_ctags="ctags -R --languages=php -f ~/.tags/php.tags 2>/dev/null"
alias php_dict="php -r '\$f=get_defined_functions();echo join(\"\n\", \$f[\'internal\']);'|sort > ~/.vim/dict/php.dict"

# export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
# export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"

alias git-ls-ignore="git ls-files -v | grep -e '^[^H]'"
# http://qiita.com/usamik26/items/56d0d3ba7a1300625f92

export PATH="/var/devel/tools/bin/:$PATH"

export PATH="$(pyenv root)/shims:${PATH}"
# alias python="python3"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# for npm
export PATH="/Users/i.kato/.pyenv/shims/python2:${PATH}"

