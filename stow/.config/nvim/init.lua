-- Options --
require("general.opts")

-- Lazy --
require("config.lazy")

-- Plugins --
require("config.mason")
require("config.treesitter")
require("config.nvim-tree")
require("config.bufferline")
require("config.cmp")
require("config.FTerm")
require("config.telescope")
require("config.hlargs")
require("config.hover")

-- Keybinds --
require("general.keybinds")

-- Misc --
require("general.autoformat")
