#!/usr/bin/env bash

cd "$(dirname "$0")/.."
echo

if grep -qa docker /proc/1/cgroup && [[ "$1" = 'docker' ]] ; then
    echo 'You are using docker!'
    echo 'I will assume bootstrap is being run as an entrypoint...'
    echo

    source 'script/bootstrap'

    if [[ "$SHELL" != *'zsh' ]]; then
        SHELL="$(which zsh)"
    fi
    exec "$SHELL" -li
else
    echo "Uh oh! $(uname -a) is not Docker..."
    echo
fi
