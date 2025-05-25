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
eval "$(oh-my-posh init zsh)"
