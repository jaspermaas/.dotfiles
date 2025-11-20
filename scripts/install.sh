# !/bin/bash

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
CASKS=(
    "visual-studio-code"
    "ghostty"
    "discord"
    "spotify"
    "maccy"
    "rectangle"
    "jandedobbeleer/oh-my-posh/oh-my-posh"
    "alt-tab"
)

for CASK in "${CASKS[@]}"; do
    if brew list --cask | grep -q "^$CASK\$" || (brew list --cask | grep -q "oh-my-posh" && [ "$CASK" = "jandedobbeleer/oh-my-posh/oh-my-posh" ]); then
        echo "Cask $CASK is already installed."
        continue
    fi
    brew install --cask "$CASK"
done

# Install formulae
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

# Install Mac App Store apps using mas
# Numbers, Keynote, Pages, Dashlane
MAS_APPS=(
    409203825   # Numbers
    409183694   # Keynote
    409201541   # Pages
    517914548   # Dashlane
)

if command -v mas &> /dev/null
then
    for APP_ID in "${MAS_APPS[@]}"; do
        if mas list | grep -q "$APP_ID"; then
            echo "App with ID $APP_ID is already installed."
            continue
        fi
        mas install "$APP_ID"
    done
fi

echo "Installing python 3 using pyenv"
pyenv install 3
pyenv global 3

echo "Installing jenv"
JAVA_VERSIONS=(
    "8"
    "17"
    "21"
    "25"
)

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
)

for EXTENSION in "${VSCODE_EXTENSIONS[@]}"; do
    if code --list-extensions | grep -q "$EXTENSION"; then
        echo "Extension $EXTENSION is already installed."
        continue
    fi
    code --install-extension "$EXTENSION"
done

