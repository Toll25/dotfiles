return {
	{ "uga-rosa/ccc.nvim", opts = {} },
	{ "nacro90/numb.nvim", opts = {} },
	{ "aznhe21/actions-preview.nvim", opts = {} },
	{
		"gbprod/cutlass.nvim",
		opts = {
			cut_key = "m",
			override_del = nil,
			exclude = {},
			registers = {
				select = "s",
				delete = "d",
				change = "c",
			},
		},
	},
	{
		"stevearc/overseer.nvim",
		opts = {
			strategy = "toggleterm",
		},
		event = "VeryLazy",
	},
	{
		"danymat/neogen",
		config = true,
	},
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = { use_default_keymaps = false },
	},
}
