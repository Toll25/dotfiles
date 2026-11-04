return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"saghen/blink.lib",
			"rafamadriz/friendly-snippets",
		},
		-- version = "1.*",
		build = function()
			-- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
			-- you can use `gb` in `:Lazy` to rebuild the plugin as needed
			require("blink.cmp").build():pwait()
		end,
		opts = {
			keymap = {
				preset = "none",
				["<C-space>"] = {
					"show",
					"show_documentation",
					"hide_documentation",
				},
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-n>"] = { "snippet_forward", "fallback" },
				["<C-p>"] = { "snippet_backward", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "scroll_signature_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "scroll_signature_down", "fallback" },
				["<C-q>"] = { "show_signature", "hide_signature", "fallback" },
				["<C-s>"] = { "show_signature_documentation", "hide_signature_documentation", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-e>"] = { "hide" },
			},

			appearance = {
				nerd_font_variant = "normal",
			},

			signature = {
				enabled = true,
				window = {
					border = "rounded",
					show_documentation = true,
				},
			},
			completion = {
				list = {
					selection = {
						-- preselect = false,
						auto_insert = false,
					},
					cycle = {
						-- from_bottom = false,
						-- from_top = false,
					},
				},
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
				keyword = {
					range = "full",
				},
				menu = {
					border = "rounded",
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
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
					snippets = {
						opts = {
							extended_filetypes = {
								markdown = { "tex" },
							},
						},
					},
					buffer = {
						opts = {
							get_bufnrs = function()
								return vim.tbl_filter(function(bufnr)
									return vim.bo[bufnr].buftype == ""
								end, vim.api.nvim_list_bufs())
							end,
						},
					},
				},
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				per_filetype = {
					lua = { inherit_defaults = true, "lazydev" },
					markdown = { inherit_defaults = true, "mkdnflow" },
				},
			},
		},
	},
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
}
