-- after/lsp/lua_ls.lua  (return するだけ)
---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
    },
  },
  -- on_attach / capabilities は必要に応じてここで指定できますが、
  -- on_attach が関数を直接参照する場合は別途共通処理に切り出す方が読みやすいです。
}
