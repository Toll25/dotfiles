-- Options --
require("general.opts")

-- Lazy --
require("config.lazy")

-- Plugins --
-- require("config.mason")
-- require("config.cmp")
require("config.neo-tree")
require("config.harpoon")

-- Keybinds and Commands --
require("general.commands")
require("general.keybinds")

-- Misc --
-- require("general.autocmd.auto-format")
require("general.autocmd.hl-yank")
require("general.autocmd.open-images")
-- require("general.hyprlang")
vim.cmd([[colorscheme catppuccin-mocha]])
