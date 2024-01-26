#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if command -v brew >/dev/null; then
    echo "  Homebrew is already installed"
else
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if [ "$(uname)" = "Darwin" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi
fi

exit 0
