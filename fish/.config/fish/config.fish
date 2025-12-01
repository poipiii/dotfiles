# --- 1. Set Homebrew Path (Apple Silicon vs Intel) ---
if test -d /opt/homebrew
    eval (/opt/homebrew/bin/brew shellenv)
else
    eval (/usr/local/bin/brew shellenv)
end

# --- 2. Interactive Session Settings ---
if status is-interactive
    # Starship Prompt
    starship init fish | source

    # Zoxide (Smart cd)
    zoxide init fish | source

    # Atuin (History)
    atuin init fish | source
    
    # uv (Python) Autocomplete
    uv generate-shell-completion fish | source

    # --- 3. Aliases ---
    # Map old commands to new tools
    alias ls="eza --icons --group-directories-first"
    alias ll="eza --icons -l --group-directories-first"
    alias cat="bat"
    alias cp="xcp"
    alias usage="dua i"
    alias top="btop"
    
    # Git shortcuts
    alias g="git"
    alias gs="git status"

    # Disable default welcome message
    set -U fish_greeting
end