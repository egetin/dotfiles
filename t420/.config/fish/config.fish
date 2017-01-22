# Fish configuration

set -x VISUAL vim
set -x EDITOR $VISUAL

set -x GOPATH "/home/erkka/Go"
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

set -x VAGRANT_DEFAULT_PROVIDER virtualbox
