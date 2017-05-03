"===============================================================================
" Plugin source
"===============================================================================
"'Shougo/vimfiler.vim'

"===============================================================================
" Plugin Configurations
"===============================================================================
function! VimfilerCurrentDir()
    let currentDir = vimfiler#get_marked_files(b:vimfiler)
    for dirItem in currentDir
        if dirItem.vimfiler__is_marked == 1
            return dirItem.action__path
        endif
    endfor
endfunction

function! VimfilerSearch()
    let dirToSearch = VimfilerCurrentDir()
    let pattern = input("Search [".dirToSearch."] For: ")
    if pattern == ''
        echo 'Maybe another time...'
        return
    endif
    exec 'silent grep! "'.pattern.'" '.dirToSearch
    exec "redraw!"
    exec "redrawstatus!"
    exec "copen"
endfunction

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc\|__pycache__'

autocmd FileType vimfiler nunmap <buffer> <Space>
autocmd FileType vimfiler nunmap <buffer> <C-l>
autocmd FileType vimfiler nunmap <buffer> <C-j>
autocmd FileType vimfiler nunmap <buffer> l
autocmd FileType vimfiler nmap <buffer> l <Plug>(vimfiler_cd_or_edit)
autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
autocmd FileType vimfiler nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler nmap <buffer> <Leader>sd <Plug>(vimfiler_mark_current_line):call VimfilerSearch()<CR>
autocmd FileType vimfiler vmap <buffer> x <Plug>(vimfiler_toggle_mark_selected_lines)
autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
\ "\<Plug>(vimfiler_expand_tree)",
\ "\<Plug>(vimfiler_edit_file)")

"===============================================================================
" Plugin Keymappings
"===============================================================================
nnoremap <silent> <Leader>t :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
nnoremap <silent> <Leader>e :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -no-quit -find<CR>
