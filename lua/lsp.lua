-- lua/lsp.lua
-- LSP 共通設定（Neovim 0.11+）
vim.lsp.config('*', {
	-- nvim-cmp を使っているなら補完能力を全サーバに付与
	capabilities = (function()
		local ok, cmp = pcall(require, 'cmp_nvim_lsp')
		if ok and type(cmp.default_capabilities) == 'function' then
			return cmp.default_capabilities()
		end
		return nil
	end)(),

	flags = {
		debounce_text_changes = 150,
	},
})
