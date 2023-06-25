gcoa() {
	selected=$(git branch | fzf)
	git checkout $(echo $selected | sed 's/ *//g')
}
