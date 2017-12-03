let g:grepper.rg = { 'grepprg': 'rg -H --no-heading --vimgrep' }
let g:grepper.rg.grepprg .= ' --type-add slim:*.slim --type-add haml:*.haml'
