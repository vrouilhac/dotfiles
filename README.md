# Dotfiles

## Installation

### BASH

 - `cd`
 - `ln -s .dotfiles/.bash_aliases .bash_aliases`

### VIM

  - `cp -R vim/.snippets ~/.vim/.snippets`
  - `ln -s .dotfiles/.vimrc ~/.vimrc`
  - `mkdir -p ~/.vim/autoload ~/.vim/bundle` (see https://github.com/tpope/vim-pathogen)
  - `cd ~/.vim/bundle`
  - `git clone https://github.com/vrouilhac/vim-zettelkasten` (not yet publicly avaible)
