execute pathogen#infect()

let mapleader = ","
set number
set softtabstop=2
set shiftwidth=2
set expandtab

" Theme
set background=dark
colorscheme hybrid_material
let g:airline_theme = "hybrid"

" Ctrlp
map <C-r> :CtrlPBufTag<CR>

" Ack.vim
nnoremap <leader>a :Ack 
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag over ack
  let g:ackprg="ag --vimgrep"

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

  " ag is fast enought that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

endif

" Nerdtree
map <leader>e :NERDTreeFind<CR>
map <leader>t :NERDTreeToggle<CR>

" Vim slim
syntax enable
filetype plugin indent on

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
