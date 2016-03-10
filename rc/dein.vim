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
endif
" }}}

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

" vim-fugitive {{{
if dein#tap('vim-fugitive')
    execute 'autocmd MyAugroup User' 'dein#post_source#'.g:dein#name
     \ 'doautoall fugitive BufNewFile'
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
endif
" }}}

" Check dein {{{
if dein#check_install()
    call dein#install()
endif " }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
