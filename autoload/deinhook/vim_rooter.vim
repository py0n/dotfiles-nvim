" https://github.com/airblade/vim-rooter
" 自動で `project root` に `lcd`

function deinhook#vim_rooter#hookadd()
    let g:rooter_silent_chdir = 1
    let g:rooter_cd_cmd       = "lcd"
endfunction
