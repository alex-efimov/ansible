# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Prevent Ctrl+S from freezing terminal in vim and other apps
stty -ixon
