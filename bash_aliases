alias gs="git status"
alias ga="git add"
alias gl="git log"
alias glg="git log --graph --oneline"
alias gc="git commit"
alias gb="git branch"
alias cd..="cd .."
alias gerp="grep"

count_glob() {
  [ -e "$1" ]
  echo "($v=$((!$?*$#)))+"
}

PS1='\[\e[1;35m\]\u\]\e[1;37m\]@\h\[\e[0;37m\]:\w \[\e[0;36m\]$(($(
  v=c count_glob *
  v=h count_glob .*
)-2))\[\e[1;37m\]\n$ \[\e[0m\]'

export PS1
