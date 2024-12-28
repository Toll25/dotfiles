return {
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		opts = {},
	},
	{
		"Wansmer/symbol-usage.nvim",
		event = "LspAttach",
		opts = {
			vt_position = "end_of_line",
		},
	},
	{
		"hedyhli/outline.nvim",
		cmd = { "Outline", "OutlineOpen" },
		opts = {},
	},
}
