#!/bin/bash

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

# npm / node
if ! command -v node &> /dev/null
then
  echo "Installing node.js" 
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  \. "$HOME/.nvm/nvm.sh"
  nvm install 24
  echo "✅ node.js installed"
else
  echo "✅ node.js is already installed"
fi

# bun
if ! command -v bun &> /dev/null
then
  echo "Installing bun" 
  curl -fsSL https://bun.com/install | bash
  echo "✅ bun installed"
else
  echo "✅ bun is already installed"
fi

