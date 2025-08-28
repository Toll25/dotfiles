return {
	{
		"stevearc/overseer.nvim",
		opts = {
			strategy = "toggleterm",
		},
		cmd = { "OverseerRun", "OverseerToggle" },
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
	},
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		opts = {},
	},
	{
		"danymat/neogen",
		opts = {},
		cmd = "Neogen",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
		},
	},
}
