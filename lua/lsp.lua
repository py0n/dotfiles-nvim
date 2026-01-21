-- lua/lsp.lua
--
-- LSP 共通設定（Neovim 0.11+）
--
-- 目的:
-- - 各 LSP サーバーごとに同じ設定を繰り返さない
-- - Neovim 本体の LSP API (vim.lsp.config) に寄せる
-- - after/lsp/*.lua を「設定定義」に専念させる
--
-- 方針:
-- - すべての LSP サーバーに共通で適用される設定を書く
-- - capabilities / flags など「横断的な関心事」だけを扱う
-- - 個別サーバーの事情（settings, root_dir 等）は after/lsp 側に任せる

vim.lsp.config('*', {
    ---------------------------------------------------------------------------
    -- capabilities
    --
    -- nvim-cmp を使っている場合、LSP に補完能力を通知する必要がある。
    -- cmp_nvim_lsp が存在しない環境でも壊れないよう pcall でガードする。
    --
    -- NOTE:
    -- - cmp を使わない場合は nil が返るが、それで問題はない
    -- - 個別 LSP 側で capabilities を上書きする必要は基本的に無い
    ---------------------------------------------------------------------------
    capabilities = (function()
        local ok, cmp = pcall(require, 'cmp_nvim_lsp')
        if ok and type(cmp.default_capabilities) == 'function' then
            return cmp.default_capabilities()
        end
        return nil
    end)(),

    ---------------------------------------------------------------------------
    -- flags
    --
    -- LSP からの textDocument/didChange の通知頻度制御。
    -- 値を小さくしすぎると CPU 負荷が増えるため、実用的な値にしている。
    --
    -- 150ms:
    -- - 入力遅延を感じにくい
    -- - 多くの LSP で安定している経験則の値
    ---------------------------------------------------------------------------
    flags = {
        debounce_text_changes = 150,
    },
})
