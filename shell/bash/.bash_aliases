alias ls='ls $LS_OPTIONS'
alias mambo='clear;mamba -f documentation' $1
alias mambos='f(){ while true; do mambo "$1"; sleep 2; done; }; f'
alias vimk='vim -u ~/.vimkrc' $1
alias remove_swap='find . | grep swp | xargs rm'
alias cn=change_to_dev_directory

DEV_DIR="/home/acruz/dev"
VIRTUAL_ENV_DIR="/home/acruz/.virtualenvs"

change_to_dev_directory() {
  if [ -z "$1" ]; then
    cd $DEV_DIR
  else
    cd $DEV_DIR/$1
    if [[ "$(pwd)" == *"$DEV_DIR"*  && "$1" != "."  && "$1" != ".." ]]; then
        if [ -d "$VIRTUAL_ENV_DIR/$1"  ]; then
            workon $1
        else
            deactivate
        fi
    fi
  fi
}

_cn()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    PROJECTS=$(ls ${DEV_DIR} | grep -m1 "^${cur}")
    LEN=${COMPREPLY[@]}
    COMPREPLY=${PROJECTS}
}

complete -o nospace -F _cn cn

alias gc="git commit"
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpr="git pull --rebase"
alias gb="git branch"
