-- insert mode に入った時に 'filetype' を切り換える。
-- カーソル移動時の自動切り替えを無効化
vim.cmd([[
let g:precious_enable_switch_CursorMoved   = {'*' : 0}
let g:precious_enable_switch_CursorMoved_i = {'*' : 0}
]])

vim.api.nvim_create_augroup('plugin/vim-precious', {
    clear = true,
})
vim.api.nvim_create_autocmd('InsertEnter', {
    command = 'PreciousSwitch',
    group   = 'plugin/vim-precious',
})
vim.api.nvim_create_autocmd('InsertLeave', {
    command = 'PreciousReset',
    group   = 'plugin/vim-precious',
})
