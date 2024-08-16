local _includePaths = {
    vim.fn.getcwd() .. '/lib',
    vim.fn.getcwd() .. '/t/inc',
    vim.fn.getcwd() .. '/t/lib',
    vim.fn.getcwd() .. '/local/lib/perl5',
}

local _perlPath = vim.fn.getcwd() .. '/script/perl'

require('lspconfig').perlnavigator.setup({
    settings = {
        perlnavigator = {
            includePaths = _includePaths,
            perlPath     = _perlPath,
        },
    }
})
