local ELLIPSIS_CHAR = "…"
local MAX_LABEL_WIDTH = 25
local MAX_KIND_WIDTH = 14

local get_ws = function(max, len)
	return (" "):rep(max - len)
end

local format = function(entry, item)
	local content = item.abbr
	-- local kind_symbol = symbols[item.kind]
	-- item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

	if #content > MAX_LABEL_WIDTH then
		item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
	else
		item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
	end

	local menu_icon = {
		nvim_lsp = "λ",
		vsnip = "⋗",
		buffer = "Ω",
		path = "🖫",
	}
	item.menu = menu_icon[entry.source.name]

	return item
end

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		-- ["<C-p>"] = cmp.mapping.select_prev_item(),
		-- ["<C-n>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	sources = {
		{ name = "path" }, -- file paths
		{ name = "nvim_lsp", keyword_length = 3 }, -- from language server
		{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
		{ name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
		{ name = "buffer", keyword_length = 2 }, -- source current buffer
		{ name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
		{ name = "calc" }, -- source for math calculation
		{ name = "neorg" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = format,
	},
})
