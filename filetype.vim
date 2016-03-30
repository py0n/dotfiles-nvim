" Ref. $VIMRUNTIME/filetype.vim
if exists('did_load_filetypes')
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

augroup filetypedetect
    " html {{{
    autocmd BufRead,BufNewFile *.tmpl setlocal filetype=html
    " }}}
    " markdown {{{
    autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
    " }}}
    " perl {{{
    autocmd BufRead,BufNewFile *.p[lm] setlocal filetype=perl
    autocmd BufRead,BufNewFile *.psgi  setlocal filetype=perl
    autocmd BufRead,BufNewFile *.t     setlocal filetype=perl
    autocmd BufRead,BufNewFile *.cgi   setlocal filetype=perl
    autocmd BufRead,BufNewFile *.tdy   setlocal filetype=perl
    " toml {{{
    autocmd BufRead,BufNewFile *.toml setlocal filetype=toml
    " }}}
    " }}}
augroup END

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
