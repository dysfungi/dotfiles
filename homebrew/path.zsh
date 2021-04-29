BREWBASE="$HOME/.linuxbrew"
if [[ -d "$BREWBASE" ]]; then
    BREWBIN="$BREWBASE/bin"
    [[ -d "$BREWBIN" ]] && export PATH="$PATH:$BREWBIN"

    BREWSHARE="$BREWBASE/share"
    [[ -d "$BREWSHARE" ]] && export XDG_DATA_DIRS="$XDG_DATA_DIRS:$BREWSHARE"
fi

# gnu-sed
GNUBIN="/usr/local/opt/gnu-sed/libexec/gnubin"
if [[ -d "$GNUBIN" ]]; then
    export PATH="$GNUBIN:$PATH"
fi
