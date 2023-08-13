awss() {
	aws_cmd=$($DOTFILES/zsh/programs/./aws-cli-selector)
	echo "Running the following command"
	echo $aws_cmd
	echo ""
	eval "${aws_cmd}"
}
