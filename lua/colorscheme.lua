" ノーマルモードで行を目立たせる
" http://blog.remora.cx/2012/10/spotlight-cursor-line.html
highlight clear CursorColumn
highlight clear CursorLine
highlight Comment      ctermfg=7
highlight CursorColumn ctermbg=240 ctermfg=119 cterm=BOLD term=reverse
highlight CursorLine   ctermbg=240 ctermfg=119 cterm=BOLD term=reverse
autocmd MyAugroup BufEnter,InsertLeave * setlocal cursorcolumn
autocmd MyAugroup BufEnter,InsertLeave * setlocal cursorline
autocmd MyAugroup BufLeave,InsertEnter * setlocal nocursorcolumn
autocmd MyAugroup BufLeave,InsertEnter * setlocal nocursorline

" 行末の空白及び全角空白を目立たせる
" http://d.hatena.ne.jp/tasukuchan/20070816/1187246177
" http://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample#TOC-4
function! s:visualize_invisible_space() abort
    highlight InvisibleSpace term=underline ctermbg=red guibg=red
    match InvisibleSpace /　\|[　	 ]\+$/
endfunction
autocmd MyAugroup BufEnter * call s:visualize_invisible_space()
]])
