return {
	{
		"jakewvincent/mkdnflow.nvim",
		ft = { "markdown" },
		opts = {
			links = {
				create_on_follow_failure = false,
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
		"OXY2DEV/markview.nvim",
		ft = { "markdown" },
		after = "catppuccin",
	},
	-- {
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	ft = { "markdown" },
	-- 	opts = {},
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	-- },
	{
		"HakonHarnes/img-clip.nvim",
		ft = { "markdown" },
		opts = {},
	},
}
