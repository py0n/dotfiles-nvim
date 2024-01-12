" Line continuation is used here, remove 'C' from 'cpoptions'
let s:cpo_save = &cpo
set cpo&vim

" https://vim-jp.org/vimdoc-ja/filetype.html#ftdetect
autocmd BufRead,BufNewFile *.html setlocal filetype=perl
autocmd BufRead,BufNewFile *.tmpl setlocal filetype=html

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
