" Line continuation is used here, remove 'C' from 'cpoptions'
let s:cpo_save = &cpo
set cpo&vim

augroup FtdetectToml
    autocmd!
    autocmd BufRead,BufNewFile *.toml setlocal filetype=toml
augroup END

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
