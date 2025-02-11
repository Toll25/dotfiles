return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "*",
		opts = {
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
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
					},
				},

				menu = {
					border = "rounded",
					auto_show = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
					draw = {
						columns = { { "label" }, { "kind_icon", "kind" } },
					},
				},
			},
			-- signature = { enabled = true, window = { border = "single" } },
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
				["<CR>"] = { "accept", "fallback" },
				["<C-e>"] = { "hide" },
			},

			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "normal",
			},

			sources = {

				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					-- dictionary = {
					-- 	module = "blink-cmp-dictionary",
					-- 	name = "Dict",
					-- },
					mkdnflow = {
						name = "mkdnflow",
						module = "blink.compat.source",
					},
				},
				default = function()
					if vim.bo.filetype == "markdown" then
						return { "mkdnflow", "lsp", "path", "snippets", "buffer" }
					else
						return { "lazydev", "lsp", "path", "snippets", "buffer" }
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
