" http://kannokanno.hatenablog.com/entry/20120805/1344115812
" ':help ft-vim-indent' を参照。
if &shiftwidth >= 3
    let g:vim_indent_cont=&shiftwidth-3
else
    let g:vim_indent_cont=0
endif
