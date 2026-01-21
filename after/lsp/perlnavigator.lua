-- after/lsp/perlnavigator.lua
---@type vim.lsp.Config
return {
  -- on_new_config は nvim-lspconfig がサーバーを起動する直前に呼ばれます
  on_new_config = function(new_config, root_dir)
    -- root_dir が nil の場合は getcwd をフォールバック
    local root = root_dir or vim.fn.getcwd()

    local include_paths = {
      root .. '/lib',
      root .. '/t/inc',
      root .. '/t/lib',
      root .. '/local/lib/perl5',
    }
    local perl_path = root .. '/script/perl'

    new_config.settings = new_config.settings or {}
    new_config.settings.perlnavigator = new_config.settings.perlnavigator or {}

    new_config.settings.perlnavigator.includePaths = include_paths
    new_config.settings.perlnavigator.perlPath = perl_path
  end,
}
