#!/bin/bash
set -e

echo "🍺 Starting Homebrew Setup..."

# 1. Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "   - Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Temporarily add to path for this script execution
    if [[ -d "/opt/homebrew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "   - Homebrew already installed. Updating..."
    brew update
fi

# 2. Install Core Apps & Languages
echo "📦 Installing Core Apps..."
brew install python
brew install uv
brew install node
brew install --cask visual-studio-code
brew install --cask ghostty
brew install --cask obsidian
brew install --cask rancher

# 3. Install Modern CLI Tools
echo "⚡️ Installing CLI Tools..."
brew install stow          # <--- Added Stow
brew install fish
brew install starship
brew install tmux
brew install rsync
brew install eza
brew install xcp
brew install zoxide
brew install bat
brew install atuin
brew install yazi
brew install dua-cli
brew install btop
brew install font-jetbrains-mono-nerd-font

echo "🍺 Homebrew installation complete."