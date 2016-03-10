if &compatible
    set nocompatible
endif

augroup MyAugroup
    autocmd!
augroup END

if has('vim_starting')
    " http://rbtnn.hateblo.jp/entry/2014/11/30/174749
    if &encoding !=# 'utf-8'
        set encoding=japan
        set fileencoding=japan
    endif

    scriptencoding utf-8
    " ↑より前に日本語のコメントを書いてはいけない。
    " http://rbtnn.hateblo.jp/entry/2014/11/30/174749
endif

" Environments {{{
let $MYVIMRUNTIME = fnamemodify($MYVIMRC, ':p:h')
let $MYVIMRCDIR   = $MYVIMRUNTIME . '/rc'

let $MYDEINCACHEDIR = exists('$XDG_CACHE_HOME') ?
 \  $XDG_CACHE_HOME . '/dein' :
 \  expand('~/.cache/dein')
" }}}

" Deirectories {{{
call mkdir($MYDEINCACHEDIR, 'p')
" }}}

" Functions {{{
function! s:source_rc(path, ...) abort "{{{
    let abspath = expand($MYVIMRCDIR . '/' . a:path)
    execute 'source' fnameescape(resolve(abspath))
endfunction " }}}
" }}}

" Plugins {{{
call s:source_rc('dein.vim')
" }}}

" Colorscheme & Syntax highlight {{{
syntax enable

colorscheme solarized
" }}}

" Options {{{
" See `:help option-summary`
" On {{{
set autoindent
set backspace=indent,eol,start " :help 'backspace'
set cindent
set cmdheight=1
set confirm
set cursorline
set expandtab    " タブを空白に展開
set hidden
set ignorecase   " case insesitiveな補完
set hlsearch
set incsearch
set laststatus=2
set lazyredraw
set modeline
set modelines=10
set shiftwidth=4 " インデント幅4
set showcmd
set scrolloff=4
set showmatch
set showmatch matchtime=1
set smartcase    " 大文字を含むときはcase sentitiveな補完
set smartindent
set softtabstop=4
set tabstop=4    " タブ幅4
set title
set wildmenu
set wrapscan
if has('vim_starting')
    "set clipboard+=unnamed,autoselect
    set cinoptions+=:0
    set formatoptions+=mM
    set nrformats-=octal " 8進数を無効にする (C-a, C-xなどに影響する)
endif " }}}
" Off {{{
set noerrorbells
set nonumber
set noshowmode
set novisualbell
" }}}
" }}}

" Autocmds {{{
" 自動的にディレクトリを作成する。
" http://vim-users.jp/2011/02/hack202/
autocmd MyAugroup BufWritePre * call mkdir(expand('<afile>:p:h'), 'p')
" インサートモードから抜ける際にペーストモードも抜ける
" http://qiita.com/quwa/items/019250dbca167985fe32
autocmd MyAugroup InsertLeave * set nopaste
" }}}

" Keymaps {{{
" `<Esc>` を `jk` で代用する。
" http://deris.hatenablog.jp/entry/2014/05/20/235807
inoremap jk <Esc>
vnoremap jk <Esc>
" }}}

" 編集・再読込 ============================================ {{{
command! Ev edit   $MYVIMRC
command! Rv source $MYVIMRC
" }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
