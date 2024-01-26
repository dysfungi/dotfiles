#!/usr/bin/env bash

echo "Bootstrapping Python"

defaultPython=3.12-dev

asdf plugin add python

# Defaults
asdf install python "$defaultPython"
asdf global python "$defaultPython"

# Extra
asdf install python 3.13-dev
