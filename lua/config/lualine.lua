-- https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
-- https://qiita.com/yuyuchu3333/items/20a0acfe7e0d0e167ccc
vim.cmd([[
function! MyCharCode()
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
endfunction
]])

local function charCodeUnderCursor()
    return vim.fn.MyCharCode()
end

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {charCodeUnderCursor, 'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
