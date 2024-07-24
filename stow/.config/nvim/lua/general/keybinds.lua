local opts = { noremap = true, silent = true }
-- File Manager --
vim.api.nvim_set_keymap("n", "<F7>", ":Neotree toggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree . reveal<CR>", opts)

-- General Purpose --
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader><leader>q", ":qa<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-f>", "/", opts)

-- Split Navigation --
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer Navigation --
vim.api.nvim_set_keymap("n", "<C-n>", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-x>", ":bd<CR>", opts)

-- Formatting --
vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", opts)

-- Tagbar --
vim.api.nvim_set_keymap("n", "<F8>", ":TagbarToggle<CR>", opts)

-- Telescope --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Colorize --
vim.api.nvim_set_keymap("n", "<leader>c", ":ColorizerToggle<CR>", opts)

-- Neorg --
vim.api.nvim_set_keymap("n", "<up>", "<Plug>(neorg.text-objects.item-up)", {})
vim.api.nvim_set_keymap("n", "<down>", "<Plug>(neorg.text-objects.item-down)", {})

-- Lazy --
vim.api.nvim_set_keymap("n", "<leader>lu", ":Lazy update<CR>", opts)

-- Git --
vim.api.nvim_set_keymap("n", "<leader>gi", ":Neogit<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gb", ":GitBlameToggle<CR>", opts)

-- Rename --
vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
