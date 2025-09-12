-- Lua 用 ftplugin（Lua 版）
-- Codex CLI により生成（Vimscript から移行）

-- インデント設定（スペース 4）
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

-- 解除（別 filetype に変わる際に実行される）
vim.b.undo_ftplugin = table.concat({
  'setlocal expandtab< shiftwidth< softtabstop< tabstop<',
}, ' | ')

