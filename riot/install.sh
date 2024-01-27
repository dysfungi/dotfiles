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


# TODO: figure out how to download
# https://gh.riotgames.com/pages/rcluster/rcluster/tutorials/gandalf-tutorial/gandalf-cli/#get-the-gandalf-cli
# https://gh.riotgames.com/rcluster/gandalf/releases
#if ! command -v gandalf >/dev/null; then
#    wget --output-document="-" "https://gh.riotgames.com/rcluster/gandalf/releases/latest/download/darwin-amd64-gandalf.tar.bz2" \
#        | sudo tar --bzip2 --dir="/usr/local/bin" --extract --file="-" --verbose
#    sudo chmod +x "/usr/local/bin/gandalf"
#fi
