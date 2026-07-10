if [[ "$(uname)" == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="/opt/homebrew/bin:$PATH"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Language Input with fcitx5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export GPG_TTY=$(tty)

# dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_ROOT_ARM64="$HOME/.dotnet"
export PATH="$PATH:$DOTNET_ROOT_ARM64:$DOTNET_ROOT_ARM64/tools"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zhanyue.kam/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zhanyue.kam/Downloads/google-cloud-sdk/path.zsh.inc'; fi
