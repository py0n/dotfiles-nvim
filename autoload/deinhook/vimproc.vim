" https://github.com/Shougo/vimproc.vim

function deinhook#vimproc#hookpostupdate()
    if executable('gmake')
        let cmd = 'gmake'
    else
        let cmd = 'make'
    endif
    let g:dein#plugin.build = cmd
endfunction
