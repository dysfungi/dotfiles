if [ -n "$HOMEBREW_PREFIX" ]; then
    fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
fi
