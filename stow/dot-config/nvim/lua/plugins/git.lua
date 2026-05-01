return {
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		opts = {},
		cmd = { "Neogit" },
	},
}
