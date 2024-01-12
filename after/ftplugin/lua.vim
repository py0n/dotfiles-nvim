let s:save_cpo = &cpo
set cpo-=C

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4

let b:undo_ftplugin = 'setlocal noexpandtab< shiftwidth< tabstop<'

let &cpo = s:save_cpo
unlet s:save_cpo
