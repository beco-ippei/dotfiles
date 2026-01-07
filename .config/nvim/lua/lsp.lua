-- plugins.lua の後に読み込まれる前提

local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-----------------------------------------------------------
-- 1. Mason & LSP Setup (ここが核心)
-----------------------------------------------------------
mason.setup()

mason_lspconfig.setup({
  -- Rails + React 開発用のLSPサーバー
  ensure_installed = {
    "ruby_lsp",      -- Ruby/Rails
    "ts_ls",         -- TypeScript/JavaScript/React
    "html",          -- HTML
    "cssls",         -- CSS
    "tailwindcss",   -- Tailwind CSS
    "jsonls",        -- JSON
    "eslint",        -- ESLint
  },

  -- ハンドラー定義: ここに書けば個別の .setup{} は不要です
  handlers = {
    function(server_name)
      local opts = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }

      -- Ruby LSP の設定
      if server_name == "ruby_lsp" then
        opts.init_options = {
          formatter = "auto",
          linters = { "rubocop" },
        }
      end

      -- TypeScript/JavaScript の設定
      if server_name == "ts_ls" then
        opts.settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayFunctionParameterTypeHints = true,
            }
          }
        }
      end

      -- Tailwind CSS の設定
      if server_name == "tailwindcss" then
        opts.filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" }
      end

      -- セットアップ実行
      lspconfig[server_name].setup(opts)
    end,
  },
})

-----------------------------------------------------------
-- 2. Keymaps (LSP用ショートカット)
-----------------------------------------------------------
-- K でドキュメント表示
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
-- 定義ジャンプ系
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- 名前変更
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- コードアクション
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- フォーマット
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
vim.keymap.set('v', 'gf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
-- 診断（エラー）表示
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

-- 診断の表示設定（新しいAPI）
vim.diagnostic.config({
  -- インラインでエラーメッセージを表示
  virtual_text = {
    prefix = '●',
    source = 'if_many',
  },
  -- サインカラムにアイコン表示
  signs = true,
  -- 診断メッセージを更新
  update_in_insert = false,
  -- 診断の下線
  underline = true,
  -- 重要度順にソート
  severity_sort = true,
  -- フロートウィンドウの設定
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

-- 診断記号のカスタマイズ
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Reference highlight (カーソル下の単語をハイライト)
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]
-- 自動ハイライトを有効化する場合は以下をコメントアウト解除
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = "lsp_document_highlight",
--   callback = function() vim.lsp.buf.document_highlight() end,
-- })

-----------------------------------------------------------
-- 3. Completion (nvim-cmp)
-----------------------------------------------------------
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp", priority = 1000 },
    { name = "buffer", priority = 500, keyword_length = 3 },
    { name = "path", priority = 250 },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})

