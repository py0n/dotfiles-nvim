" ddu.vimの設定
" https://zenn.dev/shougo/articles/ddu-vim-beta
function deinhook#ddu#hookadd()
    call ddu#custom#patch_global({
    \   'ui': 'ff',
    \   'sources': [
    \       {'name': 'file_rec', 'params': {}},
    \       {'name': 'line'},
    \   ],
    \   'sourceOptions': {
    \       '_': {
    \           'matchers': ['matcher_substring'],
    \       },
    \   },
    \   'kindOptions': {
    \       'file': {
    \           'defaultAction': 'open',
    \       },
    \   },
    \   'uiParams': {
    \       'ff': {
    \           'split': 'floating',
    \       },
    \   }
    \ })

    autocmd FileType ddu-ff call s:ddu_my_settings()
    function! s:ddu_my_settings() abort
        nnoremap <buffer><silent> <CR>    <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
        nnoremap <buffer><silent> <Space> <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
        nnoremap <buffer><silent> i       <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
        nnoremap <buffer><silent> q       <Cmd>call ddu#ui#ff#do_action('quit')<CR>
    endfunction

    autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
    function! s:ddu_filter_my_settings() abort
        inoremap <buffer><silent> <CR> <Esc><Cmd>close<CR>
        nnoremap <buffer><silent> <CR> <Cmd>close<CR>
        nnoremap <buffer><silent> q    <Cmd>close<CR>
    endfunction

    nnoremap [denite] <Nop>
    nmap     <Space>u [denite]

    " ファイル検索
    nnoremap <silent> [denite]g <Cmd>call ddu#start({'sources': [{'name':'file_rec', 'params': {}}]})<CR>
    " ファイル内検索
    nnoremap <silent> [denite]o <Cmd>call ddu#start({'sources': [{'name':'line'}]})<CR>
endfunction
