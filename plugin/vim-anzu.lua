-- https://github.com/osyo-manga/vim-anzu
-- 現在の検索位置を画面に表示

-- ヒットした檢索語が畫面中段に來るやうに
-- `zz'を付加してゐる。
vim.keymap.set('n', 'n', '<Plug>(anzu-n-with-echo)zvzz')
vim.keymap.set('n', 'N', '<Plug>(anzu-N-with-echo)zvzz')
vim.keymap.set('n', '*', '<Plug>(anzu-star-with-echo)zvzz')
vim.keymap.set('n', '#', '<Plug>(anzu-sharp-with-echo)zvzz')

-- 一定時間キー入力がないとき、ウインドウを移動したとき、
-- タブを移動したときに検索ヒット数の表示を消去する。
vim.api.nvim_create_augroup('plugin/vim-anzu', {clear = true})
vim.api.nvim_create_autocmd( 'CursorHold', {
    group   = 'plugin/vim-anzu',
    command = 'call anzu#clear_search_status()',
})
vim.api.nvim_create_autocmd('CursorHoldI', {
    group   = 'plugin/vim-anzu',
    command = 'call anzu#clear_search_status()',
})
vim.api.nvim_create_autocmd('WinLeave', {
    group   = 'plugin/vim-anzu',
    command = 'call anzu#clear_search_status()',
})
vim.api.nvim_create_autocmd('TabLeave', {
    group   = 'plugin/vim-anzu',
    command = 'call anzu#clear_search_status()',
})
