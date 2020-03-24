if [[ "$(uname)" = 'Darwin' ]]; then
    export GOROOT=/usr/local/opt/go/libexec
else
    export GOROOT=/usr/local/go
fi
export GOPATH="$HOME/.local/gopath"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$GOROOT/bin:$PATH"
