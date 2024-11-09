"if exists("b:did_ftplugin")
"    finish
"endif

setlocal autoindent
setlocal colorcolumn=88
setlocal comments=":<!---"
setlocal commentstring="<!--- %s -->"
setlocal expandtab
setlocal nocindent
setlocal shiftwidth=2
setlocal smartindent
setlocal smarttab
setlocal softtabstop=2
setlocal textwidth=88

if has('autocmd')
    " improved formatting for markdown
    " http://plasticboy.com/markdown-vim-mode/
    autocmd BufRead *.mkd setlocal ai formatoptions=tcroqn2 comments=n:>
    autocmd BufRead ~/.blog/entries/* setlocal ai formatoptions=tcroqn2 comments=n:>
endif

let b:did_ftplugin = localtime()
