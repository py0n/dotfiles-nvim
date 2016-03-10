if &compatible
    set nocompatible
endif

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

" Initialization {{{
augroup MyAugroup
    autocmd!
augroup END

call s:source_rc('dein.vim')
" }}}

" Colorscheme {{{
syntax enable
colorscheme solarized
" }}}

" Colorscheme {{{
syntax enable
if dein#tap('vim-colors-solarized')
    " http://ethanschoonover.com/solarized
    let g:solarized_contrast   = "high"
    let g:solarized_hitrail    = 1
    let g:solarized_termcolors = 256
    let g:solarized_termtrans  = 1
    let g:solarized_visibility = "high"
    set background=dark
    colorscheme solarized
endif
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
