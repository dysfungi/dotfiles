if [[ "$(uname -s)" = Darwin ]]; then
    export GOROOT="$(brew --prefix)/opt/go/libexec"
else
    export GOROOT=/usr/local/go
fi

export GOPATH="$HOME/.local/gopath"
export GOBIN="$GOPATH/bin"

ASDF_GOLANG_ZSH_SCRIPT="$HOME/.asdf/plugins/golang/set-env.zsh"
if [[ -e "${ASDF_GOLANG_ZSH_SCRIPT}" ]]; then
    . "${ASDF_GOLANG_ZSH_SCRIPT}"
fi

export PATH="$GOBIN:$GOROOT/bin:$PATH"
