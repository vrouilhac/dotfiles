--                         _ _ _                             _
--  __   ___ __ ___  _   _(_) | |__   __ _  ___   _ ____   _(_)_ __ ___
--  \ \ / / '__/ _ \| | | | | | '_ \ / _` |/ __| | '_ \ \ / / | '_ ` _ \
--   \ V /| | | (_) | |_| | | | | | | (_| | (__  | | | \ V /| | | | | | |
--    \_/ |_|  \___/ \__,_|_|_|_| |_|\__,_|\___| |_| |_|\_/ |_|_| |_| |_|
--

-- Base Configuration
require "user.options" -- Options for VIM
require "user.colorscheme" -- Colorscheme config

-- Keymaps
require "user.keymaps"

-- Plugins
require "user.plugins" -- List of all used plugins

require "user.gitsigns"
require "user.cmp"
require "user.lsp"
require "user.lualine"
require "user.nvim-tree"
require "user.telescope"
require "user.treesitter"
-- require "user.indent-blankline"
-- require "user.sniprun"
-- require "user.trouble"
