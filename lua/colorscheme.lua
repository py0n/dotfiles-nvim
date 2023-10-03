vim.cmd([[colorscheme solarized]])

vim.api.nvim_create_augroup('lua/colorscheme', {
    clear = true,
})

-- ノーマルモードで行を目立たせる
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'Comment', {ctermfg = 7})
vim.api.nvim_set_hl(0, 'CursorColumn', {
    ctermbg = 240,
    ctermfg = 119,
    cterm   = BOLD,
    term    = reverse,
})
vim.api.nvim_set_hl(0, 'CursorLine', {
    ctermbg = 240,
    ctermfg = 119,
    cterm   = BOLD,
    term    = reverse,
})

local togglecursorline = function(on_off)
    vim.opt_local.cursorcolumn = on_off
    vim.opt_local.cursorline   = on_off
end
vim.api.nvim_create_autocmd({'BufEnter','InsertLeave'}, {
    group    = 'lua/colorscheme',
    callback = function() togglecursorline(true) end
})
vim.api.nvim_create_autocmd({'BufLeave','InsertEnter'}, {
    group    = 'lua/colorscheme',
    callback = function() togglecursorline(false) end
})

-- 行末の空白及び全角空白を目立たせる
-- http://d.hatena.ne.jp/tasukuchan/20070816/1187246177
-- http://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample#TOC-4
vim.api.nvim_create_autocmd('BufEnter', {
    group    = 'lua/colorscheme',
    callback = function()
        vim.cmd([[
        highlight InvisibleSpace term=underline ctermbg=red guibg=red
        match InvisibleSpace /　\|[　	 ]\+$/
        ]])
    end
})
