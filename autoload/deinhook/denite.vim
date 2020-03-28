function deinhook#denite#config()
    nnoremap <silent> <C-p> :<C-u>Denite file_mru<CR>
    nnoremap <silent> <C-n> :<C-u>Denite `finddir('.git',';') != '' ? 'file_rec/git' : 'file/rec'`<CR>

    nnoremap [denite] <Nop>
    nmap     <Space>u [denite]

    " Define mappings
    autocmd FileType denite call s:denite_my_settings()
    function! s:denite_my_settings() abort
        nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
        nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
        nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
        nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
        nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
        nnoremap <silent><buffer><expr> q       denite#do_map('quit')
    endfunction

    " https://qiita.com/pocari/items/1b76c211d5555fa87834
    " ファイル検索
    nnoremap <silent> [denite]g :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
    " ファイル内検索
    nnoremap <silent> [denite]o :<C-u>Denite line -buffer-name=search-buffer-denite<CR>
    " 検索をresume
    nnoremap <silent> [denite]r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
    " resumeした検索の前後に移動
    nnoremap <silent> [denite]n :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
    nnoremap <silent> [denite]p :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>

    " file_mru source {{{
    call denite#custom#source('file_mru', 'matchers', [
     \  'matcher_fuzzy',
     \  'matcher_project_files'
     \  ])
    " }}}

    " grep source {{{
    if executable('pt')
        call denite#custom#var('grep', 'command', ['pt'])
        call denite#custom#var('grep', 'default_opts', ['--hidden','--nocolor','--nogroup','--smart-case'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opts', ['--regexp'])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])
    endif
    " }}}

    " file_rec/git source {{{
    if executable('git')
        call denite#custom#alias('source', 'file_rec/git', 'file/rec')
        call denite#custom#var('file_rec/git', 'command', [
         \  'git',
         \  'ls-files',
         \  '--cached',
         \  '--exclude-standard',
         \  '--others'
         \  ])
    endif
    " }}}

    " mapping {{{
    " Change mappings.
    call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
    call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
    " }}}

    " Floating Window の設定
    " https://qiita.com/lighttiger2505/items/d4a3371399cfe6dbdd56
    let s:denite_win_width_percent = 0.85
    let s:denite_win_height_percent = 0.7

    " Change denite default options
    call denite#custom#option('default', {
     \ 'split': 'floating',
     \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
     \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
     \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
     \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
     \ })
endfunction
