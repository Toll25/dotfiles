local wk = require("which-key")
wk.add({
	{ "<leader>g", group = "Git" },
	{ "<leader>f", group = "fzf" },
	{ "<leader>s", group = "Show" },
	{ "<leader>r", group = "Rename" },
	{ "<leader>t", group = "Terminal" },
	{ "<leader>d", group = "Diagnostics" },
	{ "<leader>c", group = "Colors" },
	{ "<leader>w", group = "Workspaces" },
	{ "<leader>o", group = "Options" },
	{ "<leader>p", group = "Scratch" },
	{ "<leader>x", group = "Substitute" },
})
local opts = { noremap = true, silent = true }

-- Lazy --
vim.api.nvim_set_keymap("n", "<leader>l", "<CMD>Lazy<CR>", { desc = "Open Lazy UI" })

-- File Manager --
vim.api.nvim_set_keymap("n", "<leader>e", "<CMD>Yazi<CR>", { desc = "Reveal file in filetree" })

-- General Purpose --
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<CMD>w<CR><ESC>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit" })

-- Code Actions --
vim.keymap.set("n", "<leader>y", "<CMD>FzfLua lsp_code_actions<CR>", { desc = "Show code actions" })

-- Command Runner --
vim.keymap.set("n", "<leader>q", "<CMD>OverseerRun<CR>", { desc = "Run tasks" })
vim.keymap.set("n", "<leader>Q", "<CMD>OverseerToggle<CR>", { desc = "Look at tasks" })

-- Split Stuff --
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)
vim.api.nvim_set_keymap("n", "<leader>wv", "<CMD>vsplit<CR>", { desc = "Vertical Split" })
vim.api.nvim_set_keymap("n", "<leader>wh", "<CMD>split<CR>", { desc = "Horizontal Split" })

-- Buffer Navigation --
vim.api.nvim_set_keymap("n", "<C-n>", "<CMD>BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-S-n>", "<CMD>BufferLineCyclePrev<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<C-c>", function()
	Snacks.bufdelete()
end, opts)

-- Marks --
vim.api.nvim_set_keymap("n", "<leader>m", "<CMD>FzfLua marks<CR>", { desc = "Show Marks" })
vim.api.nvim_set_keymap("n", "ä", "`", opts)

-- Scratch --
vim.keymap.set("n", "<leader>pp", function()
	Snacks.scratch()
end, { desc = "Open Scratch buffer" })
vim.keymap.set("n", "<leader>pl", function()
	Snacks.scratch.select()
end, { desc = "List Scratch buffers" })

-- Formatting --
vim.api.nvim_set_keymap("n", "<leader>F", "<CMD>Format<CR>", { desc = "Format file" })

-- fzf --
vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>", { desc = "files" })
vim.keymap.set("n", "<leader>fg", "<CMD>FzfLua live_grep<CR>", { desc = "grep" })
vim.keymap.set("n", "<leader>fb", "<CMD>FzfLua buffers<CR>", { desc = "buffer" })
vim.keymap.set(
	"n",
	"<leader><leader>",
	"<CMD>FzfLua buffers winopts={height=0.33,width=0.33,backdrop=90}<CR>",
	{ desc = "Search buffers" }
)
vim.keymap.set("n", "<leader>fs", "<CMD>FzfLua lsp_workspace_symbols<CR>", { desc = "symbols" })

-- Git --
vim.api.nvim_set_keymap("n", "<leader>gg", "<CMD>Neogit<CR>", { desc = "Open Git UI" })
vim.api.nvim_set_keymap("n", "<leader>gw", "<CMD>lua Snacks.gitbrowse()<CR>", { desc = "Open Git repo in browser" })

-- Rename --
vim.keymap.set("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "LSP" })
vim.keymap.set({ "n", "v" }, "<leader>rs", "<CMD>RipSubstitute<CR>", { desc = "Literal" })
vim.keymap.set("n", "<leader>rg", "<CMD>GrugFar<CR>", { desc = "Grug" })
-- vim.keymap.set({ "n", "v" }, "<leader>rs", ":%s///g<Left><Left><Left>", { desc = "Literal Rename" })

-- Terminal --
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
vim.keymap.set("n", "<leader>tt", "<CMD>ToggleTerm<CR>", { desc = "Terminal" })
vim.keymap.set("n", "<leader>t1", "<CMD>ToggleTerm 1<CR>", { desc = "Terminal 1" })
vim.keymap.set("n", "<leader>t2", "<CMD>ToggleTerm 2<CR>", { desc = "Terminal 2" })
vim.keymap.set("n", "<leader>t3", "<CMD>ToggleTerm 3<CR>", { desc = "Terminal 3" })
vim.keymap.set("n", "<leader>t4", "<CMD>ToggleTerm 4<CR>", { desc = "Terminal 4" })
vim.keymap.set("n", "<leader>tT", "<CMD>terminal<CR>", { desc = "Terminal Buffer" })
vim.keymap.set("t", ":q", "<CMD>ToggleTerm<CR>")
vim.api.nvim_set_keymap("n", "<C-t>", "<Cmd>ToggleTerm<CR>", { silent = true, noremap = true })

-- Colors --
vim.keymap.set("n", "<leader>cp", "<CMD>CccPick<CR>", { desc = "Pick color" })
vim.keymap.set("n", "<leader>cv", "<CMD>CccConvert<CR>", { desc = "Convert color" })

-- Show --
vim.keymap.set("n", "<leader>sl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>", { desc = "LSP info" })
vim.keymap.set(
	"n",
	"<leader>sr",
	"<CMD>Trouble lsp_references toggle focus=false win.position=right<CR>",
	{ desc = "references" }
)
vim.keymap.set("n", "<leader>sd", "<CMD>Trouble lsp_definitions<CR>", { desc = "definition" })
vim.keymap.set(
	"n",
	"<leader>si",
	"<CMD>Trouble lsp_incoming_calls toggle focus=false win.position=right<CR>",
	{ desc = "incomming calls" }
)
vim.keymap.set("n", "<leader>ss", "<CMD>Trouble symbols toggle focus=false<CR>", { desc = "symbols" })
vim.keymap.set(
	"n",
	"<leader>st",
	"<CMD>Trouble lsp_type_definitions toggle focus=false<CR>",
	{ desc = "type definition" }
)
vim.keymap.set("n", "<leader>sD", "<CMD>Trouble lsp_declarations<CR>", { desc = "declaration" })

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

-- which-key --
vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

-- Python --
vim.keymap.set("n", "<leader>P", "<CMD>lua require('swenv.api').pick_venv()<CR>", { desc = "Choose python venv" })

-- Paste
vim.keymap.set("n", "<C-p>", "<CMD>PasteImage<CR>", { desc = "Paste image from system clipboard" })

-- Latex --
vim.keymap.set(
	"n",
	"<leader>L",
	"<CMD>lua require('nabla').popup({border ='rounded'})<CR>",
	{ desc = "Show rendered Latex" }
)

-- Toggle Options --
vim.keymap.set("n", "<leader>oc", "<CMD>HighlightColors Toggle<CR>", { desc = "Toggle colors" })
vim.keymap.set("n", "<leader>ow", "<CMD>set wrap!<CR>", { desc = "Toggle wraps" })
vim.keymap.set("n", "<leader>oi", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
vim.keymap.set("n", "<leader>ol", function()
	local state = vim.diagnostic.config().virtual_lines
	if state == false then
		state = { current_line = true }
	else
		state = false
	end
	vim.diagnostic.config({ virtual_lines = state })
end, { desc = "Toggle virtual line diagnostics" })
vim.keymap.set(
	"n",
	"<leader>on",
	"<CMD>lua require('nabla').toggle_virt()<CR>",
	{ desc = "Toggle latex formula rendering" }
)

-- Substitute --
vim.keymap.set("n", "X", require("substitute.exchange").operator, { noremap = true })
vim.keymap.set("n", "Xx", require("substitute.exchange").line, { noremap = true })
vim.keymap.set("x", "X", require("substitute.exchange").visual, { noremap = true })
vim.keymap.set("n", "Xc", require("substitute.exchange").cancel, { noremap = true })

-- Annotations --
vim.keymap.set("n", "<leader>a", "<CMD>Neogen<CR>", { desc = "Generate Annotation" })

-- Increment/Decrement --
vim.keymap.set("n", "<C-a>", function()
	require("dial.map").manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
	require("dial.map").manipulate("decrement", "normal")
end)
vim.keymap.set("n", "g<C-a>", function()
	require("dial.map").manipulate("increment", "gnormal")
end)
vim.keymap.set("n", "g<C-x>", function()
	require("dial.map").manipulate("decrement", "gnormal")
end)
vim.keymap.set("v", "<C-a>", function()
	require("dial.map").manipulate("increment", "visual")
end)
vim.keymap.set("v", "<C-x>", function()
	require("dial.map").manipulate("decrement", "visual")
end)
vim.keymap.set("v", "g<C-a>", function()
	require("dial.map").manipulate("increment", "gvisual")
end)
vim.keymap.set("v", "g<C-x>", function()
	require("dial.map").manipulate("decrement", "gvisual")
end)

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
