" Initialization {{{
if &compatible
    set nocompatible
endif

augroup MyAugroup
    autocmd!
augroup END

if !executable('deno')
    echomsg "Please install deno!"
    finish
endif

" Environments {{{
let $MYVIMRUNTIME = fnamemodify($MYVIMRC, ':p:h')
let $MYVIMRCDIR   = $MYVIMRUNTIME . '/rc.d'

let $MYDEINCACHEDIR = exists('$XDG_CACHE_HOME') ?
 \  $XDG_CACHE_HOME . '/dein' :
 \  expand('~/.cache/dein')
" }}}

" Deirectories {{{
if !isdirectory($MYDEINCACHEDIR)
    call mkdir($MYDEINCACHEDIR, 'p')
endif
" }}}

" Functions {{{
function! s:source_rc(path, ...) abort "{{{
    let abspath = expand($MYVIMRCDIR . '/' . a:path)
    execute 'source' fnameescape(resolve(abspath))
endfunction " }}}
" }}}
" }}}

" Encoding {{{
call s:source_rc('encoding.vim')
" }}}

" これより前に日本語のコメント禁止

" Plugins {{{
call s:source_rc('dein.vim')
" }}}

lua << EOF
require("plugins")
require("colorscheme")
EOF

" Options {{{
call s:source_rc('options.vim')
" }}}

" Autocmds {{{
call s:source_rc('autocmds.vim')
" }}}

" Mark {{{
call s:source_rc('mark.vim')
" }}}

" Keymaps {{{
call s:source_rc('keymaps.vim')
" }}}

" 編集・再読込 {{{
command! Ev edit   $MYVIMRC
command! Rv source $MYVIMRC
" }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
