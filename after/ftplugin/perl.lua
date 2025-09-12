-- Perl 用 ftplugin（Lua 版）
-- Vimscript 版からの移行
-- Codex CLI により生成（Vimscript から移行）

-- キーマップ: [perl] をプレフィックス化し、<Space>t を割当
vim.keymap.set({ 'n', 'v' }, '[perl]', '<Nop>', { buffer = true })
vim.keymap.set({ 'n', 'v' }, '<Space>t', '[perl]', { buffer = true })

-- フォーマット: perltidy を全体/選択範囲に適用
vim.keymap.set('n', '[perl]f', '<Cmd>%!perltidy<CR>', { buffer = true })
vim.keymap.set('v', '[perl]f', ':!perltidy<CR>', { buffer = true })

-- オプション: モジュールジャンプ等のための isfname とインデント補助
vim.opt_local.isfname:remove('-')
vim.opt_local.smarttab = true

-- 解除（別 filetype に変わる際に実行される）
vim.b.undo_ftplugin = table.concat({
  'setlocal isfname< smarttab<',
  'silent! nunmap <buffer> [perl]',
  'silent! nunmap <buffer> <Space>t',
  'silent! vunmap <buffer> [perl]',
  'silent! vunmap <buffer> <Space>t',
  'silent! nunmap <buffer> [perl]f',
  'silent! vunmap <buffer> [perl]f',
}, ' | ')

