# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Fix SSH auth socket location so agent forwarding works with screen.
if [[ -n "$SSH_TTY" && -S "$SSH_AUTH_SOCK" ]]; then
    ln -sf "$SSH_AUTH_SOCK" "${HOME}/.ssh/ssh_auth_sock"
    export SSH_AUTH_SOCK="${HOME}/.ssh/ssh_auth_sock"
fi

# Taken from the sshd(8) manpage.
if read proto cookie && [ -n "$DISPLAY" ]; then
        if [ `echo $DISPLAY | cut -c1-10` = 'localhost:' ]; then
                # X11UseLocalhost=yes
                echo add unix:`echo $DISPLAY |
                    cut -c11-` $proto $cookie
        else
                # X11UseLocalhost=no
                echo add $DISPLAY $proto $cookie
        fi | xauth -q -
fi

# Prevent Ctrl+S from freezing terminal in vim and other apps
stty -ixon
