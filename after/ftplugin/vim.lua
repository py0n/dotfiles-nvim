-- Vim script 用 ftplugin（Lua 版）
-- Codex CLI により生成（Vimscript から移行）

-- 自動インデント系を無効化
vim.opt_local.autoindent = false
vim.opt_local.smartindent = false

-- 継続行のインデント幅を 0 に（:help ft-vim-indent 参照）
vim.g.vim_indent_cont = 0

-- 後片付け（別 filetype へ切り替え時）
vim.b.undo_ftplugin = table.concat({
  'setlocal autoindent< smartindent<',
}, ' | ')

