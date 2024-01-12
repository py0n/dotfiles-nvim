-- https://github.com/Shougo/context_filetype.vim
vim.cmd([[
    if !exists('g:context_filetype#filetypes')
        let g:context_filetype#filetypes = {}
    endif
    let g:context_filetype#filetypes['html'] = [
     \  {
     \      'filetype' : 'javascript',
     \      'start'    : '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)\?>',
     \      'end'      : '</script>',
     \  },
     \  ]
    let g:context_filetype#filetypes['toml'] = [
     \  {
     \      'filetype' : 'vim',
     \      'start'    : '^\s*hook_\(add\|source\|post_source\)\s*=\s*\('.'""'.'"'.'\|'."''"."'".'\)',
     \      'end'      : '\2',
     \  },
     \  ]
    let g:context_filetype#filetypes['lua'] = [
     \  {
     \      'filetype' : 'vim',
     \      'start'    : '\[\[',
     \      'end'      : '\]\]',
     \  },
     \  ]
]])
