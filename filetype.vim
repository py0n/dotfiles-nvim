if exists('did_load_filetypes')
    finish
endif

augroup filetypedetect
    " perl {{{
    autocmd BufRead,BufNewFile *.p[lm] setlocal filetype=perl
    autocmd BufRead,BufNewFile *.psgi  setlocal filetype=perl
    autocmd BufRead,BufNewFile *.t     setlocal filetype=perl
    autocmd BufRead,BufNewFile *.cgi   setlocal filetype=perl
    autocmd BufRead,BufNewFile *.tdy   setlocal filetype=perl
    " }}}
augroup END

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
