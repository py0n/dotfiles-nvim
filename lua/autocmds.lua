vim.api.nvim_create_augroup('lua/autocmds', {clear = true})

-- 自動的にディレクトリを作成する。
-- http://vim-users.jp/2011/02/hack202/
vim.api.nvim_create_autocmd('BufWritePre', {
    group    = 'lua/autocmds',
    callback = function()
        local path = vim.fn.expand('<afile>:p:h')
        if vim.fn.isdirectory(path) ~= 1 then
            vim.fn.mkdir(path, 'p')
        end
    end
})

-- インサートモードから抜ける際にペーストモードも抜ける
-- http://qiita.com/quwa/items/019250dbca167985fe32
vim.api.nvim_create_autocmd('InsertLeave', {
    group   = 'lua/autocmds',
    command = 'set nopaste',
})
