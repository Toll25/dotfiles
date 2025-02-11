return {
	-- { "echasnovski/mini.pairs", version = false, opts = {} },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			enable_check_bracket_line = true,
		},
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		ft = { "html", "svelte" },
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "VeryLazy",
		config = function()
			require("rainbow-delimiters.setup").setup({})
		end,
	},
}
