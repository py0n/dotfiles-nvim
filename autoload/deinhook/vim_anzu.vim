" https://github.com/osyo-manga/vim-anzu
" 現在の検索位置を画面に表示

function deinhook#vim_anzu#hookadd()
    " ヒットした檢索語が畫面中段に來るやうに
    " `zz'を付加してゐる。
    nmap n <Plug>(anzu-n-with-echo)zvzz
    nmap N <Plug>(anzu-N-with-echo)zvzz
    nmap * <Plug>(anzu-star-with-echo)zvzz
    nmap # <Plug>(anzu-sharp-with-echo)zvzz

    " 一定時間キー入力がないとき、ウインドウを移動したとき、
    " タブを移動したときに検索ヒット数の表示を消去する。
    autocmd MyAugroup CursorHold  * call anzu#clear_search_status()
    autocmd MyAugroup CursorHoldI * call anzu#clear_search_status()
    autocmd MyAugroup WinLeave    * call anzu#clear_search_status()
    autocmd MyAugroup TabLeave    * call anzu#clear_search_status()
endfunction
