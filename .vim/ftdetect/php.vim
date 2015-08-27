
" for php development
:set dictionary=~/.vim/dict/php.dict

au FileType php: NeoBundle 'php.vim'

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



"-------
"au FileType php :set dictionary=~/.vim/dict/php.dict
"au FileType php NeoBundle 'php.vim'
"
""--------------------------------------------------
"" syntastic
""--------------------------------------------------
"au FileType php: let g:syntastic_check_on_open = 1
"au FileType php: let g:syntastic_enable_signs = 1
"au FileType php: let g:syntastic_echo_current_error = 1
"au FileType php: let g:syntastic_auto_loc_list = 2
"au FileType php: let g:syntastic_enable_highlighting = 1
"au FileType php: set statusline+=%#warningmsg#
"au FileType php: set statusline+=%{SyntasticStatuslineFlag()}
"au FileType php: set statusline+=%*
"
"au FileType php: let g:syntastic_php_php_args = '-l'

