-- https://github.com/airblade/vim-gitgutter
vim.g.gitgutter_sign_added    = '✚'
vim.g.gitgutter_sign_modified = '➜'
vim.g.gitgutter_sign_removed  = '✘'

vim.api.nvim_create_augroup('plugin/vim-gitgutter', {clear = true})
vim.api.nvim_create_autocmd('VimEnter', {
    group   = 'plugin/vim-gitgutter',
    command = 'GitGutterEnable',
})

-- デフォルトでは以下のキーマップが設定されている。
-- nmap ]c <Plug>GitGutterNextHunk
-- nmap [c <Plug>GitGutterPrevHunk
