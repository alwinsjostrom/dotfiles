# Tokens are read from ~/.secrets
[ -f ~/.secrets ] && source ~/.secrets

# Sensitive work setup is defined in ~/.zshrc.work
[ -f ~/.zshrc.work ] && source ~/.zshrc.work

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# PHP
PATH="/usr/local/opt/php@8.2/bin:$PATH"

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

# Autojump CD
better_cd() {
    builtin cd "$@" 2> /dev/null && return 0

    # fallback to autojump if cd fails
    new_path="$(autojump $@)"
    if [ -n "$new_path" ]
    then builtin cd "$new_path"
    else echo cannot cd to "$@"
    fi
}
alias cd='better_cd'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh # Autojump export

# Commands
# Some commands are read from ~/.zshrc.work

# ZSH Themes
ZSH_THEME=""
# Agnoster
# ZSH_THEME="agnoster"
# prompt_context() {}

# Plugins
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# Starship
eval "$(starship init zsh)"

# Created by `pipx` on 2026-05-26 09:25:43
export PATH="$PATH:$HOME/.local/bin"
