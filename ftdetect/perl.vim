" Line continuation is used here, remove 'C' from 'cpoptions'
let s:cpo_save = &cpo
set cpo&vim

" https://vim-jp.org/vimdoc-ja/filetype.html#ftdetect
autocmd BufRead,BufNewFile *.pl   setlocal filetype=perl
autocmd BufRead,BufNewFile *.pm   setlocal filetype=perl
autocmd BufRead,BufNewFile *.psgi setlocal filetype=perl
autocmd BufRead,BufNewFile *.t    setlocal filetype=perl
autocmd BufRead,BufNewFile *.cgi  setlocal filetype=perl
autocmd BufRead,BufNewFile *.tdy  setlocal filetype=perl

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
