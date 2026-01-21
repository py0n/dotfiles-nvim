-- after/lsp/perlnavigator.lua
--
-- perlnavigator LSP 設定
--
-- 目的:
-- - Perl プロジェクトごとに異なる includePaths / perlPath を
--   自動で正しく設定する
-- - vim.fn.getcwd() に依存しない（Neovim 起動ディレクトリ問題の回避）
--
-- 設計方針:
-- - LSP が決定した root_dir を唯一の基準にする
-- - サーバー起動直前 (on_new_config) に設定を組み立てる
-- - Perl プロジェクトでなさそうな場合は何もしない
--
-- NOTE:
-- - on_new_config は「workspace ごと」に呼ばれる
-- - 複数プロジェクトを行き来しても安全

---@type vim.lsp.Config
return {
    ---------------------------------------------------------------------------
    -- on_new_config
    --
    -- 新しい LSP クライアント設定が作られる直前に呼ばれるフック。
    -- root_dir は LSP が判定したプロジェクトルート。
    ---------------------------------------------------------------------------
    on_new_config = function(new_config, root_dir)
        -------------------------------------------------------------------------
        -- root directory 決定
        --
        -- root_dir が nil のケースはほぼ無いが、
        -- 念のため cwd をフォールバックとして使う。
        -------------------------------------------------------------------------
        local root = root_dir or vim.fn.getcwd()

        -------------------------------------------------------------------------
        -- Perl プロジェクトかどうかの簡易判定
        --
        -- これらが一つも無ければ Perl ではない可能性が高いため、
        -- 余計な設定を送らないようにする。
        -------------------------------------------------------------------------
        local looks_like_perl_project =
        (vim.fn.isdirectory(root .. '/lib') == 1)
        or (vim.fn.isdirectory(root .. '/t') == 1)
        or (vim.fn.filereadable(root .. '/script/perl') == 1)

        if not looks_like_perl_project then
            return
        end

        -------------------------------------------------------------------------
        -- includePaths の構築
        --
        -- 存在するディレクトリのみを LSP に渡す。
        -- 存在しないパスを渡すと perlnavigator 側のログがうるさくなる。
        -------------------------------------------------------------------------
        local function add_if_dir(tbl, path)
            if vim.fn.isdirectory(path) == 1 then
                table.insert(tbl, path)
            end
        end

        local include_paths = {}
        add_if_dir(include_paths, root .. '/lib')
        add_if_dir(include_paths, root .. '/t/inc')
        add_if_dir(include_paths, root .. '/t/lib')
        add_if_dir(include_paths, root .. '/local/lib/perl5')

        -------------------------------------------------------------------------
        -- perlPath の決定
        --
        -- プロジェクト内に script/perl があればそれを優先。
        -- 無ければシステムの perl にフォールバックする。
        -------------------------------------------------------------------------
        local perl_path = root .. '/script/perl'
        if vim.fn.filereadable(perl_path) == 0 then
            perl_path = 'perl'
        end

        -------------------------------------------------------------------------
        -- LSP settings の反映
        --
        -- new_config.settings が既に存在する可能性があるため、
        -- 破壊しないよう段階的に作る。
        -------------------------------------------------------------------------
        new_config.settings = new_config.settings or {}
        new_config.settings.perlnavigator = new_config.settings.perlnavigator or {}

        new_config.settings.perlnavigator.includePaths = include_paths
        new_config.settings.perlnavigator.perlPath = perl_path
    end,
}
