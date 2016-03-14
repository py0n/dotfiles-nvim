" # Reference
"
" * $VIMRUNTIME/ftplugin/haskell.vim

let s:save_cpo = &cpo
set cpo-=C

setlocal nosmartindent
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=8

let b:undo_ftplugin = 'setlocal nosmartindent< shiftwidth< softtabstop< tabstop<'

let &cpo = s:save_cpo
unlet s:save_cpo
