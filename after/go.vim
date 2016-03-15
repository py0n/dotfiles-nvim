" # Reference
"
" * $VIMRUNTIME/ftplugin/go.vim

let s:save_cpo = &cpo
set cpo-=C

set noexpandtab
set tabstop=4
set shiftwidth=4

let b:undo_ftplugin = 'setlocal noexpandtab< shiftwidth< tabstop<'

let &cpo = s:save_cpo
unlet s:save_cpo
