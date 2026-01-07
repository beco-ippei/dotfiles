-- カラースキーム設定
-- 使いたいカラースキームのコメントを外して、他をコメントアウトしてください

-- 🌙 Tokyo Night - 暗め、青系、モダン
-- local colorscheme = "tokyonight-night"     -- 標準（暗い）
-- local colorscheme = "tokyonight-storm"     -- 少し明るめ
-- local colorscheme = "tokyonight-moon"      -- 青紫

-- 🎨 Catppuccin - 柔らかい、パステルカラー
-- local colorscheme = "catppuccin-mocha"     -- 暗め（おすすめ）
-- local colorscheme = "catppuccin-macchiato" -- 中間
-- local colorscheme = "catppuccin-frappe"    -- やや明るい
-- local colorscheme = "catppuccin-latte"     -- ライトテーマ

-- 🌹 Rose Pine - 落ち着いた、エレガント
-- local colorscheme = "rose-pine"            -- 標準
-- local colorscheme = "rose-pine-moon"       -- 少し明るめ
-- local colorscheme = "rose-pine-dawn"       -- ライトテーマ

-- ❄️  Nordic - 北欧風、青系、シンプル
-- local colorscheme = "nordic"

-- 🎋 Kanagawa - 日本画風、落ち着いた色合い
local colorscheme = "kanagawa"             -- 標準
-- local colorscheme = "kanagawa-wave"        -- 波
-- local colorscheme = "kanagawa-dragon"      -- 龍

-- 🟤 Gruvbox - レトロ、暖色系
-- local colorscheme = "gruvbox"

-- 🌑 OneDark - VSCode風
-- local colorscheme = "onedark"

-- 🦊 Nightfox - 複数バリエーション
-- local colorscheme = "nightfox"             -- 標準
-- local colorscheme = "dawnfox"              -- 明るめ
-- local colorscheme = "dayfox"               -- ライトテーマ
-- local colorscheme = "duskfox"              -- 夕暮れ
-- local colorscheme = "nordfox"              -- Nord風
-- local colorscheme = "terafox"              -- 緑系
-- local colorscheme = "carbonfox"            -- 黒系

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found! Please run :PackerSync", vim.log.levels.WARN)
  return
end
