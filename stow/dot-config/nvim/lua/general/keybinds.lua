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
vim.api.nvim_set_keymap("n", "<leader>e", "<CMD>Yazi<CR>", { desc = "Reveal file in filetree" })

-- General Purpose --
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<CMD>w<CR><ESC>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>q", "<CMD>OverseerRun<CR>", { desc = "Run tasks" })
vim.keymap.set("n", "<leader>Q", "<CMD>OverseerToggle<CR>", { desc = "Look at tasks" })

-- Split Stuff --
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)
vim.api.nvim_set_keymap("n", "<leader>wv", "<CMD>vsplit<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>wh", "<CMD>split<CR>", opts)

-- Buffer Navigation --
vim.api.nvim_set_keymap("n", "<C-n>", "<CMD>BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-S-n>", "<CMD>BufferLineCyclePrev<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<C-c>", function()
	Snacks.bufdelete()
end, opts)
vim.api.nvim_set_keymap("n", "<C-m>", "<CMD>FzfLua marks<CR>", opts)
vim.api.nvim_set_keymap("n", "ä", "`", opts)
vim.keymap.set("n", "<leader>pp", function()
	Snacks.scratch()
end, opts)
vim.keymap.set("n", "<leader>pl", function()
	Snacks.scratch.select()
end, opts)

-- Formatting --
vim.api.nvim_set_keymap("n", "<leader>F", "<CMD>Format<CR>", { desc = "Format file" })

-- fzf --
vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<CMD>FzfLua live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<CMD>FzfLua buffers<CR>", { desc = "Find buffer" })

-- Log --
vim.api.nvim_set_keymap("n", "<leader>lv", "<CMD>Chainsaw variableLog<CR>", { desc = "Variable" })
vim.api.nvim_set_keymap("n", "<leader>lo", "<CMD>Chainsaw objectLog<CR>", { desc = "Object" })
vim.api.nvim_set_keymap("n", "<leader>lT", "<CMD>Chainsaw typeLog<CR>", { desc = "Type" })
vim.api.nvim_set_keymap("n", "<leader>la", "<CMD>Chainsaw assertLog<CR>", { desc = "Assert" })
vim.api.nvim_set_keymap("n", "<leader>le", "<CMD>Chainsaw emojiLog<CR>", { desc = "Emoji" })
vim.api.nvim_set_keymap("n", "<leader>lm", "<CMD>Chainsaw messageLog<CR>", { desc = "Message" })
vim.api.nvim_set_keymap("n", "<leader>lt", "<CMD>Chainsaw timeLog<CR>", { desc = "Time" })
vim.api.nvim_set_keymap("n", "<leader>ld", "<CMD>Chainsaw debugLog<CR>", { desc = "Debug" })
vim.api.nvim_set_keymap("n", "<leader>ls", "<CMD>Chainsaw stacktraceLog<CR>", { desc = "Stacktrace" })
vim.api.nvim_set_keymap("n", "<leader>lr", "<CMD>Chainsaw removeLogs<CR>", { desc = "Remove" })

vim.api.nvim_set_keymap("n", "<leader>ll", "<CMD>Lazy<CR>", { desc = "Open Lazy UI" })

-- Git --
vim.api.nvim_set_keymap("n", "<leader>gg", "<CMD>Neogit<CR>", { desc = "Open Git UI" })
vim.api.nvim_set_keymap("n", "<leader>gb", "<CMD>BlameColumnToggle<CR>", { desc = "Toggle inline Git blame" })
vim.api.nvim_set_keymap("n", "<leader>gw", "<CMD>Snacks.gitbrowse()<CR>", { desc = "Open Git repo in browser" })

-- Rename --
vim.keymap.set("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "LSP Rename" })
vim.keymap.set({ "n", "v" }, "<leader>rs", "<CMD>RipSubstitute<CR>", { desc = "Literal Rename" })
vim.keymap.set("n", "<leader>rg", "<CMD>GrugFar<CR>", { desc = "Grug Rename" })
-- vim.keymap.set("n", "<leader>rs", ":%s///g<Left><Left><Left>", { desc = "Literal Rename" })
-- vim.keymap.set("v", "<leader>rs", ":s///g<Left><Left><Left>", { desc = "Literal Rename" })

-- Hypersonic --
-- vim.keymap.set({ "n", "v" }, "<leader>re", "<CMD>Hypersonic<CR>")

-- Terminal --
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
vim.keymap.set("n", "<leader>tt", "<CMD>ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>t1", "<CMD>ToggleTerm 1<CR>", { desc = "Toggle Terminal 1" })
vim.keymap.set("n", "<leader>t2", "<CMD>ToggleTerm 2<CR>", { desc = "Toggle Terminal 2" })
vim.keymap.set("n", "<leader>t3", "<CMD>ToggleTerm 3<CR>", { desc = "Toggle Terminal 3" })
vim.keymap.set("n", "<leader>t4", "<CMD>ToggleTerm 4<CR>", { desc = "Toggle Terminal 4" })
vim.keymap.set("n", "<leader>tT", "<CMD>terminal<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("t", ":q", "<CMD>ToggleTerm<CR>")
vim.api.nvim_set_keymap("n", "<C-t>", "<Cmd>ToggleTerm<CR>", { silent = true, noremap = true })

-- Colors --
vim.keymap.set("n", "<leader>cc", "<CMD>HighlightColors Toggle<CR>", { desc = "Show colors" })
vim.keymap.set("n", "<leader>cp", "<CMD>CccPick<CR>", { desc = "Pick color" })
vim.keymap.set("n", "<leader>cv", "<CMD>CccConvert<CR>", { desc = "Convert color" })

-- Show --
vim.keymap.set("n", "<leader>sw", "<CMD>set wrap!<CR>", { desc = "Toggle wraps" })
-- vim.keymap.set("n", "<leader>sI", function()
-- 	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- end, { desc = "Show inlay hints" })
vim.keymap.set(
	"n",
	"<leader>sl",
	"<CMD>Trouble lsp toggle focus=false win.position=right<CR>",
	{ desc = "Show LSP info" }
)
vim.keymap.set(
	"n",
	"<leader>sr",
	"<CMD>Trouble lsp_references toggle focus=false win.position=right<CR>",
	{ desc = "Show references" }
)
vim.keymap.set("n", "<leader>sd", "<CMD>Trouble lsp_definitions<CR>", { desc = "Show definition" })
vim.keymap.set(
	"n",
	"<leader>si",
	"<CMD>Trouble lsp_incoming_calls toggle focus=false win.position=right<CR>",
	{ desc = "Show incomming calls" }
)
vim.keymap.set("n", "<leader>ss", "<CMD>Trouble symbols toggle focus=false<CR>", { desc = "Show symbols" })
vim.keymap.set(
	"n",
	"<leader>st",
	"<CMD>Trouble lsp_type_definitions toggle focus=false<CR>",
	{ desc = "Show type definition" }
)
vim.keymap.set("n", "<leader>sD", "<CMD>Trouble lsp_declarations<CR>", { desc = "Show declaration" })
vim.keymap.set("n", "<leader>sI", function()
	local state = vim.diagnostic.config().virtual_lines
	if state == false then
		state = { current_line = true }
	else
		state = false
	end
	vim.diagnostic.config({ virtual_lines = state })
end, { desc = "Show virtual line diagnostics" })

-- Code Actions --
vim.keymap.set("n", "<leader>y", "<CMD>FzfLua lsp_code_actions<CR>", { desc = "Show code actions" })

-- Diagnostics/Debugging --
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>dd",
-- 	"<CMD>lua vim.diagnostic.open_float()<CR>",
-- 	{ desc = "Open Diagnostics of line" }
-- )
vim.api.nvim_set_keymap("n", "<leader>dd", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Open Diagnostics" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>dD",
	"<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "Open Diagnostics for current Buffer" }
)
vim.keymap.set("n", "<leader>du", "<CMD>lua require('dapui').toggle()<CR>", { desc = "Open debugging interface" })
vim.keymap.set("n", "<leader>dt", "<CMD>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", "<CMD>lua require('dap').continue()<CR>", { desc = "Continue" })
vim.keymap.set("n", "<leader>di", "<CMD>lua require('dap').step_into()<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>do", "<CMD>lua require('dap').step_over()<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>dr", "<CMD>lua require('dap').repl.open()<CR>", { desc = "Open REPL" })

vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

vim.keymap.set("n", "<leader>P", "<CMD>lua require('swenv.api').pick_venv()<CR>", { desc = "Choose python venv" })
vim.keymap.set("n", "<leader>ü", "<CMD>PasteImage<CR>", { desc = "Paste image from system clipboard" })

-- OLD KEYBINDS

-- vim.api.nvim_set_keymap("n", "<M-k>", "<C-w>k", opts)
-- vim.api.nvim_set_keymap("n", "<M-j>", "<C-w>j", opts)
-- vim.api.nvim_set_keymap("n", "<M-h>", "<C-w>h", opts)
-- vim.api.nvim_set_keymap("n", "<M-l>", "<C-w>l", opts)
-- vim.api.nvim_set_keymap("n", "<M-H>", "<C-w>H", opts)
-- vim.api.nvim_set_keymap("n", "<M-J>", "<C-w>J", opts)
-- vim.api.nvim_set_keymap("n", "<M-K>", "<C-w>K", opts)
-- vim.api.nvim_set_keymap("n", "<M-L>", "<C-w>L", opts)
-- vim.api.nvim_set_keymap("n", "<M-o>", "<C-w>o", opts)
-- vim.api.nvim_set_keymap("n", "<M-q>", "<C-w>q", opts)
-- vim.api.nvim_set_keymap("n", "<M-s>", "<C-w>s", opts)
-- vim.api.nvim_set_keymap("n", "<M-v>", "<C-w>v", opts)
-- vim.api.nvim_set_keymap("n", "<M-w>", "<C-w>w", opts)
-- vim.api.nvim_set_keymap("n", "<M-x>", "<C-w>x", opts)
-- vim.api.nvim_set_keymap("n", "<M-+>", "<C-w>+", opts)
-- vim.api.nvim_set_keymap("n", "<M-->", "<C-w>-", opts)
-- vim.api.nvim_set_keymap("n", "<M-<>", "<C-w><", opts)
-- vim.api.nvim_set_keymap("n", "<M-=>", "<C-w>=", opts)
-- vim.api.nvim_set_keymap("n", "<M->>", "<C-w>>", opts)
-- vim.api.nvim_set_keymap("n", "<M-_>", "<C-w>_", opts)
-- vim.api.nvim_set_keymap("n", "<M-|>", "<C-w>|", opts)
