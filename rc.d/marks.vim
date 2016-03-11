" レジスタを指定せずにマークする {{{
" http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908
if !exists('s:markrement_chars')
    let s:markrement_chars = [
     \  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
     \  'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
     \  'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
     \  'y', 'z'
     \  ]
endif

function! s:auto_markrement() abort
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(s:markrement_chars)
    endif
    execute 'mark' s:markrement_chars[b:markrement_pos]
    echo 'marked' s:markrement_chars[b:markrement_pos]
endfunction

noremap [Mark] <Nop>
nmap    m      [Mark]

" 現在位置をマーク
nnoremap <silent>[Mark]m :<C-u>call <SID>auto_markrement()<CR>

" `Unite mark` があるので不要 {{{
" " 次/前のマーク
" nnoremap [Mark]n ]`
" nnoremap [Mark]p [`
"
" " マーク一覧
" nnoremap [Mark]l :<C-u>marks<CR>
" }}}
" }}}

" vim:set fileencoding=utf-8 fileformat=unix foldmethod=marker:
