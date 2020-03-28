" https://github.com/lambdalisue/vim-gista

function deinhook#vim_gista#hookadd()
    " http://lambdalisue.hatenablog.com/entry/2014/07/01/203015
    if exists('g:gista#client#apinames')
        for k in keys(g:gista#client#apinames)
            " 以下の変数は `$HOME/.local.vim` で定義する
            " g:gista#client#apinames (非標準の配列変数)
            " g:gista#client#default_apiname
            " g:gista#client#default_username
            call gista#client#register(k, g:gista#client#apinames[k])
        endfor
    endif
endfunction
