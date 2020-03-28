" https://github.com/altercation/vim-colors-solarized

function deinhook#vim_colors_solarized#hookadd()
    " http://ethanschoonover.com/solarized
    let g:solarized_hitrail    = 1
    let g:solarized_termcolors = 256
    let g:solarized_termtrans  = 1
    let g:solarized_visibility = "high"
    set background=dark
endfunction
