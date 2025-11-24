# dotfiles

## Requirements

### Xcode Development Tools

```sh
xcode-select --install
```

### Homebrew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### stow
```sh
brew install stow
```

## Installation

### Register your ssh-key with github.com

Create a new ssh-key (if you don't have one yet):
```sh
ssh-keygen -t ed25519
```

Then use the GitHub CLI to add the ssh-key to your account:
```sh
brew install gh
gh auth login
gh ssh-key add ~/.ssh/id_ed25519.pub
brew uninstall gh
```

### Clone this repository
Then clone this repository into your `~`-Folder:
```sh
cd ~
git clone git@github.com:jaspermaas/.dotfiles.git
```

### Stow the dotfiles
```sh
cd ~/.dotfiles
stow .
```

### Stow VSCode User Settings
In the .vscode directory stow in the user settings:
```sh
cd ~/.dotfiles/.vscode
stow -t ~/Library/Application\ Support/Code/User .
```

## Install Applications using install.sh
```sh
sh ~/.dotfiles/scripts/install.sh
```