"if exists("b:did_ftplugin")
"    finish
"endif

setlocal autoindent
setlocal colorcolumn=88
setlocal comments="b:#,://,:/*"
setlocal commentstring="# %s"
setlocal expandtab
setlocal cindent
setlocal shiftwidth=2
setlocal smartindent
setlocal smarttab
setlocal softtabstop=2
setlocal textwidth=88

let b:did_ftplugin = localtime()
