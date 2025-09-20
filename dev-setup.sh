#!/bin/bash

printf "Setting up the dev environment\n"
printf "This script will delete existing config folders and create symlinks to the ones in this repo!\n"

read -r -p "Are you sure you want to contine? [y/N] " response
if [[ ! "$response" =~ ^(yes|y)$ ]]; then exit 0; fi

function setup_symlink() {
 local target="${1}"
 local source="${2}"

 printf "\n => Setting up %s\n" "${name}"

 if [[ -e "${target}" ]] ; then
  read -r -p "=>An existing ${name} exists. Overwrite with symlink? [y/n] " response
  if [[ "${response}" =~ ^(yes|y)$ ]] ; then
   rm -rf "${target}"
   ln -sv "${source}" "${target}"
   echo "=> ${target} now points to ${source}"
  else
   echo "=> Not creating a symlink for ${target}"
  fi
 else
  ln -sv "${source}" "${target}"
   echo "=> ${target} now points to ${source}"
 fi
}

# zsh
setup_symlink "${HOME}/.zshrc" "${HOME}/.config/zsh/.zshrc"

# gitconfig
setup_symlink "${HOME}/.gitconfig" "${HOME}/.config/git/.gitconfig"
