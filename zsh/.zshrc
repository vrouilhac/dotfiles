# Variables
export OBSIDIAN_NOTES=$HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/notes
export DOTFILES=$HOME/.dotfiles
export CRONS_DIR=$DOTFILES/zsh/crons
export ZSH_CONFIG=$HOME/.config/zsh
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export HOME_ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs/home"
export THEARCHIVE_PATH="${HOME_ICLOUD}/TheArchive - Notes"

source ~/.oh-my-zsh/oh-my-zsh.sh

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

# Base Config
if [[ -f $DOTFILES/zsh/base-config.sh ]]; then
	source $DOTFILES/zsh/base-config.sh
else
	echo "Could not load the base config properly"	
fi

if [[ -d $ZSH_CONFIG/plugins ]]; then
	source $DOTFILES/zsh/plugins.sh
else
	echo "Could not locate the plugins"
fi

# Zoxide
eval "$(zoxide init zsh)"

# Oh My ZSH
source $DOTFILES/zsh/oh-my-zsh.config.sh

# opam
[[ ! -r /Users/vincentrouilhac/.opam/opam-init/init.zsh ]] || source /Users/vincentrouilhac/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
