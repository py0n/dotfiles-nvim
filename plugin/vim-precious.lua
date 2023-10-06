-- insert mode に入った時に 'filetype' を切り換える。
-- カーソル移動時の自動切り替えを無効化
vim.cmd([[
let g:precious_enable_switch_CursorMoved = {
\	"*" : 0
\}
let g:precious_enable_switch_CursorMoved_i = {
\	"*" : 0
\}

" insert に入った時にスイッチし、抜けた時に元に戻す
augroup VimPrecious
    autocmd!
    autocmd InsertEnter * :PreciousSwitch
    autocmd InsertLeave * :PreciousReset
augroup END
]])
