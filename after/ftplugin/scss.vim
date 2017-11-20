let s:cpo_save = &cpo
set cpo&vim

nnoremap <buffer> [scss]   <Nop>
nmap     <buffer> <Space>t [scss]
vnoremap <buffer> [scss]   <Nop>
vmap     <buffer> <Space>t [scss]

setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2                  " タブ幅2

let b:undo_ftplugin = 'setlocal shiftwidth< softtabstop< tabstop<'

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
