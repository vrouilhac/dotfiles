export MYZSHRC=~/.zshrc
export MYDOTFILES=~/.dotfiles

# init zoxide
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"

source $MYDOTFILES/system/.exports
source $MYDOTFILES/system/.aliases
source $MYDOTFILES/dotfiles-masteos/system/.aliases
source $MYDOTFILES/dotfiles-ocf/system/.aliases

source $MYDOTFILES/system/zsh/.autocomplete.zsh
source $MYDOTFILES/system/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $MYOMZSH/oh-my-zsh.sh

# enable autocompletion
autoload -Uz compinit
compinit

# Work in progress
setopt INC_APPEND_HISTORY
set -o vi

fd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}


# DRAFT DO NOT KEEP THAT S
alias ftg='grep "#" data/* | sed "s/^[^#]*\(#.*\)/\1/" | tr " " "\n" | sort | uniq | fzf'
