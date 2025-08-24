return {
	{ "danilamihailov/beacon.nvim", event = { "VeryLazy" } },
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{ "rcarriga/nvim-notify", opts = { top_down = false } },
		},
		event = { "VeryLazy" },
		opts = {
			lsp = {
				-- progress = {
				-- 	enabled = false,
				-- },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					-- ["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
			cmdline = {
				enabled = true,
				-- view = "cmdline",
			},
			routes = {
				{
					filter = {
						event = "notify",
						error = true,
						find = "Invalid offset LineCol",
					},
					opts = { skip = true },
				},
			},
		},
	},
	{
		"OXY2DEV/helpview.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		ft = "help",
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = { "VeryLazy" },
		opts = {},
	},
	{
		"3rd/image.nvim",
		ft = { "markdown" },
		opts = {},
	},
	{
		"lewis6991/satellite.nvim",
		opts = {
			handlers = {
				marks = {
					enable = true,
				},
			},
		},
	},
}
