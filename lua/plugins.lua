return {
    -- context_filetype.vim
    {
        'Shougo/context_filetype.vim',
        config = function()
            require('config/context_filetype')
        end,
    },
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
    -- mason-lspconfig (安全ラッパー付き)
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' }, -- mason を先に読み込ませる
        config = function()
            -- safe require for mason
            local ok_m, mason = pcall(require, "mason")
            if ok_m and type(mason.setup) == "function" then
                pcall(mason.setup)
            else
                vim.notify("mason.nvim not available or broken; LSP installation management may not work", vim.log.levels.WARN)
            end

            local ok_ml, mlc = pcall(require, "mason-lspconfig")
            if not ok_ml then
                vim.notify("mason-lspconfig not available; skipping mason-lspconfig setup", vim.log.levels.WARN)
                return
            end

            -- safe setup if available
            if type(mlc.setup) == "function" then
                pcall(mlc.setup, {
                    ensure_installed = {
                        -- 必要なサーバー名を列挙（既存のリストをここに入れてください）
                        "lua_ls",
                        "perlnavigator",
                    },
                })
            end

            -- setup_handlers があるかチェックして使う（無ければフォールバック）
            if type(mlc.setup_handlers) == "function" then
                mlc.setup_handlers({
                    -- default handler: enable server via vim.lsp.enable
                    function(server_name)
                        vim.lsp.enable(server_name)
                    end,
                    -- 個別ハンドラを入れていたらここに追記してください
                    -- ["lua_ls"] = function() ... end,
                })
            else
                -- 古い/違うバージョンの mason-lspconfig なら明示的に enable する
                vim.notify("mason-lspconfig.setup_handlers not present; enabling fallback servers", vim.log.levels.WARN)
                local fallback = { "lua_ls", "perlnavigator" } -- 必要に応じて編集
                for _, s in ipairs(fallback) do
                    pcall(vim.lsp.enable, s)
                end
            end
        end,
        -- ft を外すか、もしくは必要な場合は残す（ただし遅延ロードで順序問題が出るので注意）
        ft = { 'lua', 'perl' },
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
