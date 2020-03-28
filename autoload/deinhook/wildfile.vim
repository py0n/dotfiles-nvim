" https://github.com/gcmt/wildfire.vim

function deinhook#wildfire#hookadd()
    " http://hail2u.net/blog/software/vim-wildfire.html
    " http://m.designbits.jp/14030411/
    let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'ip', 'it', 'i>']
endfunction
