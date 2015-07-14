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
