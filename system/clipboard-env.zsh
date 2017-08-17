# Interact with the system clipboard via the command-line.
if [[ "$(uname)" = 'Darwin' ]]; then
    alias c='pbcopy'
    alias v='pbpaste'
    alias cs=c
    alias vs=v
else
    alias c='xclip -i'
    alias v='xclip -o'
    alias cs='xclip -selection clipboard'
    alias vs='xclip -o -selection clipboard'
fi

# Execute what's in the clipboard.
alias ve='`v`'
alias vse='`vs`'
