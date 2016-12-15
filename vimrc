execute pathogen#infect()
Helptags " Allow calling :help for plugins installed using pathogen

let mapleader = ","
syntax on
filetype plugin on
filetype plugin indent on

" Edit and source vimrc
map <leader>vr :sp $MYVIMRC<CR>
map <leader>so :source $MYVIMRC<CR>

" Basic Configs
set number
set ruler
set softtabstop=2
set shiftwidth=2
set hlsearch
set incsearch
set expandtab
set autoindent
set tags=./tags
set backupdir=~/.tmp
set directory=~/.tmp " Move tmp and swp files on tmp
inoremap <c-s> <c-o>:Update<CR><CR>

" Gui Running
if has("gui_running")
  map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
endif

" Theme
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
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

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Maps save to Ctrl S
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Copy file path easily for unit testing
set clipboard=unnamed
map <leader>cfp :!echo "%:p" \| pbcopy<CR><CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Close buffer
map <leader>q :bd<CR>

" Git
map <leader>gbl :Gblame<CR>
