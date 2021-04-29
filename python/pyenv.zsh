export PYENV_ROOT="$HOME/.pyenv"
PYENV_BIN="$PYENV_ROOT/bin"
PYENV_SHIMS="$PYENV_ROOT/shims"

if hash pyenv &>/dev/null; then
    PYENV_EXEC="$(which pyenv)"
elif [[ -d "$PYENV_BIN" ]]; then
    export PATH="$PYENV_BIN:$PATH"
    PYENV_EXEC="$PYENV_BIN/pyenv"
fi

if [[ -x "$PYENV_EXEC" ]]; then
    eval "$($PYENV_EXEC init -)"
    eval "$($PYENV_EXEC virtualenv-init -)"
fi

#export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_VERBOSE_ACTIVATE=1
export PATH
