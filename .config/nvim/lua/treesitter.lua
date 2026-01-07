-- Treesitter configuration
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  -- インストールする言語パーサー（必要なものを追加）
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "javascript",
    "typescript",
    "python",
    "go",
    "rust",
    "json",
    "yaml",
    "toml",
    "markdown",
    "markdown_inline",
    "bash",
    "html",
    "css",
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
