#!/usr/bin/env bash

if [ ! "$(uname)" == "Darwin" ]; then
	echo 'This machine is not MacOS.' 1>&2
	exit 1
fi


############################################################
# Dock
###########################################################

echo "==== DOCK ===="
echo "Show and hide the docker faster!"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0.05

echo "Left align the dock!"
defaults write com.apple.dock "orientation" -string "left"

echo "Make the dock icons tiny!"
defaults write com.apple.dock tilesize -float 24

echo "Hide all apps that are running but not pinned."
defaults write com.apple.dock "static-only" -bool "true"

echo "Don't show recently used apps"
defaults write com.apple.dock "show-recents" -bool "false"

echo "Disable Spotlight shortcut (use Raycast instead)"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/></dict>"

echo "Disable Finder Spotlight shortcut (use Raycast instead)"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "<dict><key>enabled</key><false/></dict>"

# Apply changes
killall Dock


############################################################
# Keyboard
############################################################

echo "==== KEYBOARD ===="
echo "Keyboard go brrrrr"
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 2
echo "Automatically hide the menu bar (for sketchybar)"
defaults write NSGlobalDomain _HIHideMenuBar -bool false

echo "Turn on fn keys"
defaults write -g com.apple.keyboard.fnState -bool true

killall SystemUIServer

echo "Reload machine to apply effects"

############################################################
# Wallpaper
############################################################
wallpaper_path="$HOME/.config/wallpapers/desktop-catppuccin-frappe-ascii-cat.png"

osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'"$wallpaper_path"'"'

if [ $? == "0" ]; then
    echo "Wallpaper set successfully to: $wallpaper_path"
else
    echo "Failed to set wallpaper."
fi
