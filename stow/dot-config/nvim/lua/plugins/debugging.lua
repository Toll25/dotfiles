return {
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "theHamsta/nvim-dap-virtual-text", "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {},
		event = { "VeryLazy" },
	},
}
