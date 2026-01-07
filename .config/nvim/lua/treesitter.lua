-- Treesitter configuration
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  -- Rails + React 開発用のパーサー
  ensure_installed = {
    "ruby",
    "javascript",
    "typescript",
    "tsx",
    "jsx",
    "html",
    "css",
    "scss",
    "json",
    "yaml",
    "sql",
    "bash",
    "lua",
    "vim",
    "vimdoc",
    "markdown",
    "markdown_inline",
  },

  -- 自動インストール
  auto_install = true,

  -- シンタックスハイライト
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- インデント
  indent = {
    enable = true,
  },

  -- 選択範囲の拡張
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
