export PYENV_ROOT="$HOME/.pyenv"
PYENV_BIN="$PYENV_ROOT/bin"
PYENV_SHIMS="$PYENV_ROOT/shims"

if hash pyenv &>/dev/null; then
    EXECUTABLE="$(which pyenv)"
elif [[ -d "$PYENV_BIN" ]]; then
    export PATH="$PYENV_BIN:$PATH"
    EXECUTABLE="$PYENV_BIN/pyenv"
fi

if [[ -x "$EXECUTABLE" ]]; then
    eval "$($EXECUTABLE init -)"
    eval "$($EXECUTABLE virtualenv-init -)"
fi

#export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_VERBOSE_ACTIVATE=1
export PATH
