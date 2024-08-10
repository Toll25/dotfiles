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
require("general.autocmd.inlay-hints")
require("general.autocmd.hl-yank")
require("general.autocmd.open-images")
vim.cmd([[colorscheme catppuccin-mocha]])
