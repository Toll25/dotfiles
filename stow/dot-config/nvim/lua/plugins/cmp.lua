return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			-- "mikavilpas/blink-ripgrep.nvim",
		},
		version = "1.*",
		opts = {
			keymap = {
				preset = "none",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<Tab>"] = {
					"select_next",
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-e>"] = { "hide" },
			},

			appearance = {
				nerd_font_variant = "normal",
			},

			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = {
						border = "rounded",
					},
				},

				menu = {
					border = "rounded",
					draw = {
						columns = { { "label" }, { "kind_icon", "kind" } },
					},
				},
			},
			sources = {
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					mkdnflow = {
						name = "mkdnflow",
						module = "blink.compat.source",
					},
					-- ripgrep = {
					-- 	module = "blink-ripgrep",
					-- 	name = "Ripgrep",
					-- 	opts = {},
					-- },
				},
				default = function()
					local defaults = {
						"lsp",
						"path",
						"snippets",
						"buffer",
						-- "ripgrep",
					}
					if vim.bo.filetype == "markdown" then
						table.insert(defaults, 1, "mkdnflow")
						return defaults
					elseif vim.bo.filetype == "lua" then
						table.insert(defaults, 1, "lazydev")
						return defaults
					else
						return defaults
					end
				end,
			},
		},
		opts_extend = { "sources.default" },
	},
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
}
