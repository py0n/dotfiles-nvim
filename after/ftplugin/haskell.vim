" # Reference
"
" * $VIMRUNTIME/ftplugin/haskell.vim

let s:save_cpo = &cpo
set cpo-=C

nnoremap <buffer> [haskell] <Nop>
nmap     <buffer> <Space>t  [haskell]

if (executable('stack'))
    " f:format, t:test
    nnoremap <buffer> [haskell]f :%!stylish-haskell<CR>
    nnoremap <buffer> [haskell]t :!stack test<CR>
endif

setlocal nosmartindent
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=8

let b:undo_ftplugin = 'setlocal nosmartindent< shiftwidth< softtabstop< tabstop<'

let &cpo = s:save_cpo
unlet s:save_cpo
