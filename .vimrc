"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
set nocompatible
set fileformats=unix,dos,mac
set vb t_vb=
set backspace=indent,eol,start
" OSのクリップボードを使用する
set clipboard+=unnamed
"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed
" Mac ClipBoard
"vmap <silent> sy :!pbcopy; pbpaste<CR>
"map <silent> sp <esc>o<esc>v:!pbpaste<CR>

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
set nobackup
set writebackup
set noswapfile

"----------------------------------------------------
" 検索関係
"----------------------------------------------------
set history=200
set ignorecase
set nowrapscan
set incsearch

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
set title
"set list
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

"----------------------------------------------------
" カーソル行のハイライト
"----------------------------------------------------
set cursorline
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinEnter,BufRead * set cursorline
"augroup END

":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=White guibg=White

"----------------------------------------------------
" インデント
"----------------------------------------------------
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set cindent

"----------------------------------------------------
" 国際化関係
"----------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
"set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
"set fileencodings+=,ucs-2le,ucs-2,utf-8
set fencs=utf-8,iso-2022-jp,euc-jp

"----------------------------------------------------
" ファイルタイプ
"----------------------------------------------------
filetype on
filetype indent on
filetype plugin on

"----------------------------------------------------
" 入力支援
"----------------------------------------------------

"縦方向移動支援
nnoremap <C-j> 5j
nnoremap <C-k> 5k

"#TODO: そのうちやる
""----------------------------------------------------
"" vim-rubyの設定
""----------------------------------------------------
""<C-Space>でomni補完
""imap <C-Space> <C-x><C-o>
""imap <c-Space> <c-x><c-o>
"
"let ruby_space_errors=1
""compiler ruby
"
""Rubyのオムニ補完を設定(ft-ruby-omni)
""let g:rubycomplete_buffer_loading = 1
""let g:rubycomplete_classes_in_global = 1
""let g:rubycomplete_rails = 1
"autocmd FileType perl,rb,php,html,erl set cindent
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
""autocmd FileType ruby,eruby set omnifunc=syntaxcomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"
""----------------------------------------------------
""rails.vimの設定
""----------------------------------------------------
"let g:rails_level = 4
"let g:rails_default_file="app/controllers/application.rb"
"let g:rails_devalut_database = 'mysql'
"

"------------------------------------
" vim-rails.vim
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
let g:rails_default_file='config/database.yml'
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
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'spec'}




""----------------------------------------------------
"" helpを素早くひく
""----------------------------------------------------
"" Ctrl-iでヘルプ
""nnoremap <C-i>  :<C-u>help<Space>
"" カーソル下のキーワードをヘルプでひく
""nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>
"
""----------------------------------------------------
"" (),[],{},<>,””,’’,“入力+()の中にカーソル戻す
""----------------------------------------------------
"imap {} {}<Left>
"imap  <Left>
"imap () ()<Left>
"imap “” “”<Left>
"imap ” ”<Left>
"imap <> <><Left>
"imap “ “<Left>
"
""----------------------------------------------------
"" 行末の不要なスペース削除
""----------------------------------------------------
"function! RTrim()
"    let s:cursor = getpos('.')
"    %s/\s\+$//e
"    call setpos('.', s:cursor)
"endfunction
"
"autocmd BufWritePre *.php,*.rb,*.js call RTrim()
"
"" rails.vim
""let g:rails_level=4
""let g:rails_default_file="app/controllers/application.rb"
""let g:rails_default_database="mysql"
"
"" rubycomplete.vim
""autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
""autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
""autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
""autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

