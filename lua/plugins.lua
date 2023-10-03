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
    use 'Shougo/context_filetype.vim'
    use 'godlygeek/tabular'
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

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)