-- 行末の空白及び全角空白を目立たせる
-- http://d.hatena.ne.jp/tasukuchan/20070816/1187246177
-- http://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample#TOC-4
vim.api.nvim_create_augroup('lua/trailingspace', {
    clear = true,
})
vim.api.nvim_create_autocmd('BufEnter', {
    group    = 'lua/trailingspace',
    callback = function()
        vim.cmd([[
        highlight InvisibleSpace term=underline ctermbg=red guibg=red
        match InvisibleSpace /　\|[　	 ]\+$/
        ]])
    end
})
