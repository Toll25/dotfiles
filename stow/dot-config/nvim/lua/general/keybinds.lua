local wk = require("which-key")
wk.add({
	{ "<leader>g", group = "Git" },
	{ "<leader>f", group = "Telescope" },
	{ "<leader>s", group = "Show" },
	{ "<leader>r", group = "Rename" },
	{ "<leader>t", group = "Terminal" },
	{ "<leader>d", group = "Diagnostics" },
	{ "<leader>c", group = "Colors" },
	{ "<leader>w", group = "Workspaces" },
})
local opts = { noremap = true, silent = true }

-- File Manager --
vim.api.nvim_set_keymap("n", "<F7>", "<CMD>Neotree toggle<CR>", { desc = "Toggle filetree" })
vim.api.nvim_set_keymap("n", "<leader>e", "<CMD>Neotree . reveal<CR>", { desc = "Reveal file in filetree" })

-- General Purpose --
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<CMD>w<CR><ESC>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit" })
-- vim.api.nvim_set_keymap("n", "<leader><leader>q", "<CMD>qa<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-f>", "/", opts)
vim.keymap.set("n", "<leader>q", "<CMD>OverseerRun<CR>", { desc = "Run tasks" })

-- Split Navigation --
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer Navigation --
vim.api.nvim_set_keymap("n", "<C-n>", "<CMD>BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-S-n>", "<CMD>BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<C-x>", function()
	Snacks.bufdelete()
end, opts)

-- Formatting --
vim.api.nvim_set_keymap("n", "<leader>F", "<CMD>Format<CR>", { desc = "Format file" })

-- Tagbar --
-- vim.api.nvim_set_keymap("n", "<F8>", "<CMD>TagbarToggle<CR>", opts)

-- fzf --
vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<CMD>FzfLua live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<CMD>FzfLua buffers<CR>", { desc = "Find buffer" })
vim.keymap.set("n", "<leader>fi", "<CMD>FzfLua lsp_incoming_calls<CR>", { desc = "Find incoming calls" })
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.definition, { desc = "Goto definition" })

-- Lazy --
vim.api.nvim_set_keymap("n", "<leader>l", "<CMD>Lazy<CR>", { desc = "Open Lazy UI" })

-- Git --
vim.api.nvim_set_keymap("n", "<leader>gg", "<CMD>Neogit<CR>", { desc = "Open Git UI" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>gb",
	"<CMD>Gitsigns toggle_current_line_blame<CR>",
	{ desc = "Toggle inline Git blame" }
)

-- Rename --
vim.keymap.set("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "LSP Rename" })
vim.keymap.set("n", "<leader>rs", ":%s///g<Left><Left><Left>", { desc = "Literal Rename" })
vim.keymap.set("v", "<leader>rs", ":s///g<Left><Left><Left>", { desc = "Literal Rename" })

-- Hypersonic --
-- vim.keymap.set({ "n", "v" }, "<leader>re", "<CMD>Hypersonic<CR>")

-- Terminal --
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
vim.keymap.set("n", "<leader>tt", "<CMD>ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("t", ":q", "<CMD>ToggleTerm<CR>")

vim.api.nvim_create_autocmd("TermEnter", {
	pattern = "term://*toggleterm#*",
	callback = function()
		vim.api.nvim_set_keymap(
			"t",
			"<C-t>",
			'<Cmd>exe v:count1 .. "ToggleTerm"<CR>',
			{ silent = true, noremap = true }
		)
	end,
})
vim.api.nvim_set_keymap("n", "<C-t>", '<Cmd>exe v:count1 .. "ToggleTerm"<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap("i", "<C-t>", '<Esc><Cmd>exe v:count1 .. "ToggleTerm"<CR>', { silent = true, noremap = true })

-- Colors --
vim.keymap.set("n", "<leader>cc", "<CMD>HighlightColors Toggle<CR>", { desc = "Show colors" })
vim.keymap.set("n", "<leader>cp", "<CMD>CccPick<CR>", { desc = "Pick color" })
vim.keymap.set("n", "<leader>cv", "<CMD>CccConvert<CR>", { desc = "Convert color" })

-- Show --
vim.keymap.set("n", "<leader>sw", "<CMD>set wrap!<CR>", { desc = "Toggle wraps" })
vim.keymap.set(
	"n",
	"<leader>si",
	"<CMD>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
	{ desc = "Show inlay hints" }
)
vim.keymap.set("n", "<leader>sr", "<CMD>lua vim.lsp.buf.references()<CR>", { desc = "Show references" })
vim.keymap.set("n", "<leader>ss", "<CMD>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature help" })

-- Code Actions --
vim.keymap.set("n", "<leader>y", "<CMD>FzfLua lsp_code_actions<CR>", { desc = "Show code actions" })

-- Diagnostics/Debugging --
vim.api.nvim_set_keymap("n", "<leader>dd", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Open Diagnostics" })
vim.keymap.set("n", "<leader>du", "<CMD>lua require('dapui').toggle()<CR>", { desc = "Open debugging interface" })
vim.keymap.set("n", "<leader>dt", "<CMD>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", "<CMD>lua require('dap').continue()<CR>", { desc = "Continue" })
vim.keymap.set("n", "<leader>di", "<CMD>lua require('dap').step_into()<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>do", "<CMD>lua require('dap').step_over()<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>dr", "<CMD>lua require('dap').repl.open()<CR>", { desc = "Open REPL" })

-- vim.api.nvim_set_keymap('n', '<leader>xX', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Buffer Diagnostics (Trouble)' })
-- vim.api.nvim_set_keymap("n", "<leader>dl", "<CMD>Trouble loclist toggle<CR>", { desc = "Location List" })

vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

vim.keymap.set("n", "<leader>ü", "<CMD>PasteImage<CR>", { desc = "Paste image from system clipboard" })
vim.keymap.set("n", "<leader>j", "<CMD>TSJToggle<CR>", { desc = "Join or Split lines" })

-- stylua: ignore start
-- vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
-- vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
-- vim.keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
-- vim.keymap.set({ "x", "o" }, "R", function() require("flash").treesitter_search() end, { desc = "Flash Treesitter Search" })
-- vim.keymap.set("c", "<c-i>", function() require("flash").toggle() end, { desc = "Toggle Flash"})
-- stylua: ignore end
