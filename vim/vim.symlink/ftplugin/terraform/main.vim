if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

setlocal autoindent
setlocal colorcolumn=88
setlocal comments="b:#,://,:/*"
setlocal commentstring="/* %s */"
setlocal expandtab
setlocal nocindent
setlocal shiftwidth=2
setlocal smartindent
setlocal smarttab
setlocal tabstop=2
setlocal textwidth=88
