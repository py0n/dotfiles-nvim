vim.cmd([[
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    if has('macunix')
        set ambiwidth=single
    else
        set ambiwidth=double
    endif
endif
]])
