k8() {
    kubectl "$@"
}

k8n() {
    kubectl get po "$@" --output=json \
        | jq -r '.items[] | select(.status.phase == "Running") | .metadata.name'
    return $?
}

k8e() {
    local filter="${1:?filter required}"
    printf "filter=%s\n" "$filter" >&2
    local context="${2:-$(kubectl config current-context)}"
    printf "context=%s\n" "$context" >&2
    local cmd="${3:-sh}"
    printf "command=%s\n" "$cmd" >&2

    local pod="$(k8n --context="$context" -l="$filter" | head -n 1)"

    if [[ -z "$pod" ]]; then
        echo "No pod found" >&2
    else
        kubectl --context="$context" exec -it "$pod" -- $cmd
    fi
    return $?
}
