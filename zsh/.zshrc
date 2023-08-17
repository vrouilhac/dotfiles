# Variables
export DOTFILES=$HOME/.dotfiles
export ZSH_CONFIG=$HOME/.config/zsh
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"

# Aliases
if [[ -f $DOTFILES/zsh/aliases.sh ]]; then
	source $DOTFILES/zsh/aliases.sh
else
	echo "Could not load the aliases properly"	
fi

# Commands
if [[ -f $DOTFILES/zsh/commands.sh ]]; then
	source $DOTFILES/zsh/commands.sh
else
	echo "Could not load the commands properly"	
fi

# Theme
if [[ -f $ZSH_CONFIG/themes/spaceship-prompt/spaceship.zsh-theme ]]; then
	source $ZSH_CONFIG/themes/spaceship-prompt/spaceship.zsh-theme
else
	echo "Could not load the theme properly"
fi

if [[ -d $ZSH_CONFIG/plugins ]]; then
	source $DOTFILES/zsh/plugins.sh
else
	echo "Could not locate the plugins"
fi

# Zoxide
eval "$(zoxide init zsh)"

