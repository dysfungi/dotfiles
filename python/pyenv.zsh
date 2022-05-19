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
    if pyenv init --path &>/dev/null; then
        eval "$(pyenv init --path)"
    fi
    eval "$($PYENV_EXEC init -)"
    eval "$($PYENV_EXEC virtualenv-init -)"
fi

#export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_VERBOSE_ACTIVATE=1
export PATH

# https://github.com/pyenv/pyenv/issues/1737#issuecomment-764506047
# export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
