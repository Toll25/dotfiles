return {
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
		"karb94/neoscroll.nvim",
		opts = {},
	},
	{
		"Bekaboo/dropbar.nvim",
		opts = {},
	},
}
