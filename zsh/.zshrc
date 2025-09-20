# ZSH setup
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(
		git
		git-extras
		kubectl
		kubectx
		brew
		python
		direnv
		terraform
		aws
		node
		docker
		docker-compose
		mise
	)

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

alias pnpm="/Users/kamzhanyue/.local/share/mise/installs/node/18.20.4/bin/pnpm"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# configed here ~/.config/starship.toml
eval "$(starship init zsh)"

eval "$(/Users/kamzhanyue/.local/bin/mise activate zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/kamzhanyue/.bun/_bun" ] && source "/Users/kamzhanyue/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.local/share/mise/installs/node/18.20.4/lib/node_modules/@getgrit/cli/node_modules/bin/env"
eval "$(zoxide init zsh)"

