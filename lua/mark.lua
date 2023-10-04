-- レジスタを指定せずにマークする
-- http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908

local chars = {
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
    'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
    'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
    'y', 'z'
}

local pos = 0

function auto_markrement()
    pos = (pos + 1) % #chars

    vim.api.nvim_command(string.format('execute "mark" "%s"', chars[pos]))
end

vim.api.nvim_set_keymap('n', '[Mark]', '', {noremap = true})
vim.api.nvim_set_keymap('n', 'm', '[Mark]', {})

-- 現在位置をマーク
vim.api.nvim_set_keymap('n', '[Mark]m', '<C-u>', {
    callback = auto_markrement,
    noremap  = true,
    silent   = true,
})

-- 次/前のマーク
vim.api.nvim_set_keymap('n', '[Mark]n', ']`', {noremap = true})
vim.api.nvim_set_keymap('n', '[Mark]p', '[`', {noremap = true})

-- マーク一覧
vim.api.nvim_set_keymap('n', '[Mark]l', ':<C-u>marks<CR>', {noremap = true})
