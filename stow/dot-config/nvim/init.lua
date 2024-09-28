-- Options --
require("general.opts")

-- Lazy --
require("config.lazy")

-- Plugins --
require("config.neo-tree")
require("config.harpoon")

-- Keybinds and Commands --
require("general.commands")
require("general.keybinds")

-- Misc --
require("general.autocmd.autoupdate")
require("general.autocmd.inlay-hints")
require("general.autocmd.hl-yank")
require("general.autocmd.open-images")
require("general.delimiters")
vim.cmd([[colorscheme catppuccin-mocha]])
