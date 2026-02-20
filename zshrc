export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
  git
  asdf
  tmux
  docker
)

source $ZSH/oh-my-zsh.sh

case "$(uname -s)" in
  Darwin)
    export PATH="$HOME/code/system/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    ;;
  Linux)
    export PATH="$HOME/code/system/bin:$PATH"
    ;;
  *)
    export PATH="$HOME/code/system/bin:$PATH"
    ;;
esac

export QUEUEDR_USER=john

function tn() {

  if [ -z "$1" ]; then;
    session_name=$(basename `pwd`)
  else
    session_name=$1
  fi

  tmux new-session -s $session_name -n 'main'
}
