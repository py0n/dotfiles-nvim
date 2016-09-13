function! s:mkdir(path)
    if !isdirectory(a:path)
        call mkdir(a:path, 'p')
    endif
endfunction
" 自動的にディレクトリを作成する。
" http://vim-users.jp/2011/02/hack202/
autocmd MyAugroup BufWritePre * call s:mkdir(expand('<afile>:p:h'))
" インサートモードから抜ける際にペーストモードも抜ける
" http://qiita.com/quwa/items/019250dbca167985fe32
autocmd MyAugroup InsertLeave * set nopaste

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
