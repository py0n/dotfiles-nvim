-- See `:help option-summary`
vim.opt.autoindent             = true
vim.opt.backspace              = 'indent,eol,start' -- :help 'backspace'
vim.opt.belloff                = all   -- 全てのベルを停止
vim.opt.breakindent            = true
vim.opt.cindent                = true
vim.opt.cmdheight              = 1
vim.opt.confirm                = true
vim.opt.cursorcolumn           = true
vim.opt.cursorline             = true
vim.opt.errorbells             = false
vim.opt.expandtab              = true  -- タブを空白に展開
vim.opt.hidden                 = true
vim.opt.hlsearch               = true  -- 検索語をハイライト
vim.opt.ignorecase             = true  -- case insesitiveな補完
vim.opt.incsearch              = true
vim.opt.laststatus             = 3     -- for lualine.nvim
vim.opt.lazyredraw             = true
vim.opt.modeline               = true
vim.opt.modelines              = 10
vim.opt.mouse                  = ''    -- マウスを無効
vim.opt.number                 = false
vim.opt.scrolloff              = 4
vim.opt.shiftwidth             = 4     -- インデント幅4
vim.opt.showcmd                = true
vim.opt.showmatch              = true
vim.opt.showmode               = false
vim.opt.matchtime              = 1
vim.opt.smartcase              = true  -- 大文字を含むときはcase sentitiveな補完
vim.opt.smartindent            = true
vim.opt.softtabstop            = 4
vim.opt.tabstop                = 4                  -- タブ幅4
vim.opt.title                  = tru
vim.opt.visualbell             = false
vim.opt.wildmenu               = true
vim.opt.wrapscan               = true
if vim.fn.has('vim_starting') == 1 then
    vim.opt.clipboard:append({'unnamedplus'}) -- 要 xclip or xsel
    vim.opt.cinoptions:append(':0')
    vim.opt.formatoptions:append('mM')
    vim.opt.nrformats:remove('octal')  -- 8進数を無効にする (C-a, C-xなどに影響する)
end
