if &compatible
    set nocompatible
endif

augroup MyAugroup
    autocmd!
augroup END

" Environments {{{
let $MYVIMRUNTIME = fnamemodify($MYVIMRC, ':p:h')
let $MYVIMRCDIR   = $MYVIMRUNTIME . '/rc'

let $MYDEINCACHEDIR = exists('$XDG_CACHE_HOME') ?
 \  $XDG_CACHE_HOME . '/dein' :
 \  expand('~/.cache/dein')
" }}}

" Deirectories {{{
call mkdir($MYDEINCACHEDIR, 'p')
" }}}

" Functions {{{
function! s:source_rc(path, ...) abort "{{{
    let abspath = expand($MYVIMRCDIR . '/' . a:path)
    execute 'source' fnameescape(resolve(abspath))
endfunction " }}}
" }}}

" Plugins {{{
call s:source_rc('dein.vim')
" }}}

" Colorscheme & Syntax highlight {{{
syntax enable

colorscheme solarized
" }}}

" Settings {{{
" case insesitiveな補完
set ignorecase
" 大文字を含むときはcase sentitiveな補完
set smartcase
" }}}

" Keymaps {{{
" `<Esc>` を `jk` で代用する。
" http://deris.hatenablog.jp/entry/2014/05/20/235807
inoremap jk <Esc>
vnoremap jk <Esc>
" }}}

" 編集・再読込 ============================================ {{{
command! Ev edit   $MYVIMRC
command! Rv source $MYVIMRC
" }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
