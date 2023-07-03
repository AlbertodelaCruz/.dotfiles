alias cn='f(){ cd ~/dev/"$1"; };f'
alias deploycli="docker pull -q $ORGANIZATION/deploycli && docker run -it --network=host -v ~/:/root/ -v /root/.ssh --env USER=$USER $ORGANIZATION/deploycli deploycli"
alias fuck='sudo $(fc -ln -1)'
alias gb="git branch"
alias gc="git commit"
alias gca="git add --all && git commit --amend --no-edit"
alias gcl="clone_git_repo"
alias gco="git checkout"
alias gd="git -c color.status=always status --short | fzf --height 100% --ansi --preview '(git diff HEAD --color=always -- {-1} | sed 1,4d)' --preview-window right:65% | cut -c4- | sed 's/.* -> //' | tr -d '\n' | pbcopy"
alias gf="git fetch --all -p"
alias gl='git log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)"'
alias gpr="git pull --rebase"
alias gps="git push"
alias gpsf="git push --force"
alias gs="git status -sb"
alias gtp="cd ~/dev"
alias j="z"
alias ls='ls $LS_OPTIONS'
alias mambo='clear;mamba -f documentation' $1
alias remove_swap='find . | grep swp | xargs rm'
alias vimk='vim -u ~/.vimkrc' $1
alias vimfer='vim -u ~/.vimrc_bifer'
alias c="retrieve_inventory_servers"
alias n="nnn -da"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias deploy='docker run --rm --volume $(pwd):/tmp -ti aleasoluciones/deploy bash'
alias mdv='glow -p'
alias show_hosts='f(){ docker run --rm -ti aleasoluciones/deploy ansible "$1" -m shell -a hostname --list-hosts; };f'

clone_git_repo() {
  repo_url=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "https://api.github.com/user/repos?per_page=400" | jq --raw-output ".[].ssh_url" | fzf)
  git clone "$repo_url"
  echo "$repo_url"
}

retrieve_inventory_servers() {
  server_list=$(cat ~/inventory | grep -E '"id":|"dnsAlias":' | awk -F'"' '{print $4}' | grep -v ':' | sed  s/,/\\n/g |fzf)
  #xdotool key shift+F10 r 2
  ssh -t $server_list "sudo su -"
  #;sleep 1&&xdotool key shift+F10 r 1
}
