" https://github.com/itchyny/lightline.vim
" https://github.com/retorillo/powercord
function deinhook#lightline#hookadd()
    let g:lightline = {
     \  'colorscheme'  : 'solarized',
     \  'separator'    : {'left': "\ue0b0", 'right': "\ue0b2"},
     \  'subseparator' : {'left': "\ue0b1", 'right': "\ue0b3"},
     \  'active'       : {
     \      'left' : [
     \          ['mode'],
     \          ['fugitive', 'gitgutter', 'filename', 'anzu']
     \      ],
     \      'right': [
     \          ['syntastic', 'lineinfo'],
     \          ['percent'],
     \          ['charcode', 'fileformat', 'fileencoding', 'filetype']
     \      ]
     \  },
     \  'component_expand': {
     \      'syntastic': 'SyntasticStatuslineFlag'
     \  },
     \  'component_function': {
     \      'anzu'         : 'MyAnzu',
     \      'charcode'     : 'MyCharCode',
     \      'fileencoding' : 'MyFileencoding',
     \      'fileformat'   : 'MyFileformat',
     \      'filename'     : 'MyFilename',
     \      'filetype'     : 'MyFiletype',
     \      'fugitive'     : 'MyFugitive',
     \      'gitgutter'    : 'MyGitgutter',
     \      'lineinfo'     : 'MyLineinfo',
     \      'mode'         : 'MyMode',
     \      'percent'      : 'MyPercent'
     \  },
     \  'component_type': {'syntastic': 'error'}
     \  }
    function! MyAnzu() " {{{
        if dein#check_install(['vim-anzu'])
            return ''
        endif
        return anzu#search_status()
    endfunction " }}}
    function! MyCharCode() " {{{
        " Get the output of :ascii
        redir => ascii
        silent! ascii
        redir END

        if match(ascii, 'NUL') != -1
            return 'NUL'
        endif

        " Get the character and the numeric value from the return value of :ascii
        " This matches the two first pieces of the return value, e.g.
        " "<F>  70" => char: 'F', nr: '70'
        let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

        " Unicodeスカラ値
        let uniHex = printf('%X', nr)
        if strlen(uniHex) < 4
            for i in range(4 - strlen(uniHex))
                let uniHex = '0' . uniHex
            endfor
        endif
        let uniHex = 'U+' . uniHex

        " iconvが利用可能ならfileencodingでの文字コードも表示する
        let fencStr = iconv(char, &encoding, &fileencoding)
        let fencHex = ''
        for i in range(strlen(fencStr))
            let fencHex = fencHex . printf('%X', char2nr(fencStr[i]))
        endfor
        let fencHex = '0x' . (strlen(fencHex) % 2 == 1 ? '0' : '') . fencHex

        return "'" . char . "' " . fencHex . " (" . uniHex . ")"
    endfunction " }}}
    function! MyFileencoding() " {{{
        return strlen(&fileencoding) ? &fileencoding : &encoding
    endfunction " }}}
    function! MyFileformat() " {{{
        return &ff
    endfunction " }}}
    function! MyFilename() " {{{
        return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
         \  (&ft == 'vimfiler' ? vimfiler#get_status_string() :
         \      &ft == 'unite' ? unite#get_status_string() :
         \      &ft == 'vimshell' ? vimshell#get_status_string() :
         \      '' != expand('%:t') ? expand('%:t') : '[No Name]') .
         \  ('' != MyModified() ? ' ' . MyModified() : '')
    endfunction " }}}
    function! MyFiletype() " {{{
        return strlen(&filetype) ? &filetype : 'no ft'
    endfunction " }}}
    function! MyFugitive() " {{{
        try
            if &filetype !~? '\v(vimfiler|gundo)'
                let head = fugitive#head()
                return head
            else
                throw 'vimfiler_or_gundo'
            endif
        catch
            return ''
        endtry
    endfunction " }}}
    function! MyGitgutter() " {{{
        " http://qiita.com/yuyuchu3333/items/20a0acfe7e0d0e167ccc
        if dein#check_install(['vim-gitgutter'])
            return ''
        endif
        let hunks = GitGutterGetHunkSummary()
        let symbols = [
         \  g:gitgutter_sign_added . ' ',
         \  g:gitgutter_sign_modified . ' ',
         \  g:gitgutter_sign_removed . ' '
         \  ]
        let ret = []
        for i in [0, 1, 2]
            if hunks[i] > 0
                call add(ret, symbols[i] . hunks[i])
            endif
        endfor
        return join(ret, ' ')
    endfunction " }}}
    function! MyLineinfo() " {{{
        let l:cl = line('.')
        let l:cc = col('.')
        return printf('%d:%d', l:cl, l:cc)
    endfunction " }}}
    function! MyMode() " {{{
        let l:ps = ''
        if &paste
            let l:ps = ' P'
        endif
        return lightline#mode() . l:ps
    endfunction " }}}
    function! MyModified() " {{{
        return &filetype =~ '\v(help|vimfiler|gundo)'
         \  ? ''  : &modified
         \  ? '+' : &modifiable
         \  ? ''  : '-'
    endfunction " }}}
    function! MyPercent() " {{{
        let l:cl = line('.')
        let l:ll = line('$')
        return printf('%3d%%', 100 * l:cl / l:ll)
    endfunction " }}}
    function! MyReadonly() " {{{
        return &ft !~? '\v(help|vimfiler|gundo)' && &ro ? 'x' : ''
    endfunction " }}}
endfunction
