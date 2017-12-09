# Fish configuration

set -x VISUAL vim
set -x EDITOR $VISUAL

set -x GOPATH "/home/emak/Go"
set -x PATH $PATH /usr/lib/go/bin $GOPATH/bin

set -x VAGRANT_DEFAULT_PROVIDER virtualbox

# wrapper for nvm command
function nvm
  bass source /usr/share/nvm/nvm.sh ';' nvm $argv
end

bass source /usr/share/nvm/nvm.sh ';' nvm >> /dev/null
