" 強制終了保存を無効にする
" http://deris.hatenablog.jp/entry/2013/05/02/192415
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q  <Nop>

" `<Esc>` を `jk` で代用する。
" http://deris.hatenablog.jp/entry/2014/05/20/235807
inoremap jk <Esc>
vnoremap jk <Esc>

" コマンドラインモードでの履歴移動改善。
" http://lingr.com/room/vim/archives/2014/12/13#message-20830819
cnoremap <Up>   <C-p>
cnoremap <Down> <C-n>
cnoremap <C-p>  <Up>
cnoremap <C-n>  <Down>

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
