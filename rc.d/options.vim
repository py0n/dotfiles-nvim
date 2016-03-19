" See `:help option-summary`
" On {{{
set autoindent
set backspace=indent,eol,start " :help 'backspace'
set belloff=all                " 全てのベルを停止
set cindent
set cmdheight=1
set confirm
set cursorline
set expandtab                  " タブを空白に展開
set hidden
set hlsearch                   " 検索語をハイライト
set ignorecase                 " case insesitiveな補完
set incsearch
set laststatus=2               " for lightline.vim
set lazyredraw
set modeline
set modelines=10
set mouse=                     " マウスを無効
set scrolloff=4
set shiftwidth=4               " インデント幅4
set showcmd
set showmatch
set showmatch matchtime=1
set smartcase                  " 大文字を含むときはcase sentitiveな補完
set smartindent
set softtabstop=4
set tabstop=4                  " タブ幅4
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
