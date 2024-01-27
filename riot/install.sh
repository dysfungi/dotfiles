#!/bin/sh

# TODO: make this a Brew tap? careful with security though
# https://keyconjurer.security.riotgames.com/
if ! command -v keyconjurer >/dev/null; then
    keyconjurerBaseUrl="https://keyconjurer.security.riotgames.com/keyconjurer-darwin"
    keyconjurerTarget="/usr/local/bin/keyconjurer"
    keyconjurerUrl=""
    case "$(uname -m)" in
        arm64)
            keyconjurerUrl="$keyconjurerBaseUrl-arm64"
            ;;
        x86_64)
            keyconjurerUrl="$keyconjurerBaseUrl-amd64"
            ;;
        *)
            echo >&2 "Unsupported platform: cannot install keyconjurer"
            ;;
    esac
    if [ -n "$keyconjurerUrl" ]; then
        sudo wget --output-document="$keyconjurerTarget" "$keyconjurerUrl"
        sudo chmod +x "$keyconjurerTarget"
    fi
fi
keyconjurer login
