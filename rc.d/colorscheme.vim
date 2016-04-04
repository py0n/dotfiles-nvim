" Colorscheme & Syntax highlight

syntax enable

colorscheme solarized

" ノーマルモードで行を目立たせる {{{
" http://blog.remora.cx/2012/10/spotlight-cursor-line.html
highlight clear CursorLine
highlight CursorLine ctermbg=magenta ctermfg=lightgray cterm=NONE term=reverse
autocmd MyAugroup BufLeave,InsertEnter * setlocal nocursorline
autocmd MyAugroup BufEnter,InsertLeave * setlocal cursorline
" }}}

" 行末の空白及び全角空白を目立たせる {{{
" http://d.hatena.ne.jp/tasukuchan/20070816/1187246177
" http://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample#TOC-4
function! s:visualize_invisible_space() abort
    highlight InvisibleSpace term=underline ctermbg=red guibg=red
    match InvisibleSpace /　\|[　	 ]\+$/
endfunction
autocmd MyAugroup BufEnter * call s:visualize_invisible_space()
" }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
