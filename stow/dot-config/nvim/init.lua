if vim.loader then
	vim.loader.enable()
end

-- Options --
require("general.opts")

-- Lazy --
require("config.lazy")
require("config.neotest")
require("config.yazi")

-- Keybinds and Commands --
require("general.commands")
require("general.keybinds")

-- Misc --
require("general.misc.auto-update")
require("general.misc.code-lens")
require("general.misc.inlay-hints")
require("general.misc.open-images")
require("general.misc.godot")
-- require("general.misc.colemak")

vim.cmd.colorscheme("catppuccin-mocha")
