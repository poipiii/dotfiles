#!/bin/bash
set -e

echo "🚀 Starting Full Setup..."

# Ensure we are in the directory of the script
cd "$(dirname "$0")"

# Make helper scripts executable
chmod +x install_brew.sh
chmod +x install_fish.sh

# 1. Install Brew Packages (includes stow)
./install_brew.sh

# 2. Setup Fish (OMF, etc)
./install_fish.sh

# 3. Use Stow to link dotfiles
echo "🔗 Stowing dotfiles..."

# Ensure the target directory exists
mkdir -p "$HOME/.config/fish"

# Removes conflicting config.fish if it exists as a real file (not a link)
if [ -f "$HOME/.config/fish/config.fish" ] && [ ! -L "$HOME/.config/fish/config.fish" ]; then
    echo "   - Backing up existing config.fish..."
    mv "$HOME/.config/fish/config.fish" "$HOME/.config/fish/config.fish.pre-stow"
fi

# Run Stow
# --restow: Useful if you run setup multiple times (updates links)
# --target: Where to link files to (Home Directory)
# fish: The folder name in your dotfiles repo to stow
stow --restow --target="$HOME" fish

echo " "
echo "✅  All Done!"
