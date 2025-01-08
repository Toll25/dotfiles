return {
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "theHamsta/nvim-dap-virtual-text", "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {},
	},
}
