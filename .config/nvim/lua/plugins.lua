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

  -- カラースキーム
  use 'folke/tokyonight.nvim'        -- Tokyo Night（暗め、青系）
  use 'catppuccin/nvim'              -- Catppuccin（柔らかい、パステル）
  use({ 'rose-pine/neovim', as = 'rose-pine' })  -- Rose Pine（落ち着いた）
  use 'AlexvZyl/nordic.nvim'         -- Nordic（北欧風、暗め）
  use 'rebelot/kanagawa.nvim'        -- Kanagawa（日本画風）
  use 'ellisonleao/gruvbox.nvim'     -- Gruvbox（レトロ、暖色）
  use 'navarasu/onedark.nvim'        -- OneDark（VSCode風）
  use 'EdenEast/nightfox.nvim'       -- Nightfox（複数バリエーション）
end)
packer.install()


-- Gitの統合
-- vim.cmd [[packadd vim-fugitive]]

