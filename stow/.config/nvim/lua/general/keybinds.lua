local opts = { noremap = true, silent = true }
-- File Manager --
vim.api.nvim_set_keymap("n", "<F7>", "<CMD>Neotree toggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>e", "<CMD>Neotree . reveal<CR>", opts)

-- General Purpose --
vim.api.nvim_set_keymap("n", "<C-s>", "<CMD>w<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", "<CMD>q<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader><leader>q", "<CMD>qa<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-f>", "/", opts)

-- Split Navigation --
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer Navigation --
vim.api.nvim_set_keymap("n", "<C-n>", "<CMD>BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-x>", "<CMD>bd<CR>", opts)

-- Formatting --
vim.api.nvim_set_keymap("n", "<leader>f", "<CMD>Format<CR>", opts)

-- Tagbar --
vim.api.nvim_set_keymap("n", "<F8>", "<CMD>TagbarToggle<CR>", opts)

-- Telescope --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Colorize --
vim.api.nvim_set_keymap("n", "<leader>c", "<CMD>ColorizerToggle<CR>", opts)

-- Neorg --
vim.api.nvim_set_keymap("n", "<up>", "<Plug>(neorg.text-objects.item-up)", {})
vim.api.nvim_set_keymap("n", "<down>", "<Plug>(neorg.text-objects.item-down)", {})

-- Lazy --
vim.api.nvim_set_keymap("n", "<leader>lu", "<CMD>Lazy update<CR>", opts)

-- Git --
vim.api.nvim_set_keymap("n", "<leader>gi", "<CMD>Neogit<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gb", "<CMD>GitBlameToggle<CR>", opts)

-- Rename --
vim.keymap.set("n", "<leader>rn", function()
	return "<CMD>IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Harpoon --
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- vim.keymap.set("n", "<C-h>", function()
-- 	harpoon:list():select(1)
-- end)
-- vim.keymap.set("n", "<C-t>", function()
-- 	harpoon:list():select(2)
-- end)
-- vim.keymap.set("n", "<C-n>", function()
-- 	harpoon:list():select(3)
-- end)
-- vim.keymap.set("n", "<C-s>", function()
-- 	harpoon:list():select(4)
-- end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)

-- Hypersonic --
-- vim.keymap.set({ "n", "v" }, "<leader>re", "<CMD>Hypersonic<CR>")

-- Terminal --
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
vim.keymap.set("n", "<leader>tt", "<CMD>ToggleTerm<CR>")
vim.keymap.set("t", ":q", "<CMD>ToggleTerm<CR>")
