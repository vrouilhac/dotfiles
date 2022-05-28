export MYZSHRC=~/.zshrc
export MYDOTFILES=~/.dotfiles

# init zoxide
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"

source $MYDOTFILES/system/.exports
source $MYDOTFILES/system/.aliases
source $MYDOTFILES/dotfiles-masteos/system/.aliases
source $MYDOTFILES/dotfiles-ocf/system/.aliases

source $MYDOTFILES/system/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# enable autocompletion
autoload -U compinit
compinit

# Work in progress
setopt INC_APPEND_HISTORY

get_current_branch_name() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1] /p'
}

update_PS1_git() {
  branch_name="$(get_current_branch_name)"
  export PS1="%f%F{15}%f%F{214}%1d%f%F{15}%f%b $branch_name- "
}

z() {
  __zoxide_z "$@"
  update_PS1_git
}

update_PS1_git

gcoa() {
  branch=$(git branch | grep $1 | sed 's/ *//g') 
  git checkout $branch
  update_PS1_git
}

set -o vi
