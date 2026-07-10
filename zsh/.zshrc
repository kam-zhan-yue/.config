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

alias pnpm="/Users/kamzhanyue/.local/share/mise/installs/node/18.20.4/bin/pnpm"
alias python="python3"

# just completions
fpath=(~/.config/zsh/completions $fpath)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/kamzhanyue/.bun/_bun" ] && source "/Users/kamzhanyue/.bun/_bun"

# Config Stuff
eval "$(~/.local/bin/mise activate zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# . "$HOME/.grit/bin/env"

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zhanyue.kam/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zhanyue.kam/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
