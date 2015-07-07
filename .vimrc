"--------------------------------------------------
" 基本的な設定
"--------------------------------------------------
"TODO OS別で設定変えたい
set nocompatible
filetype off    "TODO what does this?

set fileformats=unix,dos,mac
set vb t_vb=
set backspace=indent,eol,start
" OSのクリップボードを使用する
"set clipboard+=unnamed
"set clipboard=unnamedplus
""ヤンクした文字は、システムのクリップボードに入れる"
"set clipboard=unnamed
" Mac ClipBoard
"vmap <silent> sy :!pbcopy; pbpaste<CR>
"map <silent> sp <esc>o<esc>v:!pbpaste<CR>
vmap ,y "*y
nmap ,p "*p

"--------------------------------------------------
" プラグイン (NeoBundle のみ先に)
"--------------------------------------------------

" if NeoBundle not installed, exec below commands
"$ mkdir -p ~/.vim/bundle
"$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  "call neobundle#rc(expand('~/.vim/bundle/'))
endif
" Let NeoBundle manage NeoBundle
"NeoBundleFetch 'Shougo/neobundle.vim'
" originalrepos on github
"NeoBundle 'Shougo/neobundle.vim'

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
" ファイルタイプ
"--------------------------------------------------
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on     " required!

au BufNewFile,BufRead *.logic setf php

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
set wildmode=list:longest,full

set scrolloff=5
set textwidth=0
set wrap
"ホワイトスペース類を表示する
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set statusline=%F%m%r%h%w\%=[FORMAT=%{&ff}]\[TYPE=%Y]\%{'[ENC='.(&fenc!=''?&fenc:&enc).']'}\[POS=%05l/%05L]

"記号の見た目調整
set ambiwidth=double

set foldmethod=marker

"--------------------------------------------------
" 色の調整
"--------------------------------------------------
hi Directory term=bold ctermfg=brown

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

set foldmethod=marker

"--------------------------------------------------
" 色の調整
"--------------------------------------------------
hi Directory term=bold ctermfg=brown

"--------------------------------------------------
" ファイルタイプ
"--------------------------------------------------
"filetype on
"filetype indent on
"filetype plugin on
"filetype plugin indent on     " required!

au BufNewFile,BufRead *.logic setf php
au BufNewFile,BufRead *.go setf go

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
au FileType help nnoremap <c-j> <Nop>
au FileType help nnoremap <c-k> <Nop>

"インデント時の再選択状態
vnoremap < <gv
vnoremap > >gv


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

call neobundle#begin(expand('~/.vim/bundle/'))
"" Let NeoBundle manage NeoBundle
"NeoBundleFetch 'Shougo/neobundle.vim'

"" originalrepos on github
"NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', { 'build' :
    \ { 'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak', }, }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neomru.vim', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'Shougo/neocomplcache'

NeoBundle 'quickrun.vim'

NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'szw/vim-tags'
"NeoBundle 'taglist.vim'
"NeoBundle 'tagexplorer.vim'

"NeoBundle 'kien/ctrlp.vim'
"TODO うまく入ってない模様
"NeoBundle 'osyo-manga/vim-over'

" for ruby development
au FileType ruby NeoBundle 'vim-ruby/vim-ruby'
au FileType ruby NeoBundle 'rails.vim'
au FileType ruby NeoBundle 'rspec.vim'
au FileType ruby NeoBundle 'taichouchou2/neorspec.vim', {
    \ 'depends' : ['tpope/vim-rails', 'tpope/vim-dispatch'],
    \ 'autoload' : {
    \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
    \ }}

" Add syntax rule
au FileType ruby NeoBundle 'joker1007/vim-markdown-quote-syntax'
au FileType ruby let g:ruby_heredoc_syntax_filetypes = {
    \ "xml" : { "start" : "XML", },
    \ "html" : { "start" : "HTML", },
    \ }

"NeoBundle 'project.vim'
au FileType svn NeoBundle 'svn.vim'

" for php development
au FileType php :set dictionary=~/.vim/dict/php.dict
au FileType php NeoBundle 'php.vim'

" for redmine
NeoBundle 'mattn/webapi-vim'
NeoBundle 'kana/vim-metarw'
NeoBundle 'mattn/vim-metarw-redmine'
NeoBundle 'timcharper/textile.vim'
NeoBundle 'tpope/vim-markdown'

"NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'basyura/unite-yarm'
"NeoBundle 'basyura/rmine.vim'

NeoBundle 'itchyny/calendar.vim'

let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1
let g:calendar_frame = 'default'

"augroup html
"  NeoBundle 'html5.vim'
"augroup END
au FileType css NeoBundle 'hail2u/vim-css3-syntax'
"  NeoBundle 'JulesWang/css.vim'

au FileType javascript NeoBundle 'pangloss/vim-javascript'
au FileType javascript NeoBundle 'JavaScript-syntax'

au FileType nginx NeoBundle 'nginx.vim'
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

au BufRead,BufNewFile *.coffee  set filetype=coffee
au FileType coffee NeoBundle 'kchmck/vim-coffee-script'
"augroup coffee
"  NeoBundle 'kchmck/vim-coffee-script'
"  setlocal sw=2 sts=2 ts=2 et
"augroup END


" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" search plugins from > http://vim-scripts.org/vim/scripts.html
" or :Unite neobundle/search

"au FileType go NeoBundle 'fatih/vim-go'
"au FileType go NeoBundle 'google/vim-ft-go'
NeoBundle 'fatih/vim-go'
NeoBundle 'google/vim-ft-go'

call neobundle#end()

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
    \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif


" for go-lang
"au FileType go set rtp+=$GOROOT/misc/vim
au FileType go exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
au FileType go set noexpandtab


"--------------------------------------------------
" unite.vim and other
"--------------------------------------------------
let g:neomru#file_mru_path=expand('~/.vim/etc/neomru/file')
let g:neomru#directory_mru_path=expand('~/.vim/etc/neomru/direcroty')


"--------------------------------------------------
" neocomplcache
"--------------------------------------------------
" set: dictionary= で辞書ファイルを指定
" #php -r '$f=get_defined_functions();echo join("\n",$f["internal"]);'|sort > ~/.vim/dict/php.dict
" or http://bit.ly/WlfSib   ... or nothing to do?

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

"補完するためのキーワードパターンを指定
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
"日本語を補完候補として取得しないようにする
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"関数を補完するための区切り文字パターン
if !exists('g:neocomplcache_delimiter_patterns')
  let g:neocomplcache_delimiter_patterns = {}
endif
let g:neocomplcache_delimiter_patterns['php'] = ['->', '::', '\']

"タグ補完の呼び出しパターン
if !exists('g:neocomplcache_member_prefix_patterns')
  let g:neocomplcache_member_prefix_patterns = {}
endif
let g:neocomplcache_member_prefix_patterns['php'] = '->\|::'


"--------------------------------------------------
" neosnippet
"--------------------------------------------------
" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" snippet ファイルの場所
let s:my_snippets = '~/.vim/snippets/'
let g:neosnippet#snippets_directory = s:my_snippets

"--------------------------------------------------
" syntastic
"--------------------------------------------------
au FileType php: let g:syntastic_check_on_open = 1
au FileType php: let g:syntastic_enable_signs = 1
au FileType php: let g:syntastic_echo_current_error = 1
au FileType php: let g:syntastic_auto_loc_list = 2
au FileType php: let g:syntastic_enable_highlighting = 1
au FileType php: set statusline+=%#warningmsg#
au FileType php: set statusline+=%{SyntasticStatuslineFlag()}
au FileType php: set statusline+=%*

au FileType php: let g:syntastic_php_php_args = '-l'

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
let g:quickrun_config = {}
let g:quickrun_config['javascript'] = {'command': 'node'}
let g:quickrun_config['rspec'] = {'command': 'bundle exec rspec'}

"--------------------------------------------------
" ctags
"--------------------------------------------------
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
"
" filetype で切り替えるべき
"au FileType php set tags+=$HOME/.tags/php.tags
"au FileType php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/.tags/php.tags `pwd` 2>/dev/null &"
"au FileType php let g:vim_tags_project_tags_command = "ctags --languages=php `pwd` 2>/dev/null &"
"TODO この辺りはもっと綺麗にできると思う
"TODO 環境を増やすと同じタグが複数 .tags ファイルに追加されてしまう。環境で分けるべきか。
"set tags=tags

"--------------------------------------------------
" over.vim
"--------------------------------------------------
"" over.vimの起動
"nnoremap <silent> ,m :OverCommandLine<CR>
"" カーソル下の単語をハイライト付きで置換
"nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
"" コピーした文字列をハイライト付きで置換
"nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"--------------------------------------------------
" vim-metarw-redmine
"--------------------------------------------------
let g:metarw_redmine_server = 'https://m2.d.yumemi.jp/redmine/'
let g:metarw_redmine_apikey = '5f0805ce71c986e1f5ecea126b94b4c5f60c3f12'
let g:rmine_server_url = 'https://m2.d.yumemi.jp/redmine/'
let g:rmine_access_key = '5f0805ce71c986e1f5ecea126b94b4c5f60c3f12'
"let g:unite_yarm_server_url = 'https://m2.d.yumemi.jp/redmine/'
"let g:unite_yarm_access_key = '5f0805ce71c986e1f5ecea126b94b4c5f60c3f12'

"---------------------------------------------------
" for coffee-script
"---------------------------------------------------
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

"autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!


"--------------------------------------------------
" vim-indent-guides
"--------------------------------------------------
" indent-guides を有効にする
"let g:indent_guides_enable_on_vim_startup=1
" 2インデント目からガイドする
let g:indent_guides_start_level = 2
" 自動カラーを無効にして手動で設定する
let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=gray
hi IndentGuidesEven ctermbg=darkgray
" ガイドの幅
let g:indent_guides_guide_size = 1
" ハイライト色の変化の幅 (Terminal では未サポート)
"let g:indent_guides_color_change_percent = 20
" ガイド幅をインデント幅に合わせる
let g:indent_guides_guide_size = &tabstop

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

"autocmd BufWritePre *.rb,*.js call RTrim()
autocmd BufWritePre *.rb call RTrim()

"----------------------------------------------------
" php-debug 設定
"----------------------------------------------------
nnoremap ,d iecho sprintf("debug ---------------- %s:%d <br>\n", __file__, __line__);

"------
" javascript
"-------
augroup javascript
  "TODO: any setting
augroup END

"TODO: そのうちやる
"----------------------------------------------------
" vim-rubyの設定
"----------------------------------------------------
"<C-Space>でomni補完
"imap <C-Space> <C-x><C-o>
"imap <c-Space> <c-x><c-o>

"let ruby_space_errors=1
"compiler ruby

"TODO: neocom を使う？
"Rubyのオムニ補完を設定(ft-ruby-omni)
"let g:rubycomplete_buffer_loading = 1
"let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_rails = 1
"autocmd FileType perl,rb,php,html,erl set cindent
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
""autocmd FileType ruby,eruby set omnifunc=syntaxcomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"------------------------------------
" rails.vim
"------------------------------------
" 有効化
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

"function! SetUpRailsSetting()
"  nmap <buffer><C-C> <Nop>
"  imap <buffer><C-C> <Nop>
"  map <buffer><C-_><C-C> <Nop>
"
"  nmap <buffer><Space>r :R<CR>
"  nmap <buffer><Space>a :A<CR>
"  nmap <buffer><Space>m :Rmodel<Space>
"  nmap <buffer><Space>c :Rcontroller<Space>
"  nmap <buffer><Space>v :Rview<Space>
"  nmap <buffer><Space>s :Rspec<Space>
""  nmap <buffer><Space>m :Rgen model<Space>
""  nmap <buffer><Space>c :Rgen contoller<Space>
""  nmap <buffer><Space>s :Rgen scaffold<Space>
"  nmap <buffer><Space>p :Rpreview<CR>
"  "  au FileType ruby,eruby,ruby.rspec let g:neocomplcache_dictionary_filetype_lists = {
"  "        \'ruby' : $HOME.'/.vim/dict/rails.dict',
"  "        \'eruby' : $HOME.'/.vim/dict/rails.dict'
"  "        \}
"  "  setl dict+=~/.vim/dict/rails.dict
"  "  setl dict+=~/.vim/dict/ruby.dict
"endfunction
"autocmd User Rails call SetUpRailsSetting()
"}}}


"--------------------------------------------------
" ファイルタイプ
"--------------------------------------------------
"filetype on
filetype indent on
filetype plugin on
filetype plugin indent on     " required!

