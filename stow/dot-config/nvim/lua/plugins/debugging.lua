return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "theHamsta/nvim-dap-virtual-text", "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		lazy = true,
		opts = {},
	},
	{
		"andrewferrier/debugprint.nvim",
		version = "*",
		dependencies = {
			"echasnovski/mini.hipatterns",
			"ibhagwan/fzf-lua",
		},
		lazy = false,
		opts = {},
	},
}
