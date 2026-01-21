-- after/lsp/perlnavigator.lua
---@type vim.lsp.Config
return {
    on_new_config = function(new_config, root_dir)
        local root = root_dir or vim.fn.getcwd()

        -- Perl プロジェクトっぽい構成が無い場合は設定しない
        local looks_like_perl_project =
        (vim.fn.isdirectory(root .. "/lib") == 1)
        or (vim.fn.isdirectory(root .. "/t") == 1)
        or (vim.fn.filereadable(root .. "/script/perl") == 1)

        if not looks_like_perl_project then
            return
        end

        -- includePaths は存在するディレクトリだけ渡す
        local function add_if_dir(t, p)
            if vim.fn.isdirectory(p) == 1 then
                table.insert(t, p)
            end
        end

        local include_paths = {}
        add_if_dir(include_paths, root .. "/lib")
        add_if_dir(include_paths, root .. "/t/inc")
        add_if_dir(include_paths, root .. "/t/lib")
        add_if_dir(include_paths, root .. "/local/lib/perl5")

        local perl_path = root .. "/script/perl"
        if vim.fn.filereadable(perl_path) == 0 then
            -- フォールバック（環境に合わせて変更可）
            perl_path = "perl"
        end

        new_config.settings = new_config.settings or {}
        new_config.settings.perlnavigator = new_config.settings.perlnavigator or {}
        new_config.settings.perlnavigator.includePaths = include_paths
        new_config.settings.perlnavigator.perlPath = perl_path
    end,
}
