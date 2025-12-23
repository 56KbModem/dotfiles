#!/bin/sh

SOCK="$HOME/.ssh/agent.sock"

export SSH_AUTH_SOCK="$SOCK"

# Check if agent is alive
if ! ssh-add -l >/dev/null 2>&1; then
    # Kill any stale socket
    echo "[!] Deleting socket: $SOCK"
    rm -f "$SOCK"

    # Start new agent on fixed socket
    echo "[!] Starting new socket: $SOCK"
    eval "$(ssh-agent -a "$SOCK")" >/dev/null

    # Add keys (optional but common)
    ssh-add
fi

