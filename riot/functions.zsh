discoverous() {
    # https://gh.riotgames.com/shared-static-data/service-discovery/blob/master/discovery_servers.json
    local discName="${1:?discovery server name/alias is required}"
    local appName="${2:?RFC-190 application name is required}"
    local appLoc="${3}"

    local -a query
    if [[ -n "${appLoc}" ]]; then
        query+="location==${appLoc}"
    fi

    local -a discBaseUrls=( $(dig +short TXT "${discName}discovery.service.riotgames.com" | tr -d '"' | tr ',' $'\n') )
    for discBaseUrl in "${discBaseUrls[@]}"; do
        http --check-status --ignore-stdin GET "${discBaseUrl}/v2/apps/${appName}" "${query[@]}"
        return $?
    done
}
