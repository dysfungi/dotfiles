if command -v just &>/dev/null; then
    just --completions zsh > "$(dirname $0)/completion.zsh"
fi
