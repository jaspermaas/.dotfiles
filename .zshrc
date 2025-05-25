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

# Oh-My-Posh
# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
