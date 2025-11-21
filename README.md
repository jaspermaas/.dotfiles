# dotfiles

## Requirements

### Xcode Development Tools

```sh
xcode-select --install
```

## Installation

Register your ssh-key with github.com

Then clone this repository into your `~`-Folder:
```sh
cd ~
git clone git@github.com:jaspermaas/.dotfiles.git
```

Then install `homebrew`
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
and `stow`
```sh
brew install stow
```
In the repository execute:
```sh
stow .
```
