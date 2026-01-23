-- Perl 用 ftplugin（Lua 版）
-- Perl バッファが開かれたときにのみ適用される buffer-local 設定
-- Vimscript 版 ftplugin からの移行

-- =========================================================
-- キーマップ定義
-- =========================================================

-- Perl 用の疑似プレフィックスキー
-- [perl] 自体は何も実行しない (<Nop>) が、
-- [perl]{key} という形で Perl 専用キーマップを束ねるための起点として使う
vim.keymap.set({ 'n', 'v' }, '[perl]', '<Nop>', {
    buffer = true,
    silent = true,
})

-- <Space>t を Perl 用プレフィックスのエイリアスとして割り当てる
-- <Space>t → [perl] というキー列を送出し、
-- remap=true により [perl] を文字列ではなくキー列として再解釈させる
vim.keymap.set({ 'n', 'v' }, '<Space>t', '[perl]', {
    buffer = true,
    silent = true,
    remap = true,
})

-- =========================================================
-- Perl 固有操作
-- =========================================================

-- フォーマット: perltidy を適用
-- ノーマルモード: バッファ全体を整形
-- ビジュアルモード: 選択範囲のみ整形
vim.keymap.set('n', '[perl]f', '<Cmd>%!perltidy<CR>', { buffer = true })
vim.keymap.set('v', '[perl]f', ':!perltidy<CR>', { buffer = true })

-- =========================================================
-- バッファローカルオプション
-- =========================================================

-- モジュール名（Foo::Bar）でのジャンプを考慮し、
-- isfname から '-' を除外する
vim.opt_local.isfname:remove('-')

-- Perl のインデント操作向けに smarttab を有効化
vim.opt_local.smarttab = true

-- =========================================================
-- 後始末（filetype 変更時 / バッファ破棄時）
-- =========================================================

-- filetype が変わる際に、この ftplugin が行った設定を元に戻す
vim.b.undo_ftplugin = table.concat({
    'setlocal isfname< smarttab<',
    'silent! nunmap <buffer> [perl]',
    'silent! nunmap <buffer> <Space>t',
    'silent! vunmap <buffer> [perl]',
    'silent! vunmap <buffer> <Space>t',
    'silent! nunmap <buffer> [perl]f',
    'silent! vunmap <buffer> [perl]f',
}, ' | ')
