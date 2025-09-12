-- Go 用 ftplugin（Lua 版）
-- Codex CLI により生成（Vimscript から移行）

-- インデント設定（タブ幅 4、タブを使用）
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- プレフィックス用のキーマップ
-- [go] をダミーにしてプレフィックス化し、<Space>t を [go] に割り当て
vim.keymap.set('n', '[go]', '<Nop>', { buffer = true })
vim.keymap.set('n', '<Space>t', '[go]', { buffer = true })

-- 解除（別 filetype に変わる際に実行される）
vim.b.undo_ftplugin = table.concat({
  'setlocal expandtab< shiftwidth< tabstop<',
  'silent! nunmap <buffer> [go]',
  'silent! nunmap <buffer> <Space>t',
}, ' | ')

