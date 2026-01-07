-- 編集機能の設定（autopairs, surround, comment, emmet）

-----------------------------------------------------------
-- 1. Autopairs（自動ペア）
-----------------------------------------------------------
local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
if autopairs_ok then
  autopairs.setup({
    check_ts = true, -- Treesitterと連携
    ts_config = {
      lua = { "string" }, -- Luaの文字列内では無効
      javascript = { "template_string" },
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "vim" },
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey = 'Comment'
    },
  })

  -- nvim-cmpと連携
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

-----------------------------------------------------------
-- 2. Surround（括弧・タグ編集）
-----------------------------------------------------------
local surround_ok, surround = pcall(require, "nvim-surround")
if surround_ok then
  surround.setup({
    -- デフォルト設定で十分
    -- 使い方:
    -- - ys{motion}{char}: 囲む（例: ysiw" で単語を"で囲む）
    -- - ds{char}: 削除（例: ds" で"を削除）
    -- - cs{old}{new}: 変更（例: cs"' で"を'に変更）
  })
end

-----------------------------------------------------------
-- 3. Comment（コメント機能）
-----------------------------------------------------------
local comment_ok, comment = pcall(require, "Comment")
if comment_ok then
  comment.setup({
    -- デフォルト設定で十分
    -- 使い方:
    -- - gcc: 行コメントトグル
    -- - gbc: ブロックコメントトグル
    -- - gc{motion}: モーション範囲をコメント（例: gcap で段落）
    -- ビジュアルモード:
    -- - gc: 選択範囲をコメント
  })
end

-----------------------------------------------------------
-- 4. Gitsigns（Git統合）
-----------------------------------------------------------
local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if gitsigns_ok then
  gitsigns.setup({
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signcolumn = true,  -- サインカラムに表示
    numhl      = false, -- 行番号をハイライト
    linehl     = false, -- 行全体をハイライト
    word_diff  = false, -- 単語単位のdiff

    current_line_blame = false, -- 現在行のblame表示
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 1000,
    },

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      -- キーマップ
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- ナビゲーション
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = '次の変更へ' })

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = '前の変更へ' })

      -- アクション
      map('n', '<leader>hs', gs.stage_hunk, { desc = 'Git: hunk をステージ' })
      map('n', '<leader>hr', gs.reset_hunk, { desc = 'Git: hunk をリセット' })
      map('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = 'Git: 選択範囲をステージ' })
      map('v', '<leader>hr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = 'Git: 選択範囲をリセット' })
      map('n', '<leader>hS', gs.stage_buffer, { desc = 'Git: バッファ全体をステージ' })
      map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Git: ステージをundo' })
      map('n', '<leader>hR', gs.reset_buffer, { desc = 'Git: バッファ全体をリセット' })
      map('n', '<leader>hp', gs.preview_hunk, { desc = 'Git: hunk をプレビュー' })
      map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, { desc = 'Git: blame表示' })
      map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Git: blame表示トグル' })
      map('n', '<leader>hd', gs.diffthis, { desc = 'Git: diff表示' })
      map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Git: diff表示（HEAD）' })
      map('n', '<leader>td', gs.toggle_deleted, { desc = 'Git: 削除行表示トグル' })
    end
  })
end

-----------------------------------------------------------
-- 5. Emmet設定
-----------------------------------------------------------
-- Emmetは自動で有効化される
-- デフォルトのトリガー: <C-y>,
-- Rails/React用のカスタマイズ
vim.g.user_emmet_settings = {
  javascript = {
    extends = 'jsx',
  },
  typescript = {
    extends = 'tsx',
  },
  ['javascript.jsx'] = {
    extends = 'jsx',
  },
  ['typescript.tsx'] = {
    extends = 'tsx',
  },
}

-- Emmetを有効にするファイルタイプ
vim.g.user_emmet_install_global = 0
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "eruby" },
  callback = function()
    vim.cmd("EmmetInstall")
  end,
})
