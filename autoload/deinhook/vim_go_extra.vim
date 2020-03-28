" https://github.com/vim-jp/vim-go-extra

function deinhook#vim_go_extra#hookadd()
    let g:gofmt_command = 'goimports'
    autocmd MyAugroup BufWritePre *.go Fmt
endfunction
