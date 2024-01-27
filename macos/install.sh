# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

echo "› sudo softwareupdate -i -a"
sudo softwareupdate --install --all

# https://gist.github.com/mutin-sa/eea1c396b1e610a2da1e5550d94b0453
echo "Updating time servers"
sudo tee /etc/ntp.conf <<-EOF
server pool.ntp.org
server time.cloudflare.com
EOF
