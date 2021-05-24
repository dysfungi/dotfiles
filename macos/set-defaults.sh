#!/usr/bin/env bash
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
set -e

err() {
    echo "ERROR: $@" >&2
    return $?
}

log() {
    if ! test "$1" -eq "$1"; then
        err "Expected an integer as first argument, got $1"
        exit 2
    fi

    local depth="${1:-0}"
    shift 1
    local prefix=''


    local first=1 increment=1
    for i in $(seq ${first} ${increment} ${depth} 2>/dev/null); do
        if [[ "${i}" -eq "${depth}" ]]; then
            prefix+='|- '
        else
            prefix+='   '
        fi
    done

    echo "$prefix$@"
    return $?
}

log 0 'Editing application/system defaults...'

log 1 'System Preferences'

log 2 'General'
log 3 'Appearance: dark mode'
defaults write -globalDomain AppleInterfaceStyle Dark
log 3 'Accent color: 3/green'
defaults write -globalDomain AppleAccentColor -int 3
log 3 'Highlight color: green'
defaults write -globalDomain AppleHighlightColor "0.752941 0.964706 0.678431 Green"

log 2 'Desktop & Screensaver'
log 3 'Hot corners'
log 4 'Screensaver: bottom-left'
defaults write com.apple.dock wvous-tl-corner -int 5
defaults write com.apple.dock wvous-tl-modifier -int 0

log 2 'Mission Control'
log 3 'Disable most recently used Spaces'
defaults write com.apple.dock mru-spaces -bool false

log 2 'Keyboard'
log 3 'Keys'
log 4 'Delay until key repeat: really short'
defaults write -globalDomain InitialKeyRepeat -int 12
log 4 'Key repeat: really fast'
defaults write -globalDomain KeyRepeat -int 1
log 2 'Disable press-and-hold for keys in favor of key repeat'
defaults write -globalDomain ApplePressAndHoldEnabled -bool false
log 3 'Control Strip'
log 4 'Mini'
defaults write com.apple.controlstrip MiniCustomized '(
    com.apple.system.media-play-pause,
    com.apple.system.volume,
    com.apple.system.mute,
    com.apple.system.screen-saver)'
log 4 'Full'
defaults write com.apple.controlstrip FullCustomized '(
    com.apple.system.screencapture,
    com.apple.system.show-desktop,
    com.apple.system.group.brightness,
    com.apple.system.group.keyboard-brightness,
    com.apple.system.workflows,
    com.apple.system.group.media,
    com.apple.system.group.volume,
    com.apple.system.screen-saver)'
log 0 'Restarting ControlStrip...'
killall ControlStrip

log 2 'Trackpad'
log 3 'Point & Click'
log 4 'Lookup and data detectors: three finger tap'
defaults write -globalDomain com.apple.trackpad.forceClick -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2
log 3 'Scroll & Zoom'
log 4 'Scroll direction: 0/inverted'
defaults write -globalDomain com.apple.swipescrolldirection -bool false

log 0 'Restarting Dock...'
killall Dock

log 1 'Finder'
log 2 'Show the ~/Library folder'
chflags nohidden ~/Library
log 2 'Show hidden dot files'
defaults write com.apple.finder AppleShowAllFiles -string YES
log 2 "Always open everything in Finder's list view. This is important."
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
log 2 'Set the Finder prefs for showing a few different volumes on the Desktop'
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

log 0 "Restarting Finder..."
killall Finder

log 1 'NetworkBrowser'
log 2 'Use AirDrop over every interface. srsly this should be a default'
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

log 1 'Safari'
log 2 'Hide bookmark bar'
defaults write com.apple.Safari ShowFavoritesBar -bool false
log 2 'Configuring for development'
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write -globalDomain WebKitDeveloperExtras -bool true

log 0 'Clearing caches...'
killall cfprefsd
