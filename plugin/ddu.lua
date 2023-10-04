-- ddu.vimの設定
-- https://zenn.dev/shougo/articles/ddu-vim-beta
vim.cmd([[
call ddu#custom#patch_global({
\   'sources': [
\       {'name': 'file_rec', 'params': {}},
\       {'name': 'line'},
\       {'name': 'mr'},
\       {'name': 'register'},
\   ],
\ })

call ddu#custom#patch_global({
\   'sourceOptions': {
\       '_': {
\           'matchers': ['matcher_substring'],
\       },
\   },
\ })

call ddu#custom#patch_global({
\   'sourceParams': {
\       'rg': {
\           'args': ['--column', '--no-heading', '--color', 'never'],
\       },
\   },
\ })

call ddu#custom#patch_global({
\   'kindOptions': {
\       'file': {
\           'defaultAction': 'open',
\       },
\       'word': {
\           'defaultAction': 'append',
\       },
\   },
\ })

call ddu#custom#patch_global({
\   'ui': 'ff',
\   'uiParams': {
\       'ff': {
\           'split': 'horizontal',
\       },
\   },
\ })

nnoremap [denite] <Nop>
nmap     <Space>u [denite]

" ファイル検索(rg)
nnoremap <silent> [denite]g :<C-u>DduRg<CR>
" ファイル内検索
nnoremap <silent> [denite]o <Cmd>call ddu#start({'sources': [{'name':'line'}]})<CR>
" レジスタ(マーク)検索
nnoremap <silent> [denite]m <Cmd>call ddu#start({'sources': [{'name':'register'}]})<CR>
" 最近使用したファイル
nnoremap <silent> [denite]p <Cmd>call ddu#start({'sources': [{'name':'mr'}]})<CR>
]])

vim.api.nvim_create_augroup('plugin/ddu', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
    group    = 'plugin/ddu',
    pattern  = 'ddu-ff',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', '<Cmd>call ddu#ui#ff#do_action("itemAction")<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', ' ', '<Cmd>call ddu#ui#ff#do_action("toggleSelectItem")<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'i', '<Cmd>call ddu#ui#ff#do_action("openFilterAction")<CR>', {noremap = true, silent= true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<Cmd>call ddu#ui#ff#do_action("quit")<CR>', {noremap = true, silent = true})
    end
})
vim.api.nvim_create_autocmd('FileType', {
    group    = 'plugin/ddu',
    pattern  = 'ddu-ff-filter',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'i', '<CR>', '<Esc><Cmd>close<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', '<Cmd>close<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<Cmd>close<CR>', {noremap = true, silent = true})
    end
})
