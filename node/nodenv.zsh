if hash nodenv &>/dev/null; then
    NODENV_EXEC="$(which nodenv)"
fi

if [[ -x "$NODENV_EXEC" ]]; then
    eval "$(nodenv init -)"
fi

export PATH
