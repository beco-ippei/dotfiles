-- base config
vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
--vim.wo.number = true

-- Syntax highlighting
vim.cmd('syntax enable')
vim.opt.termguicolors = true

local options = {
  title = true,
  number = true,
  relativenumber = true, -- 相対行番号
  ignorecase = true,
  smartcase = true, -- 大文字が含まれる場合のみ大文字小文字を区別
  wildmenu = true,
  wrap = true,
  swapfile = false,
  backup = false, -- バックアップファイルを作らない
  writebackup = false,
  undofile = true, -- undoファイルを有効化
  -- インデント
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  cindent = true,
  -- ホワイトスペース類を表示する
  list = true,
  listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%",
  --statusline = "%F%m%r%h%w\%=[FMT=%{&ff}]\[TYPE=%Y]\%{'[ENC='.(&fenc!=''?&fenc:&enc).']'}\[POS=%05l/%05L]",
  cursorline = true,
  signcolumn = "yes", -- 左端のサインカラムを常に表示
  scrolloff = 8, -- スクロール時の余白
  sidescrolloff = 8,
  -- search
  wrapscan = false,
  hlsearch = true, -- 検索結果をハイライト
  incsearch = true, -- インクリメンタルサーチ
}

---- 見た目の調整
--highlight Comment ctermfg=DarkCyan
--highlight Directory term=bold ctermfg=brown

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Don't auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- 外部でファイルが変更されたら自動で読み直す
vim.o.autoread = true

-- フォーカスが戻った時やバッファに入った時にチェックを走らせる
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- 変更があったことを通知する（お好みで）
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
  pattern = { "*" },
})
