#!/bin/sh
SOCK="$HOME/.ssh/agent.sock"

# Function: check if agent process is alive
agent_alive() {
    [ -S "$SOCK" ] || return 1          # socket exists?
    # Check SSH_AGENT_PID if set
    if [ -n "$SSH_AGENT_PID" ] && kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
        return 0
    fi

    return 0
}

if agent_alive; then
    # Agent is running, just export the socket
    export SSH_AUTH_SOCK="$SOCK"
    echo "[!] Attached to existing ssh-agent at: $SOCK"
else
    # No agent running, start a new one
    rm -f "$SOCK"
    echo "[!] Starting new ssh-agent at: $SOCK"
    eval "$(ssh-agent -a "$SOCK")" >/dev/null
fi

