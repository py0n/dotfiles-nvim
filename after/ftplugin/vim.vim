" # Reference
"
" * $VIMRUNTIME/ftplugin/vim.vim
" * http://whileimautomaton.net/2008/09/07213145

let s:save_cpo = &cpo
set cpo-=C

setlocal noautoindent
setlocal nosmartindent

" http://kannokanno.hatenablog.com/entry/20120805/1344115812
" ':help ft-vim-indent' を参照。
" if &shiftwidth >= 3
"     let g:vim_indent_cont=&shiftwidth-3
" else
"     let g:vim_indent_cont=0
" endif
let g:vim_indent_cont=0

let b:undo_ftplugin = 'setlocal noautoindent< nosmartindent<'

let &cpo = s:save_cpo
unlet s:save_cpo
