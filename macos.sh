#!/usr/bin/env bash

############################################################
# Dock
###########################################################

# Hide the dock faster
defaults write com.apple.dock autohide-time-modifier -float 0

defaults write com.apple.dock "autohide" -bool "true"

# Show dock quicker
defaults write com.apple.dock autohide-delay -float 0.05

# Left algined dock
defaults write com.apple.dock "orientation" -string "left"

# Smaller Icons
defaults write com.apple.dock tilesize -float 24

defaults write com.apple.dock "static-only" -bool "true"

# Don't show recently used apps
defaults write com.apple.dock "show-recents" -bool "false"

# Apply changes
killall Dock


############################################################
# Keyboard
############################################################

# Key repeat and InitialKeyRepeatSpeed
defaults write -g KeyRepeat -float 2.0
defaults write NSGlobalDomain KeyRepeat -float 2.0

