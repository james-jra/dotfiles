source $HOME/dotfiles/bash/aliases.sh
source $HOME/dotfiles/bash/functions.sh
source $HOME/dotfiles/bash/temporary.sh
source $HOME/dotfiles/bash/ps1.sh

[ -f ${HOME}/.fzf.bash ] && source $HOME/.fzf.bash
export FZF_CTRL_T_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
