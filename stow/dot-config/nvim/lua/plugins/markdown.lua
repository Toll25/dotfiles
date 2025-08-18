return {
	{
		"jakewvincent/mkdnflow.nvim",
		ft = { "markdown" },
		opts = {
			links = {
				-- create_on_follow_failure = false,
				transform_explicit = function(input)
					return string.gsub(input, " ", "_")
				end,
			},
			modules = {
				cmp = true,
			},
			mappings = {
				MkdnEnter = { { "i", "n", "v" }, "<CR>" },
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		opts = {
			completions = { lsp = { enabled = true } },
		},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{
		"HakonHarnes/img-clip.nvim",
		ft = { "markdown" },
		opts = {},
	},
}
