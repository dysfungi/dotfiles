BREWBASE="$HOME/.linuxbrew"
if [[ -d "$BREWBASE" ]]; then
    BREWBIN="$BREWBASE/bin"
    [[ -d "$BREWBIN" ]] && export PATH="$PATH:$BREWBIN"

    BREWSHARE="$BREWBASE/share"
    [[ -d "$BREWSHARE" ]] && export XDG_DATA_DIRS="$XDG_DATA_DIRS:$BREWSHARE"
fi

GNUBINS=(
    "/usr/local/opt/coreutils/libexec/gnubin"
    "/usr/local/opt/grep/libexec/gnubin"
    "/usr/local/opt/gnu-sed/libexec/gnubin"
)

for GNUBIN in "${GNUBINS[@]}"; do
    if [[ -d "$GNUBIN" ]]; then
        export PATH="$GNUBIN:$PATH"
    fi
done
