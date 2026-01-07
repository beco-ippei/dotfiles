-- print('init.lua')

require('base')
require('plugins')
require('treesitter')
require('editing')  -- 編集機能（autopairs, surround, comment, gitsigns, emmet）
require('statusline')
require('keymap')
require('lsp')
require('colorscheme')  -- プラグイン読み込み後にカラースキームを設定

