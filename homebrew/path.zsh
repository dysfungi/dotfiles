BREWBASE="$HOME/.linuxbrew"
if [[ -d "$BREWBASE" ]]; then
    BREWBIN="$BREWBASE/bin"
    [[ -d "$BREWBIN" ]] && export PATH="$PATH:$BREWBIN"

    BREWSHARE="$BREWBASE/share"
    [[ -d "$BREWSHARE" ]] && export XDG_DATA_DIRS="$XDG_DATA_DIRS:$BREWSHARE"
fi
