export MYZSHRC=~/.zshrc

source ~/.dotfiles/system/.aliases
source ~/.dotfiles/dotfiles-masteos/system/.aliases
source ~/.dotfiles/dotfiles-ocf/system/.aliases

# export PS1='%B%F{51}crys%f %F{15}[%f%F{214}%1d%f%F{15}]%f%b %# '
# get_current_branch_name() {
#   ls_result=$(ls -a)
#   if [[ $ls_result =~ ".git " ]]
#   then
#     echo $(git rev-parse --abbrev-ref HEAD)
#   fi
# }
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Set terminal vi like
# set -o vi
setopt INC_APPEND_HISTORY

# Set ls colors
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"

get_current_branch_name() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

update_PS1_git() {
  branch_name=$(get_current_branch_name)
  export PS1="%f%F{15}%f%F{214}%1d%f%F{15}%f%b $branch_name - "
}

zz() {
  z $1
  update_PS1_git
}

update_PS1_git

gcoa() {
  branch=$(git branch | grep $1 | sed 's/ *//g') 
  git checkout $branch
  update_PS1_git
}
