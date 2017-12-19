source $HOME/dotfiles/bash/aliases.sh
source $HOME/dotfiles/bash/functions.sh
source $HOME/dotfiles/bash/temporary.sh

if [ -n "$VIRTUAL_ENV" ]; then
  source $VIRTUAL_ENV/bin/activate
fi

if [ -n "$DOTFILES" ]; then
  source $DOTFILES;
fi

PS1='\[\e[1;35m\]\u\]\e[1;37m\]@\h\[\e[0;37m\]:\w \[\e[0;36m\]$(($(
  v=c count_glob *
  v=h count_glob .*
)-2))\[\e[1;37m\]\n$ \[\e[0m\]'

export PS1
