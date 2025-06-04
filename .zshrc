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
