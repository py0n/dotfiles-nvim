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

" lightline.vim {{{
if dein#tap('lightline.vim')
    let g:lightline = {
     \  'colorscheme' : 'solarized',
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
    nnoremap <C-N> :<C-u>Unite -buffer-name=files file<CR>

    " unite.vim呼び出し
    " http://deris.hatenablog.jp/entry/2013/05/02/192415
    nnoremap [unite]  <Nop>
    nmap     <Space>u [unite]

    " マーク (要 unite-mark)
    nnoremap <silent> [unite]m :<C-u>Unite mark<CR>

    " アウトライン (要 unite-outline)
    " http://qiita.com/martini3oz/items/2cebdb805f45e7b4b901
    nnoremap <silent> [unite]o :<C-u>Unite -vertical outline<CR>

    " `<C-c>` で閉じる
    autocmd MyAugroup FileType unite inoremap <silent> <buffer> <C-c> <ESC>:q<CR>
    autocmd MyAugroup FileType unite nnoremap <silent> <buffer> <C-c> :q<CR>
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

" vim-gitgutter {{{
if dein#tap('vim-gitgutter')
    " https://github.com/airblade/vim-gitgutter
    " デフォルトでは以下のキーマップが設定されている。
    " nmap ]c <Plug>GitGutterNextHunk
    " nmap [c <Plug>GitGutterPrevHunk
    function! s:vim_gitgutter_on_source() abort
        let g:gitgutter_sign_added    = '✚'
        let g:gitgutter_sign_modified = '➜'
        let g:gitgutter_sign_removed  = '✘'
    endfunction
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'call s:vim_gitgutter_on_source()'
endif " }}}

" vim-localrc {{{
if dein#tap('vim-localrc')
    " https://github.com/thinca/vim-localrc
    " http://d.hatena.ne.jp/thinca/20110108/1294427418
    function! s:vim_localrc_on_source() abort
        let g:localrc_filename = '.local.vim'
    endfunction
    execute 'autocmd MyAugroup User' 'dein#source#'.g:dein#name
     \  'call s:vim_localrc_on_source()'
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

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
