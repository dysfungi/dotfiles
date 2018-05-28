# Use ~/.xinitrc instead
setopt nullglob extendedglob

typeset -U xmonad_files

if [[ "$GDB_SESSION" = xmonad ]] || [[ "$XDG_SESSION_DESKTOP" = xmonad ]]; then
    xmonad_files=($DOTFILES/**/*.xmonad)
    for file in ${xmonad_files}; do
        source "$file"
    done
fi

unset xmonad_files

unsetopt nullglob extendedglob
