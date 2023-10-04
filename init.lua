vim.cmd([[
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
]])

require("encoding")
require("plugins")
require("colorscheme")
require("options")
require("autocmds")
require("mark")
require("keymaps")
