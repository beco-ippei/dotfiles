#!/bin/zsh
files=(".gitconfig" ".gitignore_global")
files+=(".screenrc" ".tmux.conf" ".vimrc" ".vimshrc" ".zshrc")
files+=(".rspec")
files+=(".oh-my-zsh/themes/ippei.zsh-theme")
files+=(".zsh/custom.zsh" ".zsh/dev.zsh" ".zsh/ruby.zsh")
files+=(".bundler/config")

if [ ! -d "_backup/" ]; then
  mkdir _backup/
fi
if [ ! -d "$HOME/.zsh/" ]; then
  mkdir $HOME/.zsh/
fi
if [ ! -d "$HOME/.bundler/" ]; then
  mkdir $HOME/.bundler/
fi

curdir=`pwd`

for file in $files[@]; do
  bkupdir="${curdir}/_backup/"
  file_dir="${file%/*}"
  if [ $file_dir ] && [ $file_dir != $file ]; then
    bkupdir="${bkupdir}${file_dir}/"
  fi

  case `file -b --mime-type "$HOME/$file" 2>/dev/null` in
    inode/symlink)
      #echo "${file} is already linked"
      ;;
    *)
      if [ ! -d "$bkupdir" ]; then
        mkdir -p $bkupdir
      fi
      if [ -f "$HOME/$file" ]; then
        mv $HOME/$file $bkupdir/
      fi
      ln -s $curdir/$file $HOME/${file}
      echo "${file} is backuped and created symlink"
      ;;
  esac
done

# install neobundle.vim
mkdir -p $HOME/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim

# other type files
file=".zsh/local_env.zsh"
if [ ! -f $HOME/$file ]; then
  cp $curdir/$file $HOME/$file
fi

echo "setup finished !"
