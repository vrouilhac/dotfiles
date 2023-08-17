local plugin_utils = require "user.plugins.utils"
local plugin_config = require "user.plugins.config"
local plugins = require "user.plugins.plugins"

-- Install packer automatically
plugin_utils.auto_install_packer()

-- Auto reload on save
plugin_utils.setup_auto_reload()

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Packer not installed")
	return
end

-- Packer config
packer.init(plugin_config.config())

-- List of plugins
return packer.startup(function(use)
	plugins.init(use)
end)
