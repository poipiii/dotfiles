#!/bin/bash
set -e

echo "🐟 Starting Fish Shell Setup..."

# 1. Determine Brew Prefix
if [[ -d "/opt/homebrew" ]]; then
    BREW_PREFIX="/opt/homebrew"
else
    BREW_PREFIX="/usr/local"
fi
FISH_BIN="$BREW_PREFIX/bin/fish"

# 2. Install Oh My Fish (Non-interactive)
if [ ! -d "$HOME/.local/share/omf" ]; then
    echo "   - Installing Oh My Fish..."
    curl -L https://get.oh-my.fish | "$FISH_BIN" -- --noninteractive
else
    echo "   - Oh My Fish is already installed."
fi

# 3. Set as Default Shell
echo "   - Setting Fish as default shell..."
if ! grep -q "$FISH_BIN" /etc/shells; then
    echo "     (Adding fish to /etc/shells - Password required)"
    echo "$FISH_BIN" | sudo tee -a /etc/shells
fi

if [ "$SHELL" != "$FISH_BIN" ]; then
    chsh -s "$FISH_BIN"
fi

echo "🐟 Fish dependencies installed."