" markdown {{{
" 禁則処理關係。
autocmd MyAugroup FileType markdown setlocal display=lastline
autocmd MyAugroup FileType markdown setlocal linebreak
autocmd MyAugroup FileType markdown setlocal textwidth=0
" }}}

" vim {{{
" http://kannokanno.hatenablog.com/entry/20120805/1344115812
" ':help ft-vim-indent' を参照。
function! s:set_vim_indent_cont()
    if &shiftwidth >= 3
        let g:vim_indent_cont=&shiftwidth-3
    else
        let g:vim_indent_cont=0
    endif
endfunction
autocmd MyAugroup FileType vim call s:set_vim_indent_cont()
" }}}
