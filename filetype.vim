if exists('did_load_filetypes')
    finish
endif

augroup filetypedetect
    " markdown {{{
    " 禁則処理關係。
    autocmd FileType markdown setlocal display=lastline
    autocmd FileType markdown setlocal linebreak
    autocmd FileType markdown setlocal textwidth=0
    " }}}

    " perl {{{
    autocmd BufRead,BufNewFile *.p[lm] setlocal filetype=perl
    autocmd BufRead,BufNewFile *.psgi  setlocal filetype=perl
    autocmd BufRead,BufNewFile *.t     setlocal filetype=perl
    autocmd BufRead,BufNewFile *.cgi   setlocal filetype=perl
    autocmd BufRead,BufNewFile *.tdy   setlocal filetype=perl

    autocmd FileType perl setlocal smarttab

    autocmd FileType perl nnoremap [perl]   <Nop>
    autocmd FileType perl nmap     <Space>p [perl]
    autocmd FileType perl nnoremap <buffer> [perl]f :%!perltidy<CR>
    autocmd FileType perl vnoremap [perl]   <Nop>
    autocmd FileType perl vmap     <Space>p [perl]
    autocmd FileType perl vnoremap <buffer> [perl]f :!perltidy<CR>

    " Vimでカーソル下のPerlモジュールを開く
    " http://d.hatena.ne.jp/spiritloose/20060817/1155808744
    autocmd FileType perl setlocal isfname-=-
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
    autocmd FileType vim call s:set_vim_indent_cont()
    " }}}
augroup END

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
