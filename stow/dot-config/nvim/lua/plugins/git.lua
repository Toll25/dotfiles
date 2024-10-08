return {
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "f-person/git-blame.nvim", opts = { enabled = false }, cmd = { "GitBlameToggle" } },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
		cmd = { "Neogit" },
	},
}
