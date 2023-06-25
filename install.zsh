#! /usr/bin/env zsh

# --- Zsh ---
echo "Init ZSH"
ZSH_PLUG_PATH=$HOME/.config/zsh/plugins
ZSH_THEMES_PATH=$HOME/.config/zsh/themes

# Plugins
echo "Creating folders path $(ZSH_PLUG_PATH)"
mkdir -p $ZSH_PLUG_PATH
git clone git@github.com:zsh-users/zsh-autosuggestions.git $ZSH_PLUG_PATH

# Themes
echo "Creating folders path $(ZSH_THEMES_PATH)"
mkdir -p $ZSH_THEMES_PATH
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git $ZSH_THEMES_PATH

# .zshrc
ln -s "$(pwd)/zsh/.zshrc" ~/.zshrc


# --- Nvim ---
echo "Init Neovim"
ln -s "$(pwd)/neovim" ~/.config/nvim


# --- Tmux ---
echo "Init Tmux"
TMUX_CONF_PATH=$HOME/.config/tmux

echo "Creating folders path $(TMUX_CONF_PATH)"
mkdir -p $TMUX_CONF_PATH

ln -s "$(pwd)/tmux/.tmux.base.conf" $TMUX_CONF_PATH
ln -s "$(pwd)/tmux/.tmux.bindings.conf" $TMUX_CONF_PATH
ln -s "$(pwd)/tmux/.tmux.theme.conf" $TMUX_CONF_PATH
ln -s "$(pwd)/tmux/.tmux.conf" $TMUX_CONF_PATH

echo "Config successfully created! 🚀"
