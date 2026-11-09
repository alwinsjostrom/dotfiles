# Tokens are read from ~/.secrets
[ -f ~/.secrets ] && source ~/.secrets

# Sensitive work setup is defined in ~/.zshrc.work
[ -f ~/.zshrc.work ] && source ~/.zshrc.work

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Alias
alias co='cd ~/.config'
alias dt='cd ~/dotfiles'
alias ls='eza --icons'
alias ll='eza -l --icons --git'
alias la='eza -la --icons --git'
alias lt='eza --tree --level=2 --icons'

# PHP
PATH="/opt/homebrew/opt/php@8.2/bin:$PATH"

# Bun completions / Bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# fnm
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --log-level quiet)"

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Commands
# Some commands are read from ~/.zshrc.work

# ZSH Themes
ZSH_THEME=""

# Plugins
plugins=(git)
zstyle ':omz:update' mode disabled
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh --cmd cd)"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:200 {}'"
source <(fzf --zsh)
bindkey '^F' fzf-cd-widget

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Created by `pipx` on 2026-05-26 09:25:43
export PATH="$PATH:$HOME/.local/bin"
