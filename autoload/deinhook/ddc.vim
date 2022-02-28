" https://zenn.dev/shougo/articles/ddc-vim-beta
function deinhook#ddc#hookadd()
    call ddc#custom#patch_filetype(['vim'], {
    \   'keywordPattern': '[a-zA-Z_][a-zA-Z_0-9:#]*',
    \   })
    call ddc#custom#patch_global('sources', [
    \   'around',
    \   'nextword',
    \   'nvim-lsp',
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
