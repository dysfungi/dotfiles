tmx() {
    tmux attach -t "$@" || tmux new -s "$@"
}
tmu() {
    tmx "$@"
}
