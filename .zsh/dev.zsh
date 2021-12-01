export PAGER=less
export EDITOR=vim

#alias php_ctags="ctags --languages=php -f ~/.tags/php.tags `pwd`"
alias php_ctags="ctags -R --languages=php -f ~/.tags/php.tags 2>/dev/null"
alias php_dict="php -r '\$f=get_defined_functions();echo join(\"\n\", \$f[\'internal\']);'|sort > ~/.vim/dict/php.dict"

alias git-ls-ignore="git ls-files -v | grep -e '^[^H]'"
# http://qiita.com/usamik26/items/56d0d3ba7a1300625f92

export PATH="/var/devel/tools/bin/:$PATH"

