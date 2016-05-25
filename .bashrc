# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# Basic paths to use in common distributions

export VISUAL=vim
export EDITOR="$VISUAL"

# Add Go to PATH
export GOPATH="/home/erkka/Go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# Vagrant provider fix for Fedora
export VAGRANT_DEFAULT_PROVIDER=virtualbox
