return {
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
		},

		-- use a release tag to download pre-built binaries
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		opts = {
			completion = {
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
						-- components = {
						-- 	kind_icon = {
						-- 		ellipsis = false,
						-- 		text = function(ctx)
						-- 			local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
						-- 			return kind_icon
						-- 		end,
						-- 		-- Optionally, you may also use the highlights from mini.icons
						-- 		highlight = function(ctx)
						-- 			local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
						-- 			return hl
						-- 		end,
						-- 	},
						-- },
					},
				},
			},
			-- signature = { enabled = true, window = { border = "single" } },
			keymap = {
				preset = "none",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<ä>"] = { "snippet_forward", "fallback" },
				["<ö>"] = { "snippet_backward", "fallback" },
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
		-- use the latest release, via version = '*', if you also use the latest release for blink.cmp
		version = "*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},
	-- 		cmp.setup.filetype("markdown", {
	-- 			sources = cmp.config.sources({
	-- 				{ name = "mkdnflow" },
	-- 				{ name = "vsnip" },
	-- 				{ name = "buffer" },
	-- 				{ name = "path" },
	-- 				-- { name = "emoji" },
	-- 				-- { name = "nerdfont" },
	-- 				-- {
	-- 				-- 	name = "latex_symbols",
	-- 				-- 	option = {
	-- 				-- 		strategy = 0, -- mixed
	-- 				-- 	},
	-- 				-- },
	-- 			}),
	-- 		})
	-- 			formatting = {
	-- 				format = function(entry, item)
	-- 					local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
	-- 					item = require("lspkind").cmp_format({})(entry, item)
	-- 					if color_item.abbr_hl_group then
	-- 						item.kind_hl_group = color_item.abbr_hl_group
	-- 						item.kind = color_item.abbr
	-- 					end
	-- 					item.menu = ""
	-- 					return item
	-- 				end,
	-- 			},
}
