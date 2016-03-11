setlocal smarttab

nnoremap [perl]   <Nop>
nmap     <Space>p [perl]
nnoremap <buffer> [perl]f :%!perltidy<CR>
vnoremap [perl]   <Nop>
vmap     <Space>p [perl]
vnoremap <buffer> [perl]f :!perltidy<CR>

" Vimでカーソル下のPerlモジュールを開く
" http://d.hatena.ne.jp/spiritloose/20060817/1155808744
setlocal isfname-=-

