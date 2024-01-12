vim.api.nvim_create_augroup('lua/cursorline', {
    clear = true,
})

-- ノーマルモードで行を目立たせる
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
    group    = 'lua/cursorline',
    callback = function() togglecursorline(true) end
})
vim.api.nvim_create_autocmd({'BufLeave','InsertEnter'}, {
    group    = 'lua/cursorline',
    callback = function() togglecursorline(false) end
})
