" Initialize dein.vim {{{
let s:dein_dir = $MYDEINCACHEDIR . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p'), '/$', '', '')

if dein#load_state($MYDEINCACHEDIR)
    call dein#begin($MYDEINCACHEDIR)
    call dein#load_toml($MYVIMRCDIR . '/dein.toml')
    call dein#load_toml($MYVIMRCDIR . '/dein.ddc.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
" }}}

" Check dein {{{
if dein#check_install()
    call dein#install()
endif " }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
