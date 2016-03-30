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

" Check dein {{{
if dein#check_install()
    call dein#install()
endif " }}}

" deoplete {{{
" https://github.com/Shougo/deoplete.nvim
if has('nvim') && has('python3')
    " `deoplete.nvim` が `dein.vim` で管理できるようになるまで此で凌ぐ。
    let s:deoplete_dir = $MYDEINCACHEDIR . '/repos/github.com/Shougo/deoplete.nvim'
    if !isdirectory(s:deoplete_dir)
        execute '!git clone https://github.com/Shougo/deoplete.nvim.git' s:deoplete_dir
    endif
    execute 'set runtimepath^=' . substitute(fnamemodify(s:deoplete_dir, ':p'), '/$', '', '')
    let g:deoplete#enable_at_startup = 1
endif " }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
