alias ls='ls $LS_OPTIONS'
alias mambo='clear;mamba -f documentation' $1
alias mambos='f(){ while true; do mambo "$1"; sleep 2; done; }; f'
alias vimk='vim -u ~/.vimkrc' $1
alias remove_swap='find . | grep swp | xargs rm'

alias gc="git commit"
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpr="git pull --rebase"
alias gb="git branch"
