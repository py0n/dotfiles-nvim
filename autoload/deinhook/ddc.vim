" 新世代の自動補完プラグイン ddc.vim
"
"     https://zenn.dev/shougo/articles/ddc-vim-beta
"
" dein.vim:tomlファイルでプラグイン管理する
"
"     https://leico.github.io/TechnicalNote/VimR/VimR-dein-toml
function deinhook#ddc#hooksource()
    call ddc#custom#patch_filetype(['vim'], {
    \   'keywordPattern': '[a-zA-Z_][a-zA-Z_0-9:#]*',
    \   })
    call ddc#custom#patch_global('sources', [
    \   'around',
    \   'nextword',
    \   'nvim-lsp',
    \   'vsnip',
    \   ])
    call ddc#custom#patch_global('sourceOptions', {
    \   'around': {
    \       'mark': 'A',
    \   },
    \   'nextword': {
    \       'mark': 'N',
    \       'minAutoCompleteLength': 3,
    \       'isVolatile': v:true,
    \   },
    \   'nvim-lsp': {
    \       'mark': 'L',
    \       'forceCompletionPattern': '\.\w*|:\w*|->\w*',
    \   },
    \   '_': {
    \       'matchers': ['matcher_head'],
    \       'sorters': ['sorter_rank'],
    \   },
    \   })
    call ddc#enable()
endfunction
