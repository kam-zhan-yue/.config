#!/usr/bin/env bash

# if ! [[ "$(uname)" == "Linux" && "$(uname -m)" == "x86_64" ]]; then
#   echo 'This machine is not Arch Linux'
#   exit 1
# fi
#
# function pacman() {
#   local package="${1}"
#   if ! pacman -Qi "${package}" &> /dev/null; then
#     sudo pacman -S --noconfirm "${package}"
#     echo "✅ ${package} installed"
#   else
#     echo "✅ ${package} is already installed"
#   fi
# }
#
# function yay() {
#   local package="${1}"
#   if ! yay -Qi "${package}" &> /dev/null; then
#     yay -S --noconfirm "${package}"
#     echo "✅ ${package} installed with yay"
#   else
#     echo "✅ ${package} is already installed"
#   fi
# }
#
# pacman hyprpaper

