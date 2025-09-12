-- Codex CLI により生成（ftdetect のルールを Lua へ移行）
-- Neovim の Lua API でファイルタイプ検出を一元化
-- 旧 ftdetect/*.vim のルールを移植

-- html -> perl、tmpl -> html
vim.filetype.add({
  extension = {
    -- 旧 ftdetect/html.vim より
    html = "perl",
    tmpl = "html",

    -- 旧 ftdetect/perl.vim より
    pl   = "perl",
    pm   = "perl",
    psgi = "perl",
    t    = "perl",
    cgi  = "perl",
    tdy  = "perl",

    -- 旧 ftdetect/toml.vim より
    toml = "toml",
  },
})
