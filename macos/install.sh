# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a

# Python
# Defaults
defaultPython=3.12-dev
asdf add python
asdf install python "$defaultPython"
asdf global python "$defaultPython"
# Extra
asdf install python 3.13-dev
