" # Reference
"
" * $VIMRUNTIME/ftplugin/markdown.vim
" * http://whileimautomaton.net/2008/09/07213145

let s:cpo_save = &cpo
set cpo-=C

" 禁則処理關係。
setlocal ambiwidth=single
setlocal display=lastline
setlocal linebreak
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal textwidth=0
setlocal foldlevel=100

let b:undo_ftplugin = 'setlocal display< linebreak< textwidth<'

let &cpo = s:cpo_save
unlet s:cpo_save
