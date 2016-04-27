" Initialize dein.vim {{{
let s:dein_dir = $MYDEINCACHEDIR . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p'), '/$', '', '')

let s:dein_toml      = $MYVIMRCDIR . '/dein.toml'
let s:dein_lazy_toml = $MYVIMRCDIR . '/dein_lazy.toml'

if dein#load_state($MYDEINCACHEDIR)
    call dein#begin($MYDEINCACHEDIR, [s:dein_toml])
    call dein#load_toml(s:dein_toml)
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
" }}}

" deoplete {{{
" https://github.com/Shougo/deoplete.nvim
if has('nvim') && has('python3')
    let g:deoplete#enable_at_startup = 1
    call dein#add('Shougo/deoplete.nvim')
endif " }}}

" Check dein {{{
if dein#check_install()
    call dein#install()
endif " }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
