#!/usr/bin/env bash

# Loop to allow continuous management (kill/rename) without exiting the script
while true; do
    # 1. Fetch sessions & wait for user action
    # --expect tells fzf to output the key pressed (Enter, ctrl-q, or ctrl-r)
    fzf_output=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf \
        --prompt="Switch/Create Session: " \
        --header="Enter: Switch/Create | C-q: Kill | C-r: Rename" \
        --print-query \
        --expect=ctrl-q,ctrl-r)

    # If the user hits ESC or Ctrl-c, fzf returns a non-zero exit code. Exit gracefully.
    if [[ $? -ne 0 ]]; then
        exit 0
    fi

    # 2. Parse the output
    # Line 1: The key pressed (empty if Enter)
    # Line 2: The typed query
    # Line 3: The highlighted selection
    key=$(echo "$fzf_output" | sed -n '1p')
    query=$(echo "$fzf_output" | sed -n '2p')
    selected=$(echo "$fzf_output" | sed -n '3p')

    # Target is the highlighted item, or the typed text if nothing is highlighted
    target=${selected:-$query}

    # If completely empty, just loop back
    [[ -z "$target" ]] && continue

    # 3. Handle specific key actions
    if [[ "$key" == "ctrl-q" ]]; then
        # Clear the popup screen for a clean prompt
        clear 
        read -p "Kill session '$target'? (y/n): " -n 1 -r < /dev/tty
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            tmux kill-session -t "$target" 2>/dev/null
        fi
        # Loop back to fzf
        continue 

    elif [[ "$key" == "ctrl-r" ]]; then
        # Clear the popup screen for a clean prompt
        clear
        read -p "Rename session '$target' to: " new_name < /dev/tty
        if [[ -n "$new_name" ]]; then
            # Sanitize the new name (replace dots with underscores)
            new_name=$(echo "$new_name" | tr . _)
            tmux rename-session -t "$target" "$new_name" 2>/dev/null
        fi
        # Loop back to fzf
        continue 
    
    else
        # Enter was pressed (key is empty). Break the loop to attach/switch.
        break
    fi
done

# 4. Proceed to attach/create (only reached if Enter was pressed)
# Sanitize the target name
target=$(echo "$target" | tr . _)

# Idempotent Creation in Current Directory
if ! tmux has-session -t="$target" 2> /dev/null; then
    tmux new-session -ds "$target" -c "$PWD"
fi

# Context-Aware Routing
if [[ -z "$TMUX" ]]; then
    # Outside tmux
    tmux attach-session -t "$target"
else
    # Inside tmux
    tmux switch-client -t "$target"
fi