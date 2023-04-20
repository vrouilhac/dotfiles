#! /usr/bin/env zsh

# ZSHRC
ln -s "$(pwd)/system/.zshrc" ~/.zshrc

# Nvim
ln -s "$(pwd)/neovim" ~/.config/nvim

# Tmux
ln -s "$(pwd)/tmux/.tmux.conf" ~/.tmux.conf
mkdir -p ~/.config/tmuxinator
ln -s "$(pwd)/tmux/tmuxinator/*" ~/.config/tmuxinator
ln -s "$(pwd)/dotfiles-ocf/tmux/tmuxinator/*" ~/.config/tmuxinator

# obsolete
# ln -s "$(pwd)/dotfiles-masteos/tmux/tmuxinator/*" ~/.config/tmuxinator
