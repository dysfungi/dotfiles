BIN="$HOME/.pyenv/bin"
EXECUTABLE="$BIN/pyenv"
if [[ -x "$EXECUTABLE" ]]; then
    export PATH="$BIN:$PATH"
    eval "$($EXECUTABLE init -)"
    eval "$($EXECUTABLE virtualenv-init -)"
fi
