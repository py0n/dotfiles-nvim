" # Reference
"
" * $VIMRUNTIME/ftplugin/perl.vim
" * http://whileimautomaton.net/2008/09/07213145

let s:save_cpo = &cpo
set cpo&vim

nnoremap <buffer> [javascript]   <Nop>
nmap     <buffer> <Space>t       [javascript]
vnoremap <buffer> [javascript]   <Nop>
vmap     <buffer> <Space>t       [javascript]

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
