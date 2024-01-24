-- base config
vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
--vim.wo.number = true

local options = {
  title = true,
  number = true,
  ignorecase = true,
  wildmenu = true,
  wrap = true,
  swapfile = false,
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
  -- search
  wrapscan = false,
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
