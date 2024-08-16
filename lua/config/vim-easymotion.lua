vim.cmd([[
" http://haya14busa.com/vim-lazymotion-on-speed/
" http://haya14busa.com/mastering-vim-easymotion/
" http://haya14busa.com/vim-easymotion-ver-3-dot-0-overwin-motions/

" Disable default mappings
" If you are true vimmer, you should explicitly map keys by yourself.
" Do not rely on default bidings.
let g:EasyMotion_do_mapping = 0

" n-character serach motion
" Extend search motions with vital-over command line interface
" Incremental highlight of all the matches
" Now, you don't need to repetitively press `n` or `N` with
" EasyMotion feature
" `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
" :h easymotion-command-line
nmap / <Plug>(easymotion-sn)
xmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

" hjkl motions
"map  <Space>j <Plug>(easymotion-j)
"map  <Space>k <Plug>(easymotion-k)
map  <Space>h <Plug>(easymotion-linebackward)
map  <Space>j <Plug>(easymotion-bd-jk)
map  <Space>k <Plug>(easymotion-bd-jk)
map  <Space>l <Plug>(easymotion-lineforward)
nmap <Space>j <Plug>(easymotion-overwin-line)
nmap <Space>k <Plug>(easymotion-overwin-line)

" Move to word
map  <Space>w <Plug>(easymotion-bd-w)
nmap <Space>w <Plug>(easymotion-overwin-w)

" keep cursor colum when JK motion
let g:EasyMotion_startofline = 0

" Show target key with upper case to improve readability
let g:EasyMotion_keys      = 'HKLYUIOPNM,QWERTASDGZXCVBJF;'
let g:EasyMotion_use_upper = 1
]])
