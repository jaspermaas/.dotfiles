#! /bin/bash

# Apple Global Domain
echo "Configuring Apple Global Domain..."
defaults write NSGlobalDomain AppleIconAppearanceTheme -string "RegularDark"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Apple MultitouchMouse
echo "Configuring Apple MultitouchMouse..."
defaults write com.apple.MultitouchMouse MouseButtonMode -string "TwoButton"
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string "TwoButton"

# Apple Display Settings
echo "Configuring Apple Display Settings..."
defaults write com.apple.Display-Settings.extension showListByDefault -bool true

# Apple Spotlight
echo "Configuring Apple Spotlight..."
defaults write com.apple.Spotlight PasteboardHistoryEnabled -bool true

# Apple Window Manager
echo "Configuring Apple Window Manager..."
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Apple Dock
echo "Configuring Apple Dock..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock minimize-to-application -bool true
killall Dock


# Maccy Settings
echo "Configuring Maccy Settings..."
defaults write org.p0deje.Maccy pasteByDefault -bool true
defaults write org.p0deje.Maccy showInStatusBar -bool false
defaults write org.p0deje.Maccy windowSize -string "[400,600]"
defaults write org.p0deje.Maccy menuIcon -string "clipboard"
defaults write org.p0deje.Maccy KeyboardShortcuts_delete -int 0
defaults write org.p0deje.Maccy KeyboardShortcuts_pin -int 0
defaults write org.p0deje.Maccy KeyboardShortcuts_popup -string "{\"carbonKeyCode\":9,\"carbonModifiers\":768}"

