#!/bin/sh

# TODO: make this a Brew tap? careful with security though
keyconjurerBaseUrl="https://keyconjurer.security.riotgames.com/keyconjurer-darwin-"
keyconjurerTarget="/usr/local/bin/keyconjurer"
case "$(uname -m)" in
    arm64)
        curl -fsSl "$keyconjurerBaseUrl-amd64" "$keyconjurerTarget"
        ;;
    x86_64)
        curl -fsSl "$keyconjurerBaseUrl-arm64" "$keyconjurerTarget"
        ;;
    *)
        echo >&2 "Unsupported platform: cannot install keyconjurer"
        ;;
esac
