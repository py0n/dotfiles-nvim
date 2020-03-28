" https://github.com/airblade/vim-gitgutter

function deinhook#vim_gitgutter#hookadd()
    let g:gitgutter_sign_added    = '✚'
    let g:gitgutter_sign_modified = '➜'
    let g:gitgutter_sign_removed  = '✘'
endfunction

function deinhook#vim_gitgutter#hookpostsource()
    autocmd MyAugroup VimEnter * :GitGutterEnable

    " デフォルトでは以下のキーマップが設定されている。
    " nmap ]c <Plug>GitGutterNextHunk
    " nmap [c <Plug>GitGutterPrevHunk
endfunction
