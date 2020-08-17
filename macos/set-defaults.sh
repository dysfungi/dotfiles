# Sets reasonable macOS defaults.
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.
#
# References:
#   https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/

# System Preferences
# | General
#   | Appearance: dark mode
defaults write -globalDomain AppleInterfaceStyle Dark
#   | Accent color: 3/green
defaults write -globalDomain AppleAccentColor -int 3
#   | Highlight color: green
defaults write -globalDomain AppleHighlightColor "0.752941 0.964706 0.678431 Green"
# | Mission Control
#   | Disable automatically rearranging Spaces on recent use.
defaults write com.apple.dock mru-spaces -bool false
# | Trackpad
#   | Point & Click
#     | Lookup and data detectors: three finger tap
defaults write -globalDomain com.apple.trackpad.forceClick -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2
#   | Scroll & Zoom
#     | Scroll direction: 0/inverted
defaults write -globalDomain com.apple.swipescrolldirection -bool false

# Disable press-and-hold for keys in favor of key repeat.
defaults write -globalDomain ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Show hidden files.
defaults write com.apple.finder AppleShowAllFiles -string YES

# Set a really fast key repeat.
defaults write -globalDomain KeyRepeat -int 1

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Run the screensaver if we're in the bottom-left hot corner.
defaults write com.apple.dock wvous-tl-corner -int 5
defaults write com.apple.dock wvous-tl-modifier -int 0

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write -globalDomain WebKitDeveloperExtras -bool true
