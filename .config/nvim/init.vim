"--------------------------------------------------
" 基本的な設定
"--------------------------------------------------
set title
set number
"set hlsearch
set wildmenu
set wrap
set noswapfile

"--------------------------------------------------
" インデント
"--------------------------------------------------
"set autoindent
set tabstop=2
"set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set cindent

"--------------------------------------------------
" 見た目の調整
"--------------------------------------------------
highlight Comment ctermfg=DarkCyan
highlight Directory term=bold ctermfg=brown
"ホワイトスペース類を表示する
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set statusline=%F%m%r%h%w\%=[FMT=%{&ff}]\[TYPE=%Y]\%{'[ENC='.(&fenc!=''?&fenc:&enc).']'}\[POS=%05l/%05L]
set cursorline

"--------------------------------------------------
" ファイル・国際化関係
"--------------------------------------------------
set encoding=utf-8
cnoremap init :<C-u>edit $MYVIMRC<CR>
noremap <Space>s :source $MYVIMRC<CR>
noremap <Space>w :<C-u>w<CR>

"--------------------------------------------------
" 入力支援
"--------------------------------------------------
"縦方向移動支援
nnoremap <c-j> 5j
nnoremap <c-k> 5k
au FileType help nnoremap <c-j> <Nop>
au FileType help nnoremap <c-k> <Nop>
"インデント時の再選択状態
vnoremap < <gv
vnoremap > >gv


" ------------------------------------------------------------
" dein.vim set up
" ------------------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" dir
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = expand('~/.config/nvim')

" Required:
"set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
execute 'set runtimepath^=' . s:dein_repo_dir

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Add or remove your plugins here like this:
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

