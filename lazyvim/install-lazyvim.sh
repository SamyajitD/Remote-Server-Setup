#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Ensuring Neovim is installed via mise..."
# Check if mise is available
if ! command -v mise &>/dev/null; then
  echo "Error: 'mise' is not installed or not in PATH."
  exit 1
fi

# 'mise use' is natively idempotent. It will install neovim if missing,
# or do nothing if the target version is already active globally.
mise use -g neovim@latest

# Define standard Neovim directories
NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
NVIM_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"
NVIM_STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/nvim"
NVIM_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/nvim"

# Idempotency Check: Look for signs of an existing LazyVim installation
if [ -f "$NVIM_CONFIG_DIR/init.lua" ] && grep -qi "lazy" "$NVIM_CONFIG_DIR/init.lua"; then
  echo "✅ LazyVim is already installed at $NVIM_CONFIG_DIR. Nothing to do."
else
  echo "LazyVim not found. Beginning setup..."

  # Backup existing Neovim files ONLY if the config directory exists and isn't empty
  if [ -d "$NVIM_CONFIG_DIR" ] && [ "$(ls -A "$NVIM_CONFIG_DIR")" ]; then
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    echo "Backing up existing Neovim files with suffix .bak_$TIMESTAMP..."

    mv "$NVIM_CONFIG_DIR" "${NVIM_CONFIG_DIR}.bak_${TIMESTAMP}"
    [ -d "$NVIM_DATA_DIR" ] && mv "$NVIM_DATA_DIR" "${NVIM_DATA_DIR}.bak_${TIMESTAMP}"
    [ -d "$NVIM_STATE_DIR" ] && mv "$NVIM_STATE_DIR" "${NVIM_STATE_DIR}.bak_${TIMESTAMP}"
    [ -d "$NVIM_CACHE_DIR" ] && mv "$NVIM_CACHE_DIR" "${NVIM_CACHE_DIR}.bak_${TIMESTAMP}"
  fi

  echo "Cloning LazyVim starter repository..."
  git clone https://github.com/LazyVim/starter "$NVIM_CONFIG_DIR"

  echo "Cleaning up git tracking for the starter repo..."
  rm -rf "$NVIM_CONFIG_DIR/.git"

  echo "✅ LazyVim setup complete!"
  echo "Launch 'nvim' in your terminal to bootstrap the plugins."
fi
