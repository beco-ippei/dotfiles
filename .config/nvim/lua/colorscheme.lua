-- カラースキーム設定
-- プラグインが読み込まれるまで待つため、pcoallでエラーを無視

local colorscheme = "tokyonight-night"  -- デフォルトのカラースキーム

-- 他の選択肢：
-- local colorscheme = "catppuccin-mocha"
-- local colorscheme = "rose-pine"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found! Please run :PackerSync", vim.log.levels.WARN)
  return
end
