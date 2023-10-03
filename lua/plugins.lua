-- https://github.com/wbthomason/packer.nvim#bootstrapping
--
-- Bootstrapping
-- If you want to automatically install and set up packer.nvim on any machine you clone your configuration to,
-- add the following snippet (which is due to @Iron-E and @khuedoan) somewhere in your config before your first usage of packer:
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- You can also use the following command (with packer bootstrapped) to have packer setup your configuration (or simply run updates)
-- and close once all operations are completed:
--
-- $ nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

-- Plugins
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- My plugins here

    -- Linediff使用法
    -- 1. 比較したい行をvisual modeで選択して `Linediff` を実行
    -- 2. 比較対象の行をvisual modeで選択した上で再度 `Linediff` を実行
    use 'AndrewRadev/linediff.vim'

    use 'Shougo/context_filetype.vim'
    use 'altercation/vim-colors-solarized'
    use 'godlygeek/tabular'
    use 'junegunn/vim-easy-align'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'nvim-tree/nvim-web-devicons'
    use {
        'notjedi/nvim-rooter.lua',
        config = function() require'nvim-rooter'.setup() end
    }
    use 'osyo-manga/vim-precious'
    use {
        'preservim/vim-markdown',
        requires = {'godlygeek/tabular'}
    }
    if vim.fn.has('win32unix') ~= 1 then
        use 'thinca/vim-localrc'
    end
    use 'tpope/vim-surround'
    use 'vim-denops/denops-helloworld.vim'
    use 'vim-denops/denops.vim'
    use 'yuki-yano/fuzzy-motion.vim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
