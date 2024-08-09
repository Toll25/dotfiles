local wk = require("which-key")
wk.add({
	{ "<leader>l", group = "Lazy" },
	{ "<leader>g", group = "Git" },
	{ "<leader>f", group = "Telescope" },
	{ "<leader>s", group = "Show" },
	{ "<leader>r", group = "Rename" },
	{ "<leader>t", group = "Terminal" },
	{ "<leader>d", group = "Diagnostics" },
	{ "<leader>h", group = "Harpoon" },
	{ "<leader>n", group = "Neorg" },
	{ "<leader>nw", group = "Workspaces" },
	{ "<leader>y", group = "Treesitter (sYntax ;)" },
})
local opts = { noremap = true, silent = true }

-- File Manager --
vim.api.nvim_set_keymap("n", "<F7>", "<CMD>Neotree toggle<CR>", { desc = "Toggle filetree" })
vim.api.nvim_set_keymap("n", "<leader>e", "<CMD>Neotree . reveal<CR>", { desc = "Reveal file in filetree" })

-- General Purpose --
vim.api.nvim_set_keymap("n", "<C-s>", "<CMD>w<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit" })
-- vim.api.nvim_set_keymap("n", "<leader><leader>q", "<CMD>qa<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-f>", "/", opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Hover information" })

-- Split Navigation --
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer Navigation --
vim.api.nvim_set_keymap("n", "<C-n>", "<CMD>BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-x>", "<CMD>bd<CR>", opts)

-- Formatting --
vim.api.nvim_set_keymap("n", "<leader>F", "<CMD>Format<CR>", { desc = "Format code" })

-- Tagbar --
vim.api.nvim_set_keymap("n", "<F8>", "<CMD>TagbarToggle<CR>", opts)

-- Telescope --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
vim.keymap.set("n", "<leader>fv", "<CMD>VenvSelect<CR>", { desc = "Select venv" })
vim.keymap.set("n", "<leader>fs", "<CMD>Telescope symbols<CR>", { desc = "Find symbols" })
vim.keymap.set("n", "<leader>fl", "<CMD>Telescope ToggleLSP<CR>", { desc = "Toggle LSPs" })
vim.keymap.set("n", "<leader>fr", "<CMD>Telescope repo list<CR>", { desc = "Find repos" })
vim.keymap.set("n", "<leader>fl", "<CMD>Telescope lazy_plugins<CR>", { desc = "Find Lazy plugins" })
vim.keymap.set("n", "<leader>fp", "<CMD>Telescope pickers<CR>", { desc = "Find Telescope pickers" })
vim.keymap.set("n", "<leader>ft", "<CMD>Telescope headings<CR>", { desc = "Find headings" })

-- Lazy --
vim.api.nvim_set_keymap("n", "<leader>ll", "<CMD>Lazy<CR>", { desc = "Open home" })
vim.api.nvim_set_keymap("n", "<leader>lx", "<CMD>Lazy clean<CR>", { desc = "Clean" })
vim.api.nvim_set_keymap("n", "<leader>lu", "<CMD>Lazy update<CR>", { desc = "Update" })
vim.api.nvim_set_keymap("n", "<leader>lp", "<CMD>Lazy profile<CR>", { desc = "Profile" })

-- Git --
vim.api.nvim_set_keymap("n", "<leader>gg", "<CMD>Neogit<CR>", { desc = "Open Git UI" })
vim.api.nvim_set_keymap("n", "<leader>gb", "<CMD>GitBlameToggle<CR>", { desc = "Toggle inline Git blame" })

-- Rename --
vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Rename with IncRename" })
vim.keymap.set("n", "<leader>rs", ":%s///g<Left><Left><Left>", { desc = "Rename with substitute" })

-- Harpoon --
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Add file" })
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>hl", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Show list" })
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
vim.keymap.set("n", "<leader>tt", "<CMD>ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("t", ":q", "<CMD>ToggleTerm<CR>")

-- Show --
vim.keymap.set("n", "<leader>sl", require("nabla").popup, { desc = "Show latex interpretation" })
-- vim.keymap.set("n", "<leader>sb", function()
-- 	local nvim_biscuits = require("nvim-biscuits")
-- 	nvim_biscuits.BufferAttach()
-- 	nvim_biscuits.toggle_biscuits()
-- end, { desc = "Show biscuits" })
vim.keymap.set("n", "<leader>sc", "<CMD>ColorizerToggle<CR>", { desc = "Show colors" })
vim.keymap.set("n", "<leader>sw", "<CMD>set wrap!<CR>", { desc = "Toggle wraps" })
vim.keymap.set("n", "<leader>sa", require("actions-preview").code_actions, { desc = "Show code actions" })
vim.keymap.set("n", "<leader>sf", "<CMD>ConformInfo<CR>", { desc = "Show format info" })

-- Diagnostics --
vim.api.nvim_set_keymap("n", "<leader>dd", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Open Diagnostics" })
-- vim.api.nvim_set_keymap('n', '<leader>xX', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Buffer Diagnostics (Trouble)' })
vim.api.nvim_set_keymap("n", "<leader>dl", "<CMD>Trouble loclist toggle<CR>", { desc = "Location List" })
vim.api.nvim_set_keymap("n", "<leader>dq", "<CMD>Trouble qflist toggle<CR>", { desc = "Quickfix List" })

-- Treesitter --
vim.keymap.set("n", "<leader>yt", "<CMD>TSToggle<CR>", { desc = "Toggle" })
vim.keymap.set("n", "<leader>yu", "<CMD>TSUpdate<CR>", { desc = "Update" })
vim.keymap.set("n", "<leader>yi", ":TSInstall ", { desc = "Install" })
vim.keymap.set("n", "<leader>yd", ":TSUninstall ", { desc = "Uninstall" })

-- Neorg --
vim.api.nvim_set_keymap("n", "<leader>nc", "<CMD>Neorg toggle-concealer<CR>", { desc = "Toggle concealer" })
vim.api.nvim_set_keymap("n", "<leader>nt", "<CMD>Neorg toc<CR>", { desc = "Show table of contents" })
vim.api.nvim_set_keymap("n", "<leader>ni", "<CMD>Neorg index<CR>", { desc = "Go to index" })
vim.api.nvim_set_keymap("n", "<leader>nwd", "<CMD>Neorg workspace default<CR>", { desc = "Open default" })
vim.api.nvim_set_keymap("n", "<leader>nwm", "<CMD>Neorg workspace mitschrift<CR>", { desc = "Open mitschrift" })
vim.api.nvim_set_keymap("n", "<leader>nwn", "<CMD>Neorg workspace notes<CR>", { desc = "Open notes" })
vim.api.nvim_set_keymap("n", "<up>", "<Plug>(neorg.text-objects.item-up)", {})
vim.api.nvim_set_keymap("n", "<down>", "<Plug>(neorg.text-objects.item-down)", {})
vim.api.nvim_set_keymap("n", "<C-t>", "<Plug>(neorg.qol.todo-items.todo.task-cycle)", {})
