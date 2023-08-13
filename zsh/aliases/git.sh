# Add
alias ga="git add"
alias gaa="git add ."

# Manage branch
alias gco="git checkout"
alias gcob="git checkout -b "
alias gbd="git branch -d "

# Commit
alias gcm="git commit -v -m "
alias gca="git commit -v --amend"

# Infos
alias gb="git branch | tee"
alias gs="git status"
alias gd="git diff"
alias gdc='git diff --compact-summary'
alias gdstat='git diff --numstat'
alias gl="git log"

# Draft
alias gst="git stash"
alias gstp="git stash pop"
alias gstl="git stash list"
alias gstmc="git stash create "
alias gstmp="git stash push"

# Reset
alias grsh="git reset --hard"

# Sync
alias gpl="git pull"
alias gp="git push"
alias gpf="git push --force"
alias gpu="git push --set-upstream origin"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"
