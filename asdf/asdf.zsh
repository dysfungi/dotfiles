# https://news.ycombinator.com/item?id=30917354
# https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
ASDF_SCRIPT="$(brew --prefix asdf)/libexec/asdf.sh"
if [[ -f "${ASDF_SCRIPT}" ]]; then
    . "${ASDF_SCRIPT}"
else
    echo >&2 'Warning: `asdf` is not installed with Homebrew!'
fi
