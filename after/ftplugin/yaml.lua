-- YAML 用 ftplugin（Lua 版）
-- Vimscript 版からの移行
-- Codex CLI により生成（Vimscript から移行）

-- インデント: 2 スペース
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2

-- 解除
vim.b.undo_ftplugin = table.concat({
  'setlocal expandtab< shiftwidth< softtabstop< tabstop<',
}, ' | ')

