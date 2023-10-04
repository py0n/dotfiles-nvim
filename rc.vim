" Initialization {{{
if &compatible
    set nocompatible
endif

augroup MyAugroup
    autocmd!
augroup END

if !executable('deno')
    echomsg "Please install deno!"
    finish
endif

lua << EOF
require("encoding")
require("plugins")
require("colorscheme")
require("options")
require("autocmds")
require("mark")
require("keymaps")
EOF

" 編集・再読込 {{{
command! Ev edit   $MYVIMRC
command! Rv source $MYVIMRC
" }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
