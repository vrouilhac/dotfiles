# ZSH Autosuggestions
if [[ -f $ZSH_CONFIG/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
	source $ZSH_CONFIG/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

	# Config for plugin
	bindkey '^ ' autosuggest-accept
else
	echo "ZSH Autosuggestions plugin not found"	
fi
