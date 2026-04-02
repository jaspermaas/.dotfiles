# !/bin/bash
# Script to install applications and tools using Homebrew and mas
# Author: Hannes Jasper Maas

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew#
echo "Updating Homebrew..."
brew update

brew bundle install

brew bundle cleanup

# Install Python 3 using pyenv
echo "Installing python 3 using pyenv"
pyenv install 3
pyenv global 3

echo "Installation script completed."

