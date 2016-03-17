" # Reference
"
" * $VIMRUNTIME/ftplugin/go.vim

let s:save_cpo = &cpo
set cpo-=C

" http://deris.hatenablog.jp/entry/2013/05/02/192415
nnoremap <buffer> [go]     <Nop>
nmap     <buffer> <Space>t [go]

setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

let b:undo_ftplugin = 'setlocal noexpandtab< shiftwidth< tabstop<'

let &cpo = s:save_cpo
unlet s:save_cpo
