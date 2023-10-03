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

function! s:ddu_my_settings() abort
    nnoremap <buffer><silent> <CR>    <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
    nnoremap <buffer><silent> <Space> <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
    nnoremap <buffer><silent> i       <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
    nnoremap <buffer><silent> q       <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction
autocmd FileType ddu-ff call s:ddu_my_settings()

function! s:ddu_filter_my_settings() abort
    inoremap <buffer><silent> <CR> <Esc><Cmd>close<CR>
    nnoremap <buffer><silent> <CR> <Cmd>close<CR>
    nnoremap <buffer><silent> q    <Cmd>close<CR>
endfunction
autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()

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
