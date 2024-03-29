export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
  git
  asdf
  tmux
  docker
)

source $ZSH/oh-my-zsh.sh

export PATH("$HOME/code/system/bin:$PATH"
QUEUEDR_USER=john

function tn() {

  if [ -z "$1" ]; then;
    session_name=$(basename `pwd`)
  else
    session_name=$1
  fi

  tmux new-session -s $session_name -n 'main'
}

