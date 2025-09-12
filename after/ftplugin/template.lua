-- Template 用 ftplugin（Lua 版）
-- Vimscript 版からの移行
-- Codex CLI により生成（Vimscript から移行）

-- プレフィックス用のキーマップ
vim.keymap.set({ 'n', 'v' }, '[template]', '<Nop>', { buffer = true })
vim.keymap.set({ 'n', 'v' }, '<Space>t', '[template]', { buffer = true })

-- インデント: 2 スペース
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2

-- 解除
vim.b.undo_ftplugin = table.concat({
  'setlocal shiftwidth< softtabstop< tabstop<',
  'silent! nunmap <buffer> [template]',
  'silent! nunmap <buffer> <Space>t',
  'silent! vunmap <buffer> [template]',
  'silent! vunmap <buffer> <Space>t',
}, ' | ')

