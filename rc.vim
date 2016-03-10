if &compatible
    set nocompatible
endif

augroup MyAugroup
    autocmd!
augroup END

if has('vim_starting')
    " http://rbtnn.hateblo.jp/entry/2014/11/30/174749
    if &encoding !=# 'utf-8'
        set encoding=japan
        set fileencoding=japan
    endif

    scriptencoding utf-8
    " ↑より前に日本語のコメントを書いてはいけない。
    " http://rbtnn.hateblo.jp/entry/2014/11/30/174749
endif

" Environments {{{
let $MYVIMRUNTIME = fnamemodify($MYVIMRC, ':p:h')
let $MYVIMRCDIR   = $MYVIMRUNTIME . '/rc.d'

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
call s:source_rc('colorscheme.vim')
" }}}

" Options {{{
call s:source_rc('options.vim')
" }}}

" Autocmds {{{
" 自動的にディレクトリを作成する。
" http://vim-users.jp/2011/02/hack202/
autocmd MyAugroup BufWritePre * call mkdir(expand('<afile>:p:h'), 'p')
" インサートモードから抜ける際にペーストモードも抜ける
" http://qiita.com/quwa/items/019250dbca167985fe32
autocmd MyAugroup InsertLeave * set nopaste
" }}}

" Keymaps {{{
" `<Esc>` を `jk` で代用する。
" http://deris.hatenablog.jp/entry/2014/05/20/235807
inoremap jk <Esc>
vnoremap jk <Esc>
" }}}

" Filetypes {{{
call s:source_rc('filetypes.vim')
" }}}

" 編集・再読込 {{{
command! Ev edit   $MYVIMRC
command! Rv source $MYVIMRC
" }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
