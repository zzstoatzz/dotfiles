# Source personal configuration files
source ~/.aliases
source ~/.env
source ~/.utils

# General settings
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

WORDCHARS="*?_-.[]~=/&<>' "


autoload -Uz select-word-style
select-word-style normal
zstyle ':zle:*' word-style unspecified


# Oh My Posh configuration
eval "$(oh-my-posh init zsh --config  $HOME/.config/ohmyposh/zen.toml)"

# Plugin and tool configurations
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(direnv hook zsh)"
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Environment configurations
. "$HOME/.cargo/env"
ulimit -n 4096

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Homebrew and completion setup
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc


# Google Cloud SDK configuration
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# History configuration to ensure it is saved indefinitely
HISTFILE=~/.zsh_history         # Location of the history file
HISTSIZE=100000                 # Number of commands to save in memory
SAVEHIST=100000                 # Number of commands to save to the history file

# Append history instead of overwriting it
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Remove duplicates in history
setopt HIST_IGNORE_DUPS

# Ignore commands that start with a space
setopt HIST_IGNORE_SPACE

# Share history across all open terminals
setopt SHARE_HISTORY
eval "$(uv generate-shell-completion zsh)"
. "/Users/nate/.deno/env"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

. "$HOME/.local/bin/env"
