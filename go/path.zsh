if [[ "$(uname -s)" = Darwin ]]; then
    export GOROOT="$(brew --prefix)/opt/go/libexec"
else
    export GOROOT=/usr/local/go
fi

export GOPATH="$HOME/.local/gopath"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$GOROOT/bin:$PATH"
