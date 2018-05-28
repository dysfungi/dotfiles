# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if hash gls &>/dev/null; then
    alias ls='gls --color=auto'
elif try ls --color &>/dev/null; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi
alias l='ls -CFAL'
alias ll='ls -alFh'
alias la='ls -A'

# cd
alias ..='cd ..'
alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'

# working directory
alias cwd='echo "${PWD##*/}"'
