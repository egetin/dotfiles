# Fish configuration

set -x VISUAL vim
set -x EDITOR $VISUAL

set -x GOPATH "/home/erkka/Go"
set -x PATH $PATH /usr/lib/go/bin $GOPATH/bin $HOME/.cargo/bin $HOME/.bin $HOME/.local/bin $HOME/.local/share/flutter/bin $HOME/.local/share/android-studio/bin

set -x VAGRANT_DEFAULT_PROVIDER virtualbox

alias tf="terraform"
alias tfw="terraform workspace"

# wrapper for nvm command
function nvm
  bass source ~/.nvm/nvm.sh ';' nvm $argv
end

bass source ~/.nvm/nvm.sh ';' nvm >> /dev/null

function max-brightness
  xbacklight -set 100%
end

function min-brightness
  xbacklight -set 1%
end

function set-brightness
  xbacklight -set $argv
end

thefuck --alias | source
