" 自動的にディレクトリを作成する。
" http://vim-users.jp/2011/02/hack202/
autocmd MyAugroup BufWritePre * call mkdir(expand('<afile>:p:h'), 'p')
" インサートモードから抜ける際にペーストモードも抜ける
" http://qiita.com/quwa/items/019250dbca167985fe32
autocmd MyAugroup InsertLeave * set nopaste

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
