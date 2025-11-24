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
echo "Upgrading installed packages..."
brew upgrade
echo "Cleaning up old versions..."
brew cleanup

# Install casks
echo "Installing casks using Homebrew"
CASKS=(
    "visual-studio-code"
    "ghostty"
    "discord"
    "spotify"
    "maccy"
    "rectangle"
    "jandedobbeleer/oh-my-posh/oh-my-posh"
    "alt-tab"
    "docker-desktop"
)

for CASK in "${CASKS[@]}"; do
    if brew list --cask | grep -q "^$CASK\$" || (brew list --cask | grep -q "oh-my-posh" && [ "$CASK" = "jandedobbeleer/oh-my-posh/oh-my-posh" ]); then
        echo "Cask $CASK is already installed."
        continue
    fi
    brew install --cask "$CASK"
done

# Install formulae
echo "Installing formulae using Homebrew"
FORMULAE=(
    "jenv"
    "pyenv"
    "mas"
    "xz"
)

for FORMULA in "${FORMULAE[@]}"; do
    if brew list --formula | grep -q "^$FORMULA\$"; then
        echo "Formula $FORMULA is already installed."
        continue
    fi
    brew install "$FORMULA"
done

brew cleanup

# Install Python 3 using pyenv
echo "Installing python 3 using pyenv"
pyenv install 3
pyenv global 3

echo "Installing jenv"
JAVA_VERSIONS=(
    "17"
    "21"
    "25"
)

# Install Java versions and add them to jenv
echo "Installing Java versions and add them to jenv"
for JAVA_VERSION in "${JAVA_VERSIONS[@]}"; do
    if jenv versions | grep -q "$JAVA_VERSION"; then
        echo "Java $JAVA_VERSION is already installed."
        continue
    fi
    brew install "openjdk@$JAVA_VERSION"
    if [ $? -ne 0 ]; then
        echo "Failed to install $JAVA_VERSION"
        continue
    fi
    jenv add "$(brew --prefix)/opt/openjdk@$JAVA_VERSION/libexec/openjdk.jdk/Contents/Home"
done

# Install VS Code extensions
echo "Installing VS Code extensions"
VSCODE_EXTENSIONS=(
    "ms-python.python"
    "docker.docker"
    "redhat.java"
    "github.copilot"
    "github.copilot-chat"
    "ms-toolsai.jupyter"
    "eamodio.gitlens"
    "james-yu.latex-workshop"
    "esbenp.prettier-vscode"
    "ms-python.autopep8"
)

for EXTENSION in "${VSCODE_EXTENSIONS[@]}"; do
    if code --list-extensions | grep -q "$EXTENSION"; then
        echo "Extension $EXTENSION is already installed."
        continue
    fi
    code --install-extension "$EXTENSION"
done
echo "Installation script completed."

