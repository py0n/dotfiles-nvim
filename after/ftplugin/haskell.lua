-- Haskell 用 ftplugin（Lua 版）
-- Vimscript 版からの移行
-- Codex CLI により生成（Vimscript から移行）

-- プレフィックス用のキーマップ
vim.keymap.set('n', '[haskell]', '<Nop>', { buffer = true })
vim.keymap.set('n', '<Space>t', '[haskell]', { buffer = true })

-- stack があれば便利キーマップを追加
if vim.fn.executable('stack') == 1 then
  -- f: フォーマット（stylish-haskell）
  vim.keymap.set('n', '[haskell]f', '<Cmd>%!stylish-haskell<CR>', { buffer = true })
  -- t: テスト実行（stack test）
  vim.keymap.set('n', '[haskell]t', '<Cmd>!stack test<CR>', { buffer = true })
end

-- オプション
vim.opt_local.expandtab = true
vim.opt_local.smartindent = false  -- nosmartindent
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 8

-- 解除
vim.b.undo_ftplugin = table.concat({
  'setlocal expandtab< smartindent< shiftwidth< softtabstop< tabstop<',
  'silent! nunmap <buffer> [haskell]',
  'silent! nunmap <buffer> <Space>t',
  'silent! nunmap <buffer> [haskell]f',
  'silent! nunmap <buffer> [haskell]t',
}, ' | ')

