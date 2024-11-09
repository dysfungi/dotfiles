"if exists("b:did_ftplugin")
"    finish
"endif

setlocal autoindent
setlocal colorcolumn=88
setlocal comments=":\""
setlocal commentstring="\" %s"
setlocal expandtab
setlocal nocindent
setlocal shiftwidth=4
setlocal smartindent
setlocal smarttab
setlocal softtabstop=4
setlocal textwidth=88

let b:did_ftplugin = localtime()
