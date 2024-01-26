compose() {
    # Arguments.
    local compose_file_regex="docker-compose.${1:?environment is required}.y[a]\{0,1\}ml"
    shift 1

    docker-compose --file="$(ls -1 | grep "${compose_file_regex}" | head -n 1)" "$@"
    return $?
}
