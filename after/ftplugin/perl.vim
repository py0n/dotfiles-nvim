" # Reference
"
" * $VIMRUNTIME/ftplugin/perl.vim
" * http://whileimautomaton.net/2008/09/07213145
"   * Vim: Filetype pluginを極める

let s:save_cpo = &cpo
set cpo-=C

nnoremap <buffer> [perl]   <Nop>
nmap     <buffer> <Space>t [perl]
vnoremap <buffer> [perl]   <Nop>
vmap     <buffer> <Space>t [perl]

nnoremap <buffer> [perl]f :%!perltidy<CR>
vnoremap <buffer> [perl]f :!perltidy<CR>

" Vimでカーソル下のPerlモジュールを開く
" http://d.hatena.ne.jp/spiritloose/20060817/1155808744
setlocal isfname-=-
setlocal smarttab

let b:undo_ftplugin = 'setlocal isfname< smarttab<'

let &cpo = s:save_cpo
unlet s:save_cpo
