" https://github.com/fatih/vim-go

function deinhook#vim_go#hookadd()
    let g:go_fmt_command = 'goimports'
    autocmd MyAugroup Filetype go nnoremap <buffer> [go]f :GoFmt
    autocmd MyAugroup Filetype go nnoremap <buffer> [go]l :GoLint
    autocmd MyAugroup Filetype go nnoremap <buffer> [go]t :GoTest
endfunction
