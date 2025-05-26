# dotfiles

## Requirements

### Xcode Development Tools

```sh
xcode-select --install
```

## Installation

First, clone this repository into your `~`-Folder:
```sh
cd ~
git clone https://www.github,com/jaspermaas/dotfiles
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
