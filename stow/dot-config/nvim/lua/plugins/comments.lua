return {
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
	},
}
