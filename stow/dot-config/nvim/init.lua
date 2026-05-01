if vim.loader then
	vim.loader.enable()
end

-- Options --
require("general.opts")

-- Lazy --
require("config.lazy")
require("config.yazi")

-- Keybinds and Commands --
require("general.commands")
require("general.keybinds")


vim.cmd.colorscheme("catppuccin-mocha")
