# Brew install path depends on architecture: https://stackoverflow.com/a/71186857
if [ -d "/opt/homebrew/bin" ]; then
    brewPath="/opt/homebrew/bin"
else
    brewPath="/usr/local/bin"
fi

eval "$($brewPath/brew shellenv)"

gnuPkgs=(coreutils grep gnu-sed)

for gnuPkg in "${gnuPkgs[@]}"; do
    gnuPkgBin="$(brew --prefix)/opt/$gnuPkg/libexec/gnubin"
    if [ -d "$gnuPkgBin" ]; then
        export PATH="$gnuPkgBin:$PATH"
    else
        echo >&2 "Cannot add GNU package to path: $gnuPkgBin"
    fi
done
