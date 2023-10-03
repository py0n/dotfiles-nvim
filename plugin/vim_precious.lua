-- https://github.com/osyo-manga/vim-precious
-- カーソルの位置によって `filetype` を切り替える
vim.cmd([[
" http://qiita.com/kawaz/items/ee725f6214f91337b42b
let g:precious_enable_switch_CursorMoved = {'*':0, 'help':1}
autocmd MyAugroup InsertEnter * :PreciousSwitch
autocmd MyAugroup InsertLeave * :PreciousReset
]])
