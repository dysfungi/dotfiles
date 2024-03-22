discoverous() {
    # https://gh.riotgames.com/shared-static-data/service-discovery/blob/master/discovery_servers.json
    local datacenterName="${1:?discovery server name/alias is required}"
    local appName="${2}"
    local appLoc="${3}"

    local relPath="v2/apps"
    if [[ -n "${appName}" ]]; then
        relPath="${relPath}/${appName}"
    fi

    local -a query
    if [[ -n "${appLoc}" ]]; then
        query+="location==${appLoc}"
    fi

    local discBaseUrl="$(dig +short TXT "${datacenterName}discovery.service.riotgames.com" | jq --raw-output 'split(",")[0]')"
    http --check-status --ignore-stdin GET "${discBaseUrl}/${relPath}" "${query[@]}"
    return $?
}
