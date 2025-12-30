#!/bin/zsh
# エラーで停止、未定義変数の参照禁止
set -eu

# 1. ファイルリストの定義
# ワイルドカードはバッククォートを使わず、そのまま書くのがzsh流
files=(
  ".gitconfig" ".gitignore_global"
  ".screenrc" ".tmux.conf" ".zshrc"
  ".rspec"
  ".zsh/p10k.zsh"
  ".zsh/custom.zsh" ".zsh/dev.zsh" ".zsh/ruby.zsh" ".zsh/go.zsh"
  ".bundle/config"
  ".config/nvim/init.lua"
)
# luaフォルダ内のファイルを安全に追加 (N)は該当なしでもエラーにしないフラグ
files+=(".config/nvim/lua/"*.lua(N))

# 2. 必要なディレクトリの作成 (mkdir -p で一括作成)
mkdir -p _backup
mkdir -p "$HOME/.zsh"
mkdir -p "$HOME/.bundle"
mkdir -p "$HOME/.config/nvim/lua"

curdir=$(pwd)

# 3. ループ処理
# zshの配列展開は "${files[@]}" とダブルクォートで囲むのが安全
for file in "${files[@]}"; do
  # パスが通っていない（空）の場合はスキップ
  [[ -z "$file" ]] && continue
  
  echo " >>> 処理中: $file"
  target="$HOME/$file"
  bkupdir="${curdir}/_backup/${file%/*}"

  # すでに正しいシンボリックリンクがある場合はスキップ
  if [[ -L "$target" ]]; then
    echo "     (すでにリンク済みです)"
    continue
  fi

  # 既存のファイル（実体）がある場合はバックアップ
  if [[ -f "$target" || -d "$target" ]]; then
    mkdir -p "$bkupdir"
    mv "$target" "$bkupdir/"
    echo "     (既存ファイルを _backup に退避しました)"
  fi

  # シンボリックリンクの作成
  # 親ディレクトリがない場合は作成
  mkdir -p "$(dirname "$target")"
  ln -s "$curdir/$file" "$target"
  echo "     ✅ リンクを作成しました"
done

# 4. 個別ファイルのコピー処理
local_env=".zsh/local_env.zsh"
if [[ ! -f "$HOME/$local_env" ]]; then
  cp "$curdir/$local_env" "$HOME/$local_env"
  echo "     ✅ $local_env を初期作成しました"
fi

echo "setup finished !"
