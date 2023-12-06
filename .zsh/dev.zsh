export PAGER=less
export EDITOR=vim

alias git-ls-ignore="git ls-files -v | grep -e '^[^H]'"
# http://qiita.com/usamik26/items/56d0d3ba7a1300625f92

DEV_TOOLS_BIN="/var/devel/tools/bin/"
if [ -d $DEV_TOOLS_BIN ]; then
  export PATH="$DEV_TOOLS_BIN:$PATH"
fi

# for npm
export PATH="/Users/i.kato/.pyenv/shims/python2:${PATH}"

