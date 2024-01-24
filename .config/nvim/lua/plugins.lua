-- Packerのインストールと初期設定
-- https://github.com/wbthomason/packer.nvim
vim.cmd [[packadd packer.nvim]]
local packer = require('packer')
packer.startup(function()
  use 'wbthomason/packer.nvim'

  -- language server install
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  --use({
  --  'neoclide/coc.nvim',
  --  branch = 'master'
  --})

  use 'vim-scripts/quickrun.vim'
  -- Telescope
  use({ 'nvim-telescope/telescope.nvim' })
  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  })
  use({ 'nvim-telescope/telescope-file-browser.nvim' })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)
packer.install()


-- テーマとカラースキーム（例: gruvbox）
-- vim.cmd [[colorscheme gruvbox]]

-- Gitの統合
-- vim.cmd [[packadd vim-fugitive]]

