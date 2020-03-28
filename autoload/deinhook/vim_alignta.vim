" * h1mesuke/vim-alignta
"     * https://github.com/h1mesuke/vim-alignta

function deinhook#vim_alignta#hookadd()
    " http://nanasi.jp/articles/vim/align/align_vim_ext.html#alignctrl
    " `AilgnCtrl` で変更した設定を初期状態に戻す
    command! -nargs=0 AlignReset call Align#AlignCtrl('default')
    " http://nanasi.jp/articles/vim/align/align_vim_mapt.html#leader-tsp-leader-tsp
    " 空白揃へ (ref. \tsp or \Tsp)
    command! -range -nargs=? AlignTsp :<line1>,<line2>Alignta <args> \S\+
endfunction
