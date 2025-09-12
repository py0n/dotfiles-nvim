-- Markdown 用 ftplugin（Lua 版）
-- Vimscript 版からの移行
-- Codex CLI により生成（Vimscript から移行）

-- 表示/レイアウト関連
vim.opt_local.ambiwidth = 'single'
vim.opt_local.display = 'lastline'
vim.opt_local.linebreak = true

-- インデント: Markdown は 2 で運用
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2

-- 折り返し/折りたたみ
vim.opt_local.textwidth = 0
vim.opt_local.foldlevel = 100

-- 解除（別 filetype に変わる際に実行される）
vim.b.undo_ftplugin = table.concat({
    'setlocal ambiwidth< display< linebreak<',
    'setlocal shiftwidth< softtabstop< tabstop< textwidth< foldlevel<',
}, ' | ')
