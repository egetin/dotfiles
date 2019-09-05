# Fish configuration

set -x VISUAL vim
set -x EDITOR $VISUAL

set -x GOPATH "/home/emak/Go"
set -x PATH $PATH /usr/lib/go/bin $GOPATH/bin /home/emak/.cargo/bin /home/emak/.bin /home/emak/Random/kubernetes/kubernetes/client/bin

set -x VAGRANT_DEFAULT_PROVIDER virtualbox

alias tf="terraform"
alias tfw="terraform workspace"

# wrapper for nvm command
function nvm
  bass source ~/.nvm/nvm.sh ';' nvm $argv
end

bass source ~/.nvm/nvm.sh ';' nvm >> /dev/null
#function fuck -d "Correct your previous console command"
#  set -l fucked_up_command $history[1]
#  env TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command | read -l unfucked_command
#  if [ "$unfucked_command" != "" ]
#    eval $unfucked_command
#    builtin history delete --exact --case-sensitive -- $fucked_up_command
#    builtin history merge ^ /dev/null
#  end
#end
#
#thefuck --alias | source

function max-brightness
  xbacklight -set 100%
end

function min-brightness
  xbacklight -set 1%
end

function set-brightness
  xbacklight -set $argv
end
