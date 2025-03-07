return {
    -- context_filetype.vim
    {
        'Shougo/context_filetype.vim',
        config = function()
            require('config/context_filetype')
        end,
    },
    --[[ copilot
    {
        'github/copilot.vim',
        lazy=false,
    },
    ]]
    -- ddu.vim
    {
        'Shougo/ddu.vim',
        config = function()
            require("config/ddu")
        end,
        dependencies = {
            'Shougo/ddu-filter-matcher_substring',
            'Shougo/ddu-kind-file',
            'Shougo/ddu-kind-word',
            'Shougo/ddu-source-file_rec',
            'Shougo/ddu-source-line',
            'Shougo/ddu-source-register',
            'Shougo/ddu-ui-ff',
            'kuuote/ddu-source-mr',
            'lambdalisue/mr.vim',
            'shun/ddu-source-rg',
            'vim-denops/denops.vim',
        },
        event = 'BufEnter',
    },
    -- denops-helloworld.vim
    {
        'vim-denops/denops-helloworld.vim',
        cmd = {
            'DenopsHello',
        },
        dependencies = {
            'vim-denops/denops.vim',
        },
    },
    -- gruvbox.nvim
    {
        'ellisonleao/gruvbox.nvim',
        keys = {
            'colorscheme',
        },
    },
    -- linediff.vim
    {
        -- Linediff使用法
        -- 1. 比較したい行をvisual modeで選択して `Linediff` を実行
        -- 2. 比較対象の行をvisual modeで選択した上で再度 `Linediff` を実行
        'AndrewRadev/linediff.vim',
        cmd = {
            'Linediff',
        },
    },
    -- lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            opt = true,
        },
        config = function()
            require('config/lualine')
        end,
        event = 'VimEnter',
    },
    -- mason-lspconfig
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'perlnavigator',
                },
            })
            require('config/lua_ls')
            require('config/perlnavigator')
        end,
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
        },
        ft = {
            'lua',
            'perl',
        },
    },
    -- nvim-config-local
    {
        'klen/nvim-config-local',
        cmd = {
            'ConfigLocalSource',
            'ConfigLocalEdit',
            'ConfigLocalTrust',
            'ConfigLocalIgnore',
        },
        config = function()
            require('config-local').setup({
                config_files        = {'.local.vim', '.local.lua'},
                hashfile            = vim.fn.stdpath("data") .. "/config-local",
                autocommands_create = true,
                commands_create     = true,
                silent              = false,
                lookup_parents      = true,
            })
        end,
        lazy = false,
    },
    -- nvim-notify
    {
        'rcarriga/nvim-notify',
        lazy = false,
    },
    -- nvim-rooter.lua
    {
        'notjedi/nvim-rooter.lua',
        config = function()
            require('nvim-rooter').setup({
                rooter_patterns    = {'.git', '.hg', '.svn'},
                trigger_patterns   = {'*'},
                manual             = false,
                fallback_to_parent = false,
            })
        end,
        lazy = false,
    },
    -- nvim-treesister
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
    },
    -- vim-anzu
    {
        'osyo-manga/vim-anzu',
        config = function()
            require('config/vim-anzu')
        end,
        keys = {'/', '?'},
    },
    -- vim-colors-solarized
    {
        'altercation/vim-colors-solarized',
        keys = {
            'colorscheme',
        },
    },
    -- vim-easy-align
    {
        'junegunn/vim-easy-align',
        keys = {
            'V'
        },
    },
    -- vim-easymotion
    {
        'easymotion/vim-easymotion',
        config = function()
            require('config/vim-easymotion')
        end,
        keys = {
            '/',
            '<Space>h',
            '<Space>j',
            '<Space>k',
            '<Space>l',
            '<Space>w',
            's',
        },
    },
    -- vim-fugitive
    {
        'tpope/vim-fugitive',
        cmd = {
            'G',
            'GBrowse',
            'GDelete',
            'GMove',
            'Gdiffsplit',
            'Ggrep',
            'Git',
            'Gread',
            'Gvdiffsplit',
            'Gwrite',
        },
    },
    -- vim-gitgutter
    {
        'airblade/vim-gitgutter',
        config = function()
            require('config/vim-gitgutter')
        end,
        event = 'BufEnter',
    },
    -- vim-markdown
    {
        'preservim/vim-markdown',
        config = function()
            require('config/vim_markdown')
        end,
        dependencies = {
            'godlygeek/tabular',
        },
        ft = {
            'markdown',
        },
    },
    -- vim-precious
    {
        'osyo-manga/vim-precious',
        config = function()
            require('config/vim-precious')
        end,
        dependencies = {
            'Shougo/context_filetype.vim',
        },
        event = {
            'InsertEnter',
            'InsertLeave',
        },
    },
    -- vim-startuptime
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        init = function()
            vim.g.startuptime_tries = 10
        end,
    },
    -- vim-surround
    {
        'tpope/vim-surround',
        keys = {
            'cs',
            'ds',
            'v',
        },
    },
}
-- vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
