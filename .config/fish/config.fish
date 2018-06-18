# Fish configuration

set -x VISUAL vim
set -x EDITOR $VISUAL

set -x HOMEPATH "/home/erkka"
set -x GOPATH $HOMEPATH/Go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin $HOMEPATH/.cargo/bin

set -x VAGRANT_DEFAULT_PROVIDER virtualbox

# wrapper for nvm command
function nvm
  bass source ~/.nvm/nvm.sh ';' nvm $argv
end

bass source ~/.nvm/nvm.sh ';' nvm >> /dev/null
