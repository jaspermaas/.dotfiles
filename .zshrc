export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


export PATH="$HOME/.jenv/bin:$PATH"
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

