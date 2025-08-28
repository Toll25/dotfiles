return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
			},
		},
	},
	{
		"AckslD/swenv.nvim",
		ft = "python",
		opts = {},
	},
	{ "mistweaverco/kulala.nvim", opts = {}, ft = "http" },
}
