let g:pathogen_disabled = []
if has('nvim')
  call add(g:pathogen_disabled, 'ctrlp')
  call add(g:pathogen_disabled, 'syntastic')
endif

execute pathogen#infect()

Helptags " Allow calling :help for plugins installed using pathogen

let mapleader = ","
map <Space> ,

syntax on
filetype plugin on
filetype plugin indent on
" Edit and source vimrc
map <leader>vr :vsp $MYVIMRC<CR>
map <leader>so :source $MYVIMRC<CR>


" Basic Configs
set number            " Show line number
set relativenumber    " Show relative number
set ruler
set cursorline
set cursorcolumn
set autoread
au FocusGained,BufEnter * :silent! !

""
"" Undo history
""

if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
" off and the line continues beyond the left of the screen



""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter


""
"" Wild settings
""

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swp files
""

set backupdir=~/.tmp " Where to put backup files
set directory=~/.tmp " Where to put swap files

""
"" User defined commands
""

" Sane terminal binding
tnoremap <Esc> <C-\><C-n>

" Go to previous buffer
map <Space><Space> <C-^>

" Formats entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Split management
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

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
set clipboard=unnamedplus
map <leader>cfp :!echo "%:p" \| pbcopy<CR><CR>

" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-w>o :ZoomToggle<CR>

" Remove highlight
map <leader>nh :nohlsearch<CR>

""
"" Theme
""

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set background=dark           " Enable dark background
colorscheme onedark           " Set the colorscheme
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'


""
"" Plugins
""

" Ctrlp
if has('nvim')
  noremap <C-r> :BTags<CR>
  noremap <C-p> :Files<CR>
else
  map <C-r> :CtrlPBufTag<CR>
  set tags=./tags
endif

" Grepper
map <leader>a :GrepperRg<Space>
nmap <leader>qf <Plug>QfCtoggle

" Nerdtree
map <leader>e :NERDTreeFind<CR>
map <leader>t :NERDTreeToggle<CR>
" Close vim when nerdtree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic
if has('nvim')
  autocmd! BufWritePost * Neomake
else
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0
  let g:statline_syntastic = 0
endif

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

" FZF
set rtp+=~/.fzf
map <leader>b :Buffers<CR>
autocmd! FileType fzf tnoremap <buffer> <Esc> <c-c>

" Vim Test
map <silent> <leader>ft :TestFile<CR>

if has('nvim')
  " run tests with :T
  let test#strategy = "neoterm"

  " vertical split instead of the default horizontal
  let g:neoterm_position = "vertical"

  " pretty much essential: by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  " ain't nobody got time for that
  tnoremap <Esc> <C-\><C-n>
endif

" Deoplete
let g:deoplete#enable_at_startup = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
