bindkey -v
#
## KEY BINDINGS for Colemak
#
# INSERT MODE
# Enter vi command mode
bindkey -M viins ",m" vi-cmd-mode # bindkey -M viins -s ",m" '\e'
bindkey -M viins "jk" vi-cmd-mode
#
# COMMAND MODE
# Enter vi insert mode
bindkey -M vicmd "l" vi-insert # bindkey -M vicmd -s "h" "i"
bindkey -M vicmd "L" vi-insert-bol # bindkey -M vicmd -s "H" "I"
#
# Moving in Colemak
bindkey -M vicmd "e" up-line-or-history # bindkey -M vicmd -s "u" "k"
bindkey -M vicmd "n" down-line-or-history # bindkey -M vicmd -s "e" "j"
bindkey -M vicmd "i" forward-char # bindkey -M vicmd -s "i" "l"
bindkey -M vicmd "h" backward-char # bindkey -M vicmd -s "n" "h"
#
bindkey -M vicmd "j" vi-forward-word-end  # bindkey -M vicmd -s "l" "e"
# bindkey -M vicmd "L" vi-forward-blank-word-end  # bindkey -M vicmd -s "L" "E"
#
# Undo
# bindkey -M vicmd "z" undo # bindkey -M vicmd -s "z" "u"
# bindkey -M vicmd "Z" vi-undo-change # bindkey -M vicmd -s "Z" "U"
#bindkey -M vicmd "t" vi-repeat-change # bindkey -M vicmd -s "t" "U"
#
# History search
bindkey -M vicmd "k" vi-repeat-search # bindkey -M vicmd -s "k" "n"
bindkey -M vicmd "K" vi-rev-repeat-search # bindkey -M vicmd -s "K" "N"
#
# bindkey -M vicmd -s "j" "U"
# bindkey -M vicmd -s "T" "U"
# bindkey -M vicmd -s "N" "H"
# bindkey -M vicmd -s "I" "L"
# bindkey -M vicmd -s "U" "K"
# bindkey -M vicmd -s "E" "J"
# bindkey -M vicmd -s "Z" '^r' # bindkey -M vicmd -s "Z" '\C-r'
