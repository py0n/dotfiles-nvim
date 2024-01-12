-- ddu.vimの設定
-- https://zenn.dev/shougo/articles/ddu-vim-beta
vim.fn['ddu#custom#patch_global']({
    sources = {
        {name = 'file_rec', params = {}},
        {name = 'line'},
        {name = 'mr'},
        {name = 'register'},
    },
})
vim.fn['ddu#custom#patch_global']{
    sourceOptions = {
        _ = {
            matchers= {'matcher_substring'},
        },
    },
}
vim.fn['ddu#custom#patch_global']({
    sourceParams = {
        rg = {
            args = {'--column', '--no-heading', '--color', 'never'},
        },
    },
})
vim.fn['ddu#custom#patch_global']({
    kindOptions = {
        file = {defaultAction = 'open'},
        word = {defaultAction = 'append'},
    },
})
vim.fn['ddu#custom#patch_global']({
    ui       = 'ff',
    uiParams = {
        ff = {
            split       = 'horizontal',
            startFilter = true,
        },
    },
})

vim.api.nvim_create_augroup('plugin/ddu', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
    group    = 'plugin/ddu',
    pattern  = 'ddu-ff',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', '<Cmd>call ddu#ui#ff#do_action("itemAction")<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', ' ', '<Cmd>call ddu#ui#ff#do_action("toggleSelectItem")<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'i', '<Cmd>call ddu#ui#ff#do_action("openFilterWindow")<CR>', {noremap = true, silent= true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<Cmd>call ddu#ui#ff#do_action("quit")<CR>', {noremap = true, silent = true})
    end
})
vim.api.nvim_create_autocmd('FileType', {
    group    = 'plugin/ddu',
    pattern  = 'ddu-ff-filter',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'i', '<CR>', '<Esc><Cmd>close<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', '<Cmd>close<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<Cmd>close<CR>', {noremap = true, silent = true})
    end
})

vim.api.nvim_set_keymap('n', '[denite]', '', {noremap = true})
vim.api.nvim_set_keymap('n', ' u', '[denite]', {})

-- ファイル検索(rg)
vim.api.nvim_set_keymap('n', '[denite]g', ':<C-u>DduRg<CR>', {silent = true})
-- ファイル内検索
vim.api.nvim_set_keymap('n', '[denite]o', '<Cmd>call ddu#start({"sources": [{"name":"line"}]})<CR>', {
    noremap = true,
    silent  = true,
})
-- レジスタ(マーク)検索
vim.api.nvim_set_keymap('n', '[denite]m', '<Cmd>call ddu#start({"sources": [{"name":"register"}]})<CR>', {
    noremap = true,
    silent  = true,
})
-- 最近使用したファイル
vim.api.nvim_set_keymap('n', '[denite]p', '<Cmd>call ddu#start({"sources": [{"name":"mr"}]})<CR>', {
    noremap = true,
    silent  = true,
})
