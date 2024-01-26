if command -v gandalf &>/dev/null; then
    export GANDALF_ENABLE_AUTOUPGRADE=1
    eval "$(gandalf --completion-script-zsh)"
fi
