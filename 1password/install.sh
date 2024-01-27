if command -v op >/dev/null; then
    op signin
    find "$HOME/.config" -type d -name op -exec chmod -v 700 "{}" \;
    find "$HOME/.config" -type f -path "*/op/*" -name config -exec chmod -v 600 "{}" \;
fi
