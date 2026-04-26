# >>> ghost-complete initialize >>>
# !! Contents within this block are managed by 'ghost-complete install' !!
if [[ -f '/Users/jasper/.config/ghost-complete/shell/init.zsh' ]]; then
  builtin source '/Users/jasper/.config/ghost-complete/shell/init.zsh'
else
  echo "ghost-complete: init script missing: "'/Users/jasper/.config/ghost-complete/shell/init.zsh' >&2
  echo "ghost-complete: run 'ghost-complete install' to restore it" >&2
fi
# <<< ghost-complete initialize <<<
# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/jaspermaas/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Jenv Loading
eval "$(jenv init -)"

# Pyenv Loading
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Ghostty Zsh Integration
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
	builtin source ${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration
fi

# Default Editor
export EDITOR=nano

# Oh-My-Posh
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/theme.toml)"

# Enable history search with arrow keys
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/jasper/.lmstudio/bin"
# End of LM Studio CLI section
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"

export HOMEBREW_NO_ENV_HINTS=1

export HOMEBREW_BUNDLE_FILE_GLOBAL="~/.dotfiles/Brewfile"

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# >>> ghost-complete shell integration >>>
# !! Contents within this block are managed by 'ghost-complete install' !!
source '/Users/jasper/.config/ghost-complete/shell/ghost-complete.zsh'
# <<< ghost-complete shell integration <<<
