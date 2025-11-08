#!/bin/bash

printf "\nSetting up the dev environment\n"

source modules/common.sh
source modules/symlinks.sh
source modules/packages.sh

if [[ "$(uname)" == "Darwin" ]]; then
  source modules/macos.sh
elif [[ "$(uname)" == "Linux" && "$(uname -m)" == "x86_64" ]]; then
  source modules/linux.sh
fi
