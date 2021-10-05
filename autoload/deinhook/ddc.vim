" https://zenn.dev/shougo/articles/ddc-vim-beta
function deinhook#ddc#hookadd()
    call ddc#custom#patch_filetype(['vim'], {
     \ 'keywordPattern': '[a-zA-Z_][a-zA-Z_0-9:#]*',
     \ })
    call ddc#custom#patch_global('sources', ['around', 'nextword', 'nvimlsp'])
    call ddc#custom#patch_global('sourceOptions', {
     \  'around': {'mark': 'A'},
     \  'nextword': {'mark': 'nextword'},
     \  'nvimlsp': {'mark': 'lsp', 'forceCompletionPattern': '\.|:|->'},
     \  '_': {'matchers': ['matcher_head'], 'sorters': ['sorter_rank']},
     \  })
    call ddc#enable()
    call ddc_nvim_lsp_doc#enable()
endfunction
