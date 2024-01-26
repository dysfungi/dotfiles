#!/bin/sh

fontDir="$HOME/Library/Fonts"
case "$(uname -s)" in
    Darwin)
        [ -e "$fontDir" ] && find "$(dirname "$0")/Lotion" -type f -name "*.[ot]tf" -exec cp -v "{}" "$fontDir/" \;
        echo "Remaining fonts on Mac are installed via Homebrew into $fontDir"
        ;;
    *)
        echo >&2 "TODO: need to implement installing .otb/.pcf fonts on Linux"
        ;;
esac
