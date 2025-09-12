-- JavaScript 用 ftplugin（Lua 版）
-- Vimscript 版からの移行
-- Codex CLI により生成（Vimscript から移行）

-- プレフィックス用のキーマップ
vim.keymap.set({ 'n', 'v' }, '[javascript]', '<Nop>', { buffer = true })
vim.keymap.set({ 'n', 'v' }, '<Space>t', '[javascript]', { buffer = true })

-- 解除
vim.b.undo_ftplugin = table.concat({
  'silent! nunmap <buffer> [javascript]',
  'silent! nunmap <buffer> <Space>t',
  'silent! vunmap <buffer> [javascript]',
  'silent! vunmap <buffer> <Space>t',
}, ' | ')

