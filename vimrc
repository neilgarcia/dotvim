execute pathogen#infect()

let mapleader = ","
set number
set softtabstop=2
set shiftwidth=2
set expandtab

set background=dark
colorscheme seti

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
