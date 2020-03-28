" * vim-syntastic/syntastic
"     * https://github.com/scrooloose/syntastic
"
" * Syntastic というシンタックスチェックプラグインが凄そう
"     * http://d.hatena.ne.jp/heavenshell/20120106/1325866974
"
" * 作者が教える！ lightline.vimの設定方法！ 〜 中級編 - 展開コンポーネントを理解しよう
"     * http://d.hatena.ne.jp/itchyny/20130918/1379461406

function deinhook#syntastic#hookadd()
    " 作者が教える！ lightline.vimの設定方法！ 〜 中級編 - 展開コンポーネントを理解しよう - プログラムモグモグ
    " http://itchyny.hatenablog.com/entry/20130918/1379461406
    " syntasticでperlのsyntaxcheckが動かなくなった件 - 呆備録
    " http://d.hatena.ne.jp/oppara/20140515/p1
    " 【Go × Vim】 VimでGoを書く - 2015 Spring
    " http://qiita.com/izumin5210/items/1f3c312edd7f0075b09c
    let g:syntastic_debug               = 0
    let g:syntastic_enable_perl_checker = 1
    let g:syntastic_mode_map            = {'mode': 'passive'}

    let g:syntastic_go_checkers   = ['go', 'golint']
    let g:syntastic_perl_checkers = ['perl', 'perlcritic', 'podchecker']
endfunction

function deinhook#syntastic#hookpostsource()
    function! s:syntastic()
        SyntasticCheck
        call lightline#update()
    endfunction

    autocmd MyAugroup BufWritePost *.go      call s:syntastic()
    autocmd MyAugroup BufWritePost *.pl,*.pm call s:syntastic()
    autocmd MyAugroup BufWritePost *.py      call s:syntastic()
    autocmd MyAugroup BufWritePost *.t       call s:syntastic()
endfunction
