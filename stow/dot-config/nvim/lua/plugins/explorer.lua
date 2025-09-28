return {
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = false,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
	},
}
