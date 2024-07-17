local opts = { noremap = true, silent = true }
-- File Manager --
vim.api.nvim_set_keymap("n", "<F7>", ":NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts)

-- General Purpose --
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader><leader>q", ":qa<CR>", opts)

-- Split Navigation --
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer Navigation --
vim.api.nvim_set_keymap("n", "<C-n>", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-x>", ":bd<CR>", opts)

-- Formatting --
vim.api.nvim_set_keymap("n", "<leader>f", ":Neoformat<CR>", opts)

-- Termimal --
-- vim.api.nvim_set_keymap("n", "<leader>to", ":FTermOpen<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>tc", ":FTermClose<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>te", ":FTermExit<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>t", ":FTermToggle<CR>", opts)

-- Tagbar --
vim.api.nvim_set_keymap("n", "<F8>", ":TagbarToggle<CR>", opts)

-- Hover Tooltips --
vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
vim.keymap.set("n", "<C-P>", function()
	require("hover").hover_switch("previous")
end, { desc = "hover.nvim (previous source)" })
vim.keymap.set("n", "<C-N>", function()
	require("hover").hover_switch("next")
end, { desc = "hover.nvim (next source)" })

-- Mouse support
vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
vim.o.mousemoveevent = true

-- Telescope --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
