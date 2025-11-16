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
setup_symlink "${HOME}/.gitconfig.local" "${HOME}/.config/git/.gitconfig.local"

