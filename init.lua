vim.cmd([[
if &compatible
    set nocompatible
endif

if !executable('deno')
    echomsg "Please install deno!"
    finish
endif
]])

require('encoding')
require('options')
require('lazy_nvim')
require('colorscheme')
require('cursorline')
require('trailingspace')
require('autocmds')
require('mark')
require('keymaps')
