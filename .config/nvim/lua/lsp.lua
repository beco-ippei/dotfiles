-- plugins.lua の後に読み込む

-- LSPの設定
local lspconfig = require('lspconfig')

-- 1. LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }

  lspconfig[server].setup(opt)
end })

-- 2. build-in LSP function
-- keyboard shortcut
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
--vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
-- Reference highlight
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
-- エラーになったので避けておく
--  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()

-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
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

-- TODO: keymap のサンプル
-- local on_attach = function(client, bufnr)
--   -- LSPサーバーのフォーマット機能を無効にするには下の行をコメントアウト
--   -- 例えばtypescript-language-serverにはコードのフォーマット機能が付いているが代わりにprettierでフォーマットしたいときなど
--   -- client.resolved_capabilities.document_formatting = false
-- 
--   local set = vim.keymap.set
--   set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
--   set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
--   set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
--   set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
--   set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
--   set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
--   set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
--   set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
--   set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
--   set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
--   set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
--   set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
--   set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
--   set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
--   set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
--   set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
--   set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
-- end

-- cmp.setup.cmdline('/', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })
-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = "path" },
--     { name = "cmdline" },
--   },
-- })

-- 補完の設定
--local cmp = require "cmp"
--local default_config = require "cmp.config.default"()
--cmp.setup({
--  sources = cmp.config.sources({
--    { name = "nvim_lsp" },
--    { name = "nvim_lsp_signature_help" },
--  }),
--})

-- TypeScript / JavaScript用の設定
lspconfig.tsserver.setup{}

-- python
lspconfig.pyright.setup{}

-- Ruby用の設定
--lspconfig.steep.setup({
--  on_attach = function(client, buffer)
--    on_attach(client, bufnr)
--    -- 手動で型チェックリストを送るコマンド
--    vim.keymap.set("n", "<space>ct", function()
--      client.request("$/typecheck", { guid = "typecheck" .. os.time() }, function() end, bufnr)
--    end, { silent = true, buffer = bufnr })
--  end,
--  on_new_config = function(config, root_dir)
--    -- bundler 環境下で起動する場合の調整
--    add_bundle_exec(config, "steep", root_dir)
--    return config
--  end,
--})

-- ruby / rails
lspconfig.solargraph.setup{}

-- ReactやRailsの開発でよく使用されるテキストオブジェクトや移動の拡張
-- vim.cmd [[packadd vim-textobj-user]]
-- vim.cmd [[packadd vim-textobj-rubyblock]]
