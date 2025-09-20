#!/bin/bash

printf "\nSetting up the dev environment\n"
# echo "This script will delete existing config folders and create symlinks to the ones in this repo!\n"
#
# read -r -p "Are you sure you want to contine? [y/N] " response
# if [[ ! "$response" =~ ^(yes|y)$ ]]; then exit 0; fi

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

# commonly used packages
# ------------------------------------------------------------
printf "\n=> Installing commonly used packages\n"

# cargo
if ! command -v cargo &> /dev/null
then
    printf "\n=> Installing cargo"
    curl https://sh.rustup.rs -sSf | sh
    echo "✅ cargo installed"
else
    echo "✅ cargo is already installed"
fi


# uv
if ! command -v uv &> /dev/null
then
    printf "\n=> Installing uv"
    curl -LsSf https://astral.sh/uv/install.sh | sh
    echo "✅ uv installed"
else
    echo "✅ uv is already installed"
fi

# mise
if ! command -v mise &> /dev/null
then
    printf "\n=> Installing mise"
    curl https://mise.run | sh
    echo "✅ mise installed"
else
    echo "✅ mise is already installed"
fi

# grit
if ! command -v grit &> /dev/null
then
    printf "\n=> Installing grit"
    curl -fsSL https://docs.grit.io/install | bash
    echo "✅ grit installed"
else
    echo "✅ grit is already installed"
fi

# homebrew
if [[ "${os}" == "macos" ]] ; then
 if ! command -v brew &> /dev/null
 then
     printf "\n=>Installing homebrew"
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     echo "✅ homebrew installed"
 else
     echo "✅ homebrew is already installed"
 fi
fi

# oh-my-zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "✅ oh-my-zsh installed"
else
  echo "✅ oh-my-zsh is already installed"
fi

# symlinks
# ------------------------------------------------------------
printf "\n=> Setting up symlinks\n"

function setup_symlink() {
 local target="${1}"
 local source="${2}"

 if [[ -e "${target}" ]] ; then
  rm -rf "${target}"
  ln -sv "${source}" "${target}"
 else
  ln -sv "${source}" "${target}"
 fi
}

# zsh
setup_symlink "${HOME}/.zshrc" "${HOME}/.config/zsh/.zshrc"

# gitconfig
setup_symlink "${HOME}/.gitconfig" "${HOME}/.config/git/.gitconfig"

# os specific packages
# ------------------------------------------------------------
printf "\n=> Setting up os-specific packages\n"

function install_package() {
 local package="${1}"
 if [[ ${os} == "macos" ]] ; then
  if ! brew list -1 | grep -q "^${package}\$"; then
   brew install "${package}"
   echo "✅ ${package} installed"
  else
   echo "✅ ${package} is already installed"
  fi
 elif [[ ${os} == "arch" ]] ; then
  if ! pacman -Qi "${package}" &> /dev/null; then
   sudo pacman -S --noconfirm "${package}"
   echo "✅ ${package} installed"
  else
   echo "✅ ${package} is already installed"
  fi
 fi
}

install_package astroterm
install_package bacon
install_package bat
install_package docker
install_package ghostty
install_package git-delta
install_package hyperfine
install_package imageoptim # needs AUR
install_package jj
install_package neovim
install_package presenterm
install_package ripgrep
install_package redis
install_package starship
install_package zed
install_package zoxide
install_package zsh

printf "\n=> Setting up personal applications\n"
install_package anki
install_package audacity
install_package inky
install_package obsidian
install_package spotify
install_package slack
install_package obs
install_package licecap
install_package jetbrains-toolbox
install_package rider
install_package postman
install_package godot

if [[ ${os} == "macos" ]] ; then
 # MacOS specific packages
 install_package rectangle
 install_package raycast

 
 # desired shell
 which_zsh="$(which zsh)"

 # check current login shell
 current_shell="$(dscl . -read ~/ UserShell | awk '{print $2}')"   # macOS

 # if [[ "$current_shell" == "$which_zsh" ]]; then
 #   echo "✅ zsh is already the default shell"
 # else
 #   echo "➡ Changing default shell to $which_zsh"
 #   chsh -s "$which_zsh"
 # fi
elif [[ ${os} == "arch" ]] ; then
 echo "Add some arch package here"
fi
