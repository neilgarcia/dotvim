execute pathogen#infect()
Helptags " Allow calling :help for plugins installed using pathogen

let mapleader = ","
syntax on
filetype plugin on
filetype plugin indent on 
" Edit and source vimrc
map <leader>vr :vsp $MYVIMRC<CR>
map <leader>so :source $MYVIMRC<CR>

" Formats entire file
nnoremap <leader>fef :normal! gg=G``<CR>

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
" allow undo after closing/reopening file
set undofile
set undodir=~/.vim/undodir

" Ignore .git .swp .tmp
set wildignore+=*/.git/*,*/tmp/*,*.swp

" Gui Running
if has("gui_running")
  if has("gui_macvim")
    set fu
  else
    map <silent> <F11>
          \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
  endif
endif

" Theme
set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid
let g:airline_theme = "hybrid"

" Ctrlp
map <C-r> :CtrlPBufTag<CR>

" Ack
nnoremap <leader>a :Ack 
if executable('rg')
  " Use ripgrep for ctrlp
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s -u --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_max_files = 0

  " Use rg over grep
  set grepprg=rg\ --vimgrep

  " Use rg over ack
  let g:ackprg="rg --vimgrep"
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
let g:statline_syntastic = 0

" Close buffer
map <leader>q :BD<CR>

" Git
map <leader>gbl :Gblame<CR>

" Buftabline
set hidden
nnoremap <C-Tab> :bnext<CR>
nnoremap <C-S-Tab> :bprev<CR>

" startify
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_session_persistence = 1
let g:startify_relative_path = 1
let g:startify_list_order = [
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Recent files:'],
      \ 'files',
      \ ['   Recent files in current directory:'],
      \ 'dir',
      \ ]
