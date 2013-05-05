"--------------------------------------------------
" 基本的な設定
"--------------------------------------------------
"TODO OS別で設定変えたい
set nocompatible
set fileformats=unix,dos,mac
set vb t_vb=
set backspace=indent,eol,start
"" OSのクリップボードを使用する
"set clipboard+=unnamed
""ヤンクした文字は、システムのクリップボードに入れる"
"set clipboard=unnamed
" Mac ClipBoard
"vmap <silent> sy :!pbcopy; pbpaste<CR>
"map <silent> sp <esc>o<esc>v:!pbpaste<CR>
vmap ,y "*y
nmap ,p "*p


"--------------------------------------------------
" ファイラー
"--------------------------------------------------
" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1

"VimFiler -split -simple -winwidth=35 -no-quit
let g:vimfiler_as_default_explorer = 1
"現在開いているバッファのディレクトリを開く
nnoremap <silent> ,fe :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く
nnoremap <silent> ,fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

" 色の調整
hi Directory term=bold ctermfg=brown


"--------------------------------------------------
" unite.vim
"--------------------------------------------------
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru register<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


"--------------------------------------------------
" プラグイン
"--------------------------------------------------
filetype off    "TODO what does this?

" if NeoBundle not installed, exec below commands
"$ mkdir -p ~/.vim/bundle
"$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" Let NeoBundle manage NeoBundle
"NeoBundleFetch 'Shougo/neobundle.vim'
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc' ", { build : { mac : make -f make_mac.mak, unix : make -f make_unix.mak, }, }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'quickrun.vim'

NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'project.vim'

NeoBundle 'scrooloose/syntastic'

" for ruby development
NeoBundle 'ruby.vim'
NeoBundle 'rails.vim'

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" search plugins from > http://vim-scripts.org/vim/scripts.html
" or :Unite neobundle/search

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
    \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif


"--------------------------------------------------
" neocomplcache
"--------------------------------------------------
" set: dictionary= で辞書ファイルを指定
" #php -r '$f=get_defined_functions();echo join("\n",$f["internal"]);'|sort > ~/.vim/dict/php.dict
" or http://bit.ly/WlfSib   ... or nothing to do?
autocmd BufRead *.php\|*.logic|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'


"--------------------------------------------------
" syntastic
"--------------------------------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_php_php_args = '-l'

"--------------------------------------------------
" VimShell
"--------------------------------------------------
" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>
" ,irb: irbを非同期で起動
nnoremap <silent> ,irb :VimShellInteractive irb<CR>

"--------------------------------------------------
" QuickRun
"--------------------------------------------------
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"--------------------------------------------------
" コピーなど
"--------------------------------------------------
" Ctrl-P で何度もPasteしたい
vnoremap <silent> <C-p> "0p

"--------------------------------------------------
" バックアップ関係
"--------------------------------------------------
set nobackup
set writebackup
set noswapfile

"--------------------------------------------------
" 検索関係
"--------------------------------------------------
set history=200
set ignorecase
set nowrapscan
set incsearch

"--------------------------------------------------
" 表示関係
"--------------------------------------------------
set title
set number
set showcmd
set laststatus=2
set showmatch
set matchtime=2
"set ruler
syntax on
set hlsearch
highlight Comment ctermfg=DarkCyan
set wildmenu

set scrolloff=5
set textwidth=0
set wrap
"ホワイトスペース類を表示する
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set statusline=%F%m%r%h%w\%=[FORMAT=%{&ff}]\[TYPE=%Y]\%{'[ENC='.(&fenc!=''?&fenc:&enc).']'}\[POS=%05l/%05L]

"記号の見た目調整
set ambiwidth=double

"--------------------------------------------------
" 色の調整
"--------------------------------------------------
hi Directory term=bold ctermfg=brown

"--------------------------------------------------
" ファイルタイプ
"--------------------------------------------------
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on     " required!

au BufNewFile,BufRead *.logic setf php

"--------------------------------------------------
" インデント
"--------------------------------------------------
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set cindent
" for php
au FileType php setl sw=4 sts=4 ts=4

"--------------------------------------------------
" 国際化関係
"--------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

"--------------------------------------------------
" 入力支援
"--------------------------------------------------

"縦方向移動支援
nnoremap <c-j> 5j
nnoremap <c-k> 5k

"--------------------------------------------------
" カーソル行のハイライト
"--------------------------------------------------
set cursorline
"TODO: これ、なんだろう。。
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinEnter,BufRead * set cursorline
"augroup END

":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=White guibg=White

"--------------------------------------------------
" helpを素早くひく
"--------------------------------------------------
" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

"--------------------------------------------------
" (),[],{},<>,””,’’,“入力+()の中にカーソル戻す
"--------------------------------------------------
"imap {} {}<Left>
"imap () ()<Left>
"imap “” “”<Left>
"imap ” ”<Left>
"imap <> <><Left>
"imap “ “<Left>

"--------------------------------------------------
" 行末の不要なスペース削除
"--------------------------------------------------
function! RTrim()
    let s:cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', s:cursor)
endfunction

autocmd BufWritePre *.rb,*.js call RTrim()


"TODO: そのうちやる
"----------------------------------------------------
" vim-rubyの設定
"----------------------------------------------------
"<C-Space>でomni補完
"imap <C-Space> <C-x><C-o>
"imap <c-Space> <c-x><c-o>

let ruby_space_errors=1
"compiler ruby

"Rubyのオムニ補完を設定(ft-ruby-omni)
"let g:rubycomplete_buffer_loading = 1
"let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_rails = 1
autocmd FileType perl,rb,php,html,erl set cindent
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"------------------------------------
" rails.vim
"------------------------------------
""{{{
"有効化
let g:rails_some_option = 1
let g:rails_level = 2
let g:rails_syntax = 1
let g:rails_statusline = 1
let g:rails_url='http://localhost:3000'
let g:rails_subversion=0
" let g:dbext_default_SQLITE_bin = 'mysql2'
"let g:rails_default_file='config/database.yml'   " ???
let g:rails_default_file="app/controllers/application.rb"
let g:rails_devalut_database = 'mysql'
" let g:rails_ctags_arguments = ''

function! SetUpRailsSetting()
  nmap <buffer><C-C> <Nop>
  imap <buffer><C-C> <Nop>
  map <buffer><C-_><C-C> <Nop>

  nmap <buffer><Space>r :R<CR>
  nmap <buffer><Space>a :A<CR>
  nmap <buffer><Space>m :Rmodel<Space>
  nmap <buffer><Space>c :Rcontroller<Space>
  nmap <buffer><Space>v :Rview<Space>
  nmap <buffer><Space>s :Rspec<Space>
"  nmap <buffer><Space>m :Rgen model<Space>
"  nmap <buffer><Space>c :Rgen contoller<Space>
"  nmap <buffer><Space>s :Rgen scaffold<Space>
  nmap <buffer><Space>p :Rpreview<CR>
  au FileType ruby,eruby,ruby.rspec let g:neocomplcache_dictionary_filetype_lists = {
        \'ruby' : $HOME.'/.vim/dict/rails.dict',
        \'eruby' : $HOME.'/.vim/dict/rails.dict'
        \}
  setl dict+=~/.vim/dict/rails.dict
  setl dict+=~/.vim/dict/ruby.dict
endfunction
autocmd User Rails call SetUpRailsSetting()
"}}}

""----------------------------------------------------
"" RSpec関連
""----------------------------------------------------
"let g:quickrun_config = {}
"let g:quickrun_config['ruby.rspec'] = {'command': 'spec'}

"TODO: 以下は多分残骸
" rails.vim
"let g:rails_level=4
"let g:rails_default_file="app/controllers/application.rb"
"let g:rails_default_database="mysql"

" rubycomplete.vim
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

