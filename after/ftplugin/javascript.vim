" Find imported path
setlocal path=.,src,node_nodules,app/client
setlocal suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

setlocal includeexpr=LoadMainNodeModule(v:fname)
nnoremap <C-w>f :vertical wincmd f<CR>
