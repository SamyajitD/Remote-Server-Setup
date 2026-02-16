#!/usr/bin/env bash
# put to ~/.local/bin and have that in path
# chmod +x ~/.local/bin/tmux-sessionizer after that


# 1. Fetch sessions & capture input
# list-sessions gets active names. 
# --print-query outputs two lines: Line 1 is what you typed. Line 2 is what you highlighted (if anything).
fzf_output=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --prompt="Switch/Create Session: " --print-query)

# Exit gracefully if you hit ESC (output is empty)
[[ -z "$fzf_output" ]] && exit 0

# 2. Parse the target
# Extract the typed text (query) and the selected item (if a match was found)
query=$(echo "$fzf_output" | sed -n '1p')
selected=$(echo "$fzf_output" | sed -n '2p')

# The magic trick: If you selected something from the list, use it. 
# If 'selected' is empty (meaning no match), use the 'query' as the new session name.
target=${selected:-$query}

# Exit if completely empty (e.g., pressed Enter without typing anything on an empty list)
[[ -z "$target" ]] && exit 0

# Sanitize the name (remove dots)
target=$(echo "$target" | tr . _)

# 3. Idempotent Creation & Routing
# Check if it exists. If not, create it detached.
# Note: It defaults the starting directory to $HOME (-c "$HOME").
if ! tmux has-session -t="$target" 2> /dev/null; then
    tmux new-session -ds "$target" -c "$HOME"
fi

# Switch to the target session (since this is bound to prefix+o, we are already inside tmux)
tmux switch-client -t "$target"

# To bind 
# # Bind 'prefix + o' to open the session switcher in a floating popup
# bind-key o display-popup -E "tmux-sessionizer"