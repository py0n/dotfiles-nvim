-- 強制終了保存を無効にする
-- http://deris.hatenablog.jp/entry/2013/05/02/192415
vim.api.nvim_set_keymap('n', 'ZZ', '', {noremap = true})
vim.api.nvim_set_keymap('n', 'ZQ', '', {noremap = true})
vim.api.nvim_set_keymap('n', 'Q',  '', {noremap = true})

-- `<Esc>` を `jk` で代用する。
-- http://deris.hatenablog.jp/entry/2014/05/20/235807
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})

-- コマンドラインモードでの履歴移動改善。
-- http://lingr.com/room/vim/archives/2014/12/13#message-20830819
vim.api.nvim_set_keymap('c', '<Up>',   '<C-p>',  {noremap = true})
vim.api.nvim_set_keymap('c', '<Down>', '<C-n>',  {noremap = true})
vim.api.nvim_set_keymap('c', '<C-p>',  '<Up>',   {noremap = true})
vim.api.nvim_set_keymap('c', '<C-n>',  '<Down>', {noremap = true})

-- 分割ウィンドウの高さ変更。
vim.api.nvim_set_keymap('n', '+', '<C-w>+', {noremap = true})
vim.api.nvim_set_keymap('n', '-', '<C-w>-', {noremap = true})

-- fuzzy-motion
vim.keymap.set('n', 'ss', ':FuzzyMotion<CR>')

-- easy-align
vim.keymap.set({'n','x'}, 'gb', '<Plug>(EasyAlign)')
