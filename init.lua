vim.cmd([[
if &compatible
    set nocompatible
endif

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
