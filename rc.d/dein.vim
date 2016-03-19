" Initialize dein.vim {{{
let s:dein_dir = $MYDEINCACHEDIR . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p'), '/$', '', '')

let s:dein_toml      = $MYVIMRCDIR . '/dein.toml'
let s:dein_lazy_toml = $MYVIMRCDIR . '/dein_lazy.toml'

if dein#load_state($MYDEINCACHEDIR)
    call dein#begin($MYDEINCACHEDIR)
    call dein#load_toml(s:dein_toml,      {'lazy': 0})
    call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
" }}}

" MatchTagAlways {{{
if dein#tap('MatchTagAlways')
    " https://github.com/Valloric/MatchTagAlways
    " 対応するタグをハイライトする
endif " }}}

" deoplete-go {{{
if dein#tap('deoplete-go')
endif " }}}

" ghcmod-vim {{{
if dein#tap('ghcmod-vim')
    " https://github.com/eagletmt/ghcmod-vim
    function! s:ghcmod_vim_on_source() abort " {{{
        augroup MyAugroupGhcmodVim
            autocmd BufWritePost,FileWritePost *.hs :GhcModCheck

            autocmd Filetype haskell nnoremap [ghcmod] <Nop>
            autocmd Filetype haskell nmap     <Space>g [ghcmod]

            autocmd FileType haskell nnoremap <buffer> [ghcmod]c  :GhcModCheck<CR>
            autocmd FileType haskell nnoremap <buffer> [ghcmod]l  :GhcModLint<CR>
            autocmd FileType haskell nnoremap <buffer> [ghcmod]t  :GhcModTypeClear<CR>:GhcModType<CR>
            autocmd FileType haskell nnoremap <buffer> [ghcmod]tc :GhcModTypeClear<CR>
        augroup END
    endfunction " }}}
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'nested call s:ghcmod_vim_on_source()'
endif " }}}

" lightline.vim {{{
if dein#tap('lightline.vim')
    let g:lightline = {
     \  'colorscheme'  : 'solarized',
     \  'separator'    : {'left': '', 'right': ''},
     \  'subseparator' : {'left': '', 'right': ''},
     \  }
endif " }}}

" linediff.vim " {{{
if dein#tap('linediff.vim')
    " https://github.com/AndrewRadev/linediff.vim
    " http://deris.hatenablog.jp/entry/2013/12/15/235606
    " (使用法)
    " 1. 比較したい行をvisual modeで選択して `Linediff` を実行
    " 2. 比較対象の行をvisual modeで選択した上で再度 `Linediff` を実行
endif " }}}

" unite-haddock {{{
if dein#tap('unite-haddock')
    " http://eagletmt.hateblo.jp/entry/2012/03/17/194950
    " https://github.com/eagletmt/unite-haddock
    " `unite.vim` で `hoogle` を使ふ
    "
    " :Unite hoogle
    "   `p` でカーソル行のパッケージをプレビュー表示
    "
    " :Unite -auto-preview hoogle
    "   カーソル行のパッケージを自動でプレビュー表示
    "
    " :UniteWithCursorWord hoogle
    "   カーソル位置の單語で検索
    function! s:unite_haddock_on_source() abort " {{{
        let g:unite_source_haddock_browser = 'w3m'
        augroup MyAugroupUniteHaddock
            autocmd Filetype haskell nnoremap <buffer> [unite]h :Unite -auto-preview hoogle<CR>
            autocmd Filetype haskell nnoremap <buffer> [unite]w :UniteWithCursorWord hoogle<CR>
        augroup END
    endfunction " }}}
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'nested call s:unite_haddock_on_source()'
endif " }}}

" unite.vim {{{
if dein#tap('unite.vim')
    " https://github.com/Shougo/unite.vim
    function! s:unite_vim_on_source() abort " {{{
        call unite#custom#profile('default', 'context', {
         \  'direction'        : 'botright',
         \  'ignorecase'       : 1,
         \  'prompt_direction' : 'top',
         \  'smartcase'        : 1,
         \  'start_insert'     : 1,
         \  })
    endfunction " }}}
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'call s:unite_vim_on_source()'

    " バッファ及び最近使用したファイル一覧 (要 neomru)
    nnoremap <C-P> :<C-u>Unite -buffer-name=files buffer file_mru<CR>
    nnoremap <C-N> :<C-u>Unite -buffer-name=files file file/new<CR>

    " unite.vim呼び出し
    " http://deris.hatenablog.jp/entry/2013/05/02/192415
    nnoremap [unite]  <Nop>
    nmap     <Space>u [unite]

    " grep
    nnoremap <silent> [unite]g :<C-u>Unite grep -buffer-name=search-buffer<CR>
    nnoremap <silent> [unite]r :<C-u>UniteResume search-buffer<CR>

    " マーク (要 unite-mark)
    nnoremap <silent> [unite]m :<C-u>Unite mark<CR>

    " アウトライン (要 unite-outline)
    " http://qiita.com/martini3oz/items/2cebdb805f45e7b4b901
    nnoremap <silent> [unite]o :<C-u>Unite -vertical outline<CR>

    " `<C-c>` で閉じる
    autocmd MyAugroup FileType unite inoremap <silent> <buffer> <C-c> <ESC>:q<CR>
    autocmd MyAugroup FileType unite nnoremap <silent> <buffer> <C-c> :q<CR>

    " grep {{{
    " unite grep で pt を利用する
    " Ref. help unite-source-grep
    " http://blog.monochromegane.com/blog/2013/09/18/ag-and-unite/
    if executable('pt')
        " Use pt in unite grep source.
        " https://github.com/monochromegane/the_platinum_searcher
        let g:unite_source_grep_command       = 'pt'
        let g:unite_source_grep_default_opts  = '--nogroup --nocolor'
        let g:unite_source_grep_encoding      = 'utf-8'
        let g:unite_source_grep_recursive_opt = ''
    elseif executable('ag')
        " Use ag in unite grep source.
        let g:unite_source_grep_command       = 'ag'
        let g:unite_source_grep_default_opts  =
         \  '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
         \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
        let g:unite_source_grep_recursive_opt = ''
    elseif executable('ack-grep')
        " Use ack in unite grep source.
        let g:unite_source_grep_command       = 'ack-grep'
        let g:unite_source_grep_default_opts  =
         \  '-i --no-heading --no-color -k -H'
        let g:unite_source_grep_recursive_opt = ''
    endif
    let g:unite_source_history_yank_list = 10000
    " }}}
endif " }}}

" vim-alignta {{{
if dein#tap('vim-alignta')
    " https://github.com/h1mesuke/vim-alignta
    function! s:vim_alignta_on_source() abort " {{{
        " http://nanasi.jp/articles/vim/align/align_vim_ext.html#alignctrl
        " `AilgnCtrl` で変更した設定を初期状態に戻す
        command! -nargs=0 AlignReset call Align#AlignCtrl('default')
        " http://nanasi.jp/articles/vim/align/align_vim_mapt.html#leader-tsp-leader-tsp
        " 空白揃へ (ref. \tsp or \Tsp)
        command! -range -nargs=? AlignTsp :<line1>,<line2>Alignta <args> \S\+
    endfunction " }}}
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \	'call s:vim_alignta_on_source()'
endif " }}}

" vim-anzu {{{
if dein#tap('vim-anzu')
    " https://github.com/osyo-manga/vim-anzu
    " 現在の検索位置を画面に表示
    function! s:vim_anzu_on_source() abort
        " ヒットした檢索語が畫面中段に來るやうに
        " `zz'を付加してゐる。
        nmap n <Plug>(anzu-n-with-echo)zvzz
        nmap N <Plug>(anzu-N-with-echo)zvzz
        nmap * <Plug>(anzu-star-with-echo)zvzz
        nmap # <Plug>(anzu-sharp-with-echo)zvzz

        " 一定時間キー入力がないとき、ウインドウを移動したとき、
        " タブを移動したときに検索ヒット数の表示を消去する。
        augroup MyAugroupVimAnzu
            autocmd!
        augroup END
        autocmd MyAugroupVimAnzu CursorHold  * call anzu#clear_search_status()
        autocmd MyAugroupVimAnzu CursorHoldI * call anzu#clear_search_status()
        autocmd MyAugroupVimAnzu WinLeave    * call anzu#clear_search_status()
        autocmd MyAugroupVimAnzu TabLeave    * call anzu#clear_search_status()
    endfunction
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'nested call s:vim_anzu_on_source()'
endif " }}}

" vim-colors-solarized {{{
if dein#tap('vim-colors-solarized')
    " http://ethanschoonover.com/solarized
    let g:solarized_contrast   = "high"
    let g:solarized_hitrail    = 1
    let g:solarized_termcolors = 256
    let g:solarized_termtrans  = 1
    let g:solarized_visibility = "high"
    set background=dark
endif " }}}

" vim-easymotion {{{
if dein#tap('vim-easymotion')
    " https://github.com/easymotion/vim-easymotion
    " http://haya14busa.com/vim-lazymotion-on-speed/
    " http://haya14busa.com/mastering-vim-easymotion/
    " http://haya14busa.com/vim-easymotion-ver-3-dot-0-overwin-motions/
    function! s:vim_easymotion_on_source() abort
        " Disable default mappings
        " If you are true vimmer, you should explicitly map keys by yourself.
        " Do not rely on default bidings.
        let g:EasyMotion_do_mapping = 0

        " n-character serach motion
        " Extend search motions with vital-over command line interface
        " Incremental highlight of all the matches
        " Now, you don't need to repetitively press `n` or `N` with
        " EasyMotion feature
        " `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
        " :h easymotion-command-line
        nmap / <Plug>(easymotion-sn)
        xmap / <Plug>(easymotion-sn)
        omap / <Plug>(easymotion-tn)

        " s{char}{char} to move to {char}{char}
        nmap s <Plug>(easymotion-overwin-f2)
        vmap s <Plug>(easymotion-bd-f2)

        " hjkl motions
        "map  <Space>j <Plug>(easymotion-j)
        "map  <Space>k <Plug>(easymotion-k)
        map  <Space>h <Plug>(easymotion-linebackward)
        map  <Space>j <Plug>(easymotion-bd-jk)
        map  <Space>k <Plug>(easymotion-bd-jk)
        map  <Space>l <Plug>(easymotion-lineforward)
        nmap <Space>j <Plug>(easymotion-overwin-line)
        nmap <Space>k <Plug>(easymotion-overwin-line)

        " Move to word
        map  <Space>w <Plug>(easymotion-bd-w)
        nmap <Space>w <Plug>(easymotion-overwin-w)

        " keep cursor colum when JK motion
        let g:EasyMotion_startofline = 0

        " Show target key with upper case to improve readability
        let g:EasyMotion_keys      = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
        let g:EasyMotion_use_upper = 1
    endfunction
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'call s:vim_easymotion_on_source()'
endif " }}}

" vim-fugitive {{{
if dein#tap('vim-fugitive')
    execute 'autocmd MyAugroup User' 'dein#post_source#'.g:dein#name
     \  'doautoall fugitive BufNewFile'
endif " }}}

" vim-gista {{{
if dein#tap('vim-gista')
    " http://lambdalisue.hatenablog.com/entry/2014/07/01/203015
    " https://github.com/lambdalisue/vim-gista
    function! s:vim_gista_on_source() abort " {{{
        if exists('g:gista#client#apinames')
            for k in keys(g:gista#client#apinames)
                " 以下の変数は `$HOME/.local.vim` で定義する
                " g:gista#client#apinames (非標準の配列変数)
                " g:gista#client#default_apiname
                " g:gista#client#default_username
                call gista#client#register(k, g:gista#client#apinames[k])
            endfor
        endif
    endfunction " }}}
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'call s:vim_gista_on_source()'
endif " }}}

" vim-gitgutter {{{
if dein#tap('vim-gitgutter')
    " https://github.com/airblade/vim-gitgutter
    " デフォルトでは以下のキーマップが設定されている。
    " nmap ]c <Plug>GitGutterNextHunk
    " nmap [c <Plug>GitGutterPrevHunk

    autocmd MyAugroup BufReadPost  * call GitGutterGetHunkSummary()
    autocmd MyAugroup BufWritePost * call GitGutterGetHunkSummary()

    function! s:vim_gitgutter_on_source() abort
        let g:gitgutter_sign_added    = '✚'
        let g:gitgutter_sign_modified = '➜'
        let g:gitgutter_sign_removed  = '✘'
    endfunction
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'call s:vim_gitgutter_on_source()'
endif " }}}

" vim-go {{{
if dein#tap('vim-go')
    " https://github.com/fatih/vim-go
    function! s:vim_go_on_source() abort " {{{
        augroup MyAugroupVimGo
            autocmd!
            autocmd Filetype go nnoremap <buffer> [go]f :GoFmt
            autocmd Filetype go nnoremap <buffer> [go]l :GoLint
            autocmd Filetype go nnoremap <buffer> [go]t :GoTest
        augroup END
    endfunction " }}}
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'nested call s:vim_go_on_source()'
endif " }}}

" vim-go-extra {{{
if 0 && dein#tap('vim-go-extra')
    " https://github.com/vim-jp/vim-go-extra
    function! s:vim_go_extra_on_source() abort " {{{
        let g:gofmt_command = 'goimports'
        augroup MyAugroupVimGoExtra
            autocmd BufWritePre *.go Fmt
        augroup END
    endfunction " }}}
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'nested call s:vim_go_extra_on_source()'
endif " }}}

" vim-localrc {{{
if dein#tap('vim-localrc')
    " https://github.com/thinca/vim-localrc
    " http://d.hatena.ne.jp/thinca/20110108/1294427418
    let g:localrc_filename = '.local.vim'
endif " }}}

" vim-pandoc-syntax {{{
if dein#tap('vim-pandoc-syntax')
    " https://github.com/vim-pandoc/vim-pandoc-syntax
    autocmd MyAugroup BufNewFile,BufFilePRe,BufRead *.md set filetype=markdown.pandoc
endif " }}}

" vim-precious {{{
if dein#tap('vim-precious')
    " https://github.com/osyo-manga/vim-precious
    " カーソルの位置によって `filetype` を切り替える
    function! s:vim_precious_on_source() abort
        let g:context_filetype#filetypes = {
         \ 'html': [
         \     {
         \         'start'    : '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)\?>',
         \         'end'      : '</script>',
         \         'filetype' : 'javascript',
         \     }
         \ ]}
    endfunction
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'call s:vim_precious_on_source()'
endif " }}}

" vim-rooter {{{
if dein#tap('vim-rooter')
    " https://github.com/airblade/vim-rooter
    " 自動で `project root` に `lcd`
    autocmd MyAugroup BufEnter * :Rooter

    function! s:vim_rooter_on_source() abort
        let g:rooter_silent_chdir = 1
        let g:rooter_use_lcd      = 1
    endfunction
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'call s:vim_rooter_on_source()'
endif " }}}

" wildfire.vim {{{
if dein#tap('wildfire.vim')
    function! s:wildfire_vim_on_source() abort
        " http://hail2u.net/blog/software/vim-wildfire.html
        " http://m.designbits.jp/14030411/
        " https://github.com/gcmt/wildfire.vim
        let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'ip', 'it', 'i>']
    endfunction
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'call s:wildfire_vim_on_source()'
endif " }}}

" Check dein {{{
if dein#check_install()
    call dein#install()
endif " }}}

" deoplete {{{
" https://github.com/Shougo/deoplete.nvim
if has('nvim') && has('python3')
    " `deoplete.nvim` が `dein.vim` で管理できるようになるまで此で凌ぐ。
    let s:deoplete_dir = $MYDEINCACHEDIR . '/repos/github.com/Shougo/deoplete.nvim'
    if !isdirectory(s:deoplete_dir)
        execute '!git clone https://github.com/Shougo/deoplete.nvim.git' s:deoplete_dir
    endif
    execute 'set runtimepath^=' . substitute(fnamemodify(s:deoplete_dir, ':p'), '/$', '', '')
    let g:deoplete#enable_at_startup = 1
endif " }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
