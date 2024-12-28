return {
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "VeryLazy",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			-- { "hrsh7th/cmp-emoji" },
			{ "hrsh7th/vim-vsnip" },
			{ "onsails/lspkind-nvim" },
			-- { "kdheepak/cmp-latex-symbols" },
			-- { "chrisgrieser/cmp-nerdfont" },
		},
		opts = function()
			local cmp = require("cmp")

			cmp.setup.filetype("markdown", {
				sources = cmp.config.sources({
					{ name = "mkdnflow" }, -- Add this
					{ name = "buffer" },
					{ name = "path" },
					-- { name = "emoji" },
					-- { name = "nerdfont" },
					-- {
					-- 	name = "latex_symbols",
					-- 	option = {
					-- 		strategy = 0, -- mixed
					-- 	},
					-- },
				}),
			})

			return {
				view = {
					entries = "custom", -- can be "custom", "wildmenu" or "native"
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
					{ name = "nvim_lua" },
					{ name = "path" },
					-- { name = "emoji" },
					{ name = "crates" },
					-- { name = "nvim_lsp_signature_help" },
					-- { name = "neorg" },
					-- { name = "nerdfont" },
					-- {
					-- 	name = "latex_symbols",
					-- 	option = {
					-- 		strategy = 0, -- mixed
					-- 	},
					-- },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = function(entry, item)
						local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
						item = require("lspkind").cmp_format({
							-- any lspkind format settings here
						})(entry, item)
						if color_item.abbr_hl_group then
							item.kind_hl_group = color_item.abbr_hl_group
							item.kind = color_item.abbr
						end
						item.menu = ""
						return item
					end,
				}, -- formatting = {
				-- 	fields = { "menu", "abbr", "kind" },
				-- 	format = function(entry, vim_item)
				-- 		-- Kind icons
				-- 		vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
				-- 		-- Source
				-- 		vim_item.menu = ({
				-- 			-- buffer = "[Buffer]",
				-- 			-- nvim_lsp = "[LSP]",
				-- 			-- luasnip = "[LuaSnip]",
				-- 			-- nvim_lua = "[Lua]",
				-- 			latex_symbols = "[LaTeX]",
				-- 			nerdfont = "[Nerdfont]",
				-- 			emoji = "[Emoji]",
				-- 		})[entry.source.name]
				-- 		-- vim_item.menu = ""
				-- 		return vim_item
				-- 	end,
				-- },
			}
		end,
	},
	{ "rafamadriz/friendly-snippets" },
}
