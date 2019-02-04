if hash ruby &>/dev/null && hash gem &>/dev/null; then
    PATH="$PATH:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
fi
