" Initialize dein.vim {{{
let s:dein_dir = $MYDEINCACHEDIR . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p'), '/$', '', '')

call dein#begin($MYDEINCACHEDIR)

let s:dein_toml      = $MYVIMRCDIR . '/dein.toml'
let s:dein_lazy_toml = $MYVIMRCDIR . '/dein_lazy.toml'

if dein#load_cache([$MYVIMRC, s:dein_toml, s:dein_lazy_toml])
    call dein#load_toml(s:dein_toml,      {'lazy': 0})
    call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
    call dein#save_cache()
endif

call dein#end()

filetype plugin indent on
" }}}

" vim-colors-solarized {{{
if dein#tap('vim-colors-solarized')
    " http://ethanschoonover.com/solarized
    let g:solarized_contrast   = "high"
    let g:solarized_hitrail    = 1
    let g:solarized_termcolors = 256
    let g:solarized_termtrans  = 1
    let g:solarized_visibility = "high"
    set background=dark
endif " }}}

" vim-fugitive {{{
if dein#tap('vim-fugitive')
    execute 'autocmd MyAugroup User' 'dein#post_source#'.g:dein#name
     \ 'doautoall fugitive BufNewFile'
endif " }}}

" vim-gitgutter {{{
if dein#tap('vim-gitgutter')
    " https://github.com/airblade/vim-gitgutter
    " デフォルトでは以下のキーマップが設定されている。
    " nmap ]c <Plug>GitGutterNextHunk
    " nmap [c <Plug>GitGutterPrevHunk
    function! s:vim_gitgutter_on_source() abort
        let g:gitgutter_sign_added    = '✚'
        let g:gitgutter_sign_modified = '➜'
        let g:gitgutter_sign_removed  = '✘'
    endfunction
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'call s:vim_gitgutter_on_source()'
endif " }}}

" Check dein {{{
if dein#check_install()
    call dein#install()
endif " }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:

