# Less is more
export PAGER='less'
export LESS='--quit-if-one-screen --tabs=4 --RAW-CONTROL-CHARS'
# Nicer highlighting
# https://www.reddit.com/r/vim/comments/1l304v/use_vim_as_alternative_to_less/cbvasaq?utm_source=share&utm_medium=web2x&context=3
if command -v src-hilite-lesspipe.sh &>/dev/null; then
    export LESSOPEN='| src-hilite-lesspipe.sh %s'
fi
