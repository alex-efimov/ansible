#!/bin/bash

# Fix SSH auth socket location so agent forwarding works with screen.
if [[ -n "$SSH_TTY" ]] && [[ -S "$SSH_AUTH_SOCK" ]]; then
    ln -sf "$SSH_AUTH_SOCK" "${HOME}/.ssh/ssh_auth_sock"
    export SSH_AUTH_SOCK="${HOME}/.ssh/ssh_auth_sock"
fi
