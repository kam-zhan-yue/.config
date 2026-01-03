#!/bin/bash

os=""
if [[ "$(uname)" == "Darwin" ]]; then
  os="macos"
  printf "\nDetected MacOS\n"
elif [[ "$(uname)" == "Linux" && "$(uname -m)" == "x86_64" ]]; then
  os="arch"
  printf "\nDetected Arch Linux\n"
else
  os="unknown"
fi

# os specific packages
# ------------------------------------------------------------
printf "\n=> Setting up developer packages\n"

function install_package() {
 local package="${1}"
 local option="${2}"

 if [[ ${os} == "macos" ]] ; then
  if ! brew list -1 | grep -q "^${package}\$"; then
   brew install "${package}"
   echo "✅ ${package} installed"
  else
   echo "✅ ${package} is already installed"
  fi
 elif [[ ${os} == "arch" ]] ; then
  case "${option}" in
   # if we defined pacman, then use the variable
   --pacman=*)
    package="${option#*=}"
    if ! pacman -Qi "${package}" &> /dev/null; then
     sudo pacman -S --noconfirm "${package}"
     echo "✅ ${package} installed"
    else
     echo "✅ ${package} is already installed"
    fi
    ;;
   --yay=*)
    package="${option#*=}"
    if ! yay -Qi "${package}" &> /dev/null; then
     yay -S --noconfirm "${package}"
     echo "✅ ${package} installed with yay"
    else
     echo "✅ ${package} is already installed"
    fi
    ;;
   *)
    if ! pacman -Qi "${package}" &> /dev/null; then
     sudo pacman -S --noconfirm "${package}"
     echo "✅ ${package} installed"
    else
     echo "✅ ${package} is already installed"
    fi
    ;;
   esac


 fi
}

function install_tap() {
 local package="${1}"
 if ! brew tap | grep "${package}" &> /dev/null; then
  brew tap "${package}"
  echo "✅ ${package} tapped"
 else
  echo "✅ ${package} is already tapped"
 fi
}


install_package astroterm
install_package bacon
install_package bat
install_package direnv
install_package docker
install_package fzf
install_package gh --yay=github-cli
install_package ghostty
install_package git-delta
install_package git-lfs
install_package hyperfine
install_package jj --pacman=jujutsu
install_package neovim
install_package presenterm
install_package ripgrep
install_package redis
install_package starship
install_package zed
install_package zoxide
install_package zsh

# Language Server Protocols
install_package cmake
install_package clangd
install_package typescript-language-server
install_package lua-language-server

# desired shell
# which_zsh="$(which zsh)"
which_zsh="/usr/bin/zsh" # for some reason, archlinux has a symlink to /usr/sbin/zsh

# check current login shell
# if [[ $SHELL == "$which_zsh" ]]; then
#   echo "✅ zsh is already the default shell"
# else
#   echo "➡ Changing default shell to $which_zsh"
#   chsh -s "$which_zsh"
# fi

printf "\n=> Setting up personal applications\n"
install_package anki --yay=anki
install_package audacity
install_package inky --yay=inky
install_package obsidian
install_package obs --pacman=obs-studio
install_package jetbrains-toolbox --yay=jetbrains-toolbox
install_package rider --yay=rider
install_package godot

if [[ ${os} == "macos" ]] ; then
  # MacOS specific packages
  printf "\n=> Installing MacOS Packages\n"
  install_package rectangle
  install_package raycast
  install_package imageoptim
  install_package spotify
  install_package licecap
  install_package slack
  install_package postman

  # Fonts
  install_package font-hack-nerd-font
  install_package font-jetbrains-mono-nerd-font

  # Yabai
  install_package jq
  if ! brew list -1 | grep -q yabai; then
    brew install koekeishiya/formulae/yabai
      echo "✅ yabai installed"
    else
      echo "✅ yabai is already installed"
  fi
  if ! brew list -1 | grep -q skhd; then
    brew install koekeishiya/formulae/skhd
    echo "✅ skhd installed"
  else
    echo "✅ skhd is already installed"
  fi

 # Sketchybar
 if ! brew list -1 | grep -q sketchybar; then
    install_package lua
    install_package switchaudio-osx
    install_package nowplaying-cli
    install_tap felixkratz/formulae
    install_package sketchybar
    install_package sf-symbols
    install_package font-sf-mono
    install_package font-sf-pro
    curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
    (git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
    echo "✅ sketchybar installed and setup"
else
    echo "✅ sketchybar already installed, skipping setup"
fi
  install_package borders

elif [[ ${os} == "arch" ]] ; then
  printf "\n=> Installing Arch Linux Packages\n"
  install_package hyprland

  install_package nvidia-dkms
  install_package nvidia-utils
  install_package egl-wayland
  # hyprland required packages
  install_package dunst
  install_package pipewire
  install_package wireplumber
  install_package qt5-wayland
  install_package qt6-wayland
  install_package hyprpolkitagent
  install_package xdg-desktop-portal-hyprland
  install_package polkit-kde-agent

  # fonts
  install_package ttf-jetbrains-mono
  install_package ttf-jetbrains-mono-nerd
  install_package ttf-nerd-fonts-symbols
  install_package ttf-nerd-fonts-symbols-mono
  install_package noto-fonts-cjk

  # hyprland customisation
  install_package waybar
  install_package grim
  install_package slurp
  install_package hyprpaper
  install_package hyprlauncher
  install_package brightnessctl

  # login management
  install_package ly
  sudo systemctl enable ly.service

  # recording gifs
  install_package peek
fi
