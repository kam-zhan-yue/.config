#!/bin/bash

# ------------------------------------------------------------
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

# ideavimrc
setup_symlink "${HOME}/.ideavimrc" "${HOME}/.config/jetbrains/.ideavimrc"

# TODO: Figure out how to symlink different gitconfigs depending on the machine you are on
# In the meantime, uncomment this and run the command
# setup_symlink "${HOME}/.gitconfig" "${HOME}/.config/git/.gitconfig.uptick"
