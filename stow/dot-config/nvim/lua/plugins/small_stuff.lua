return {
	{ "uga-rosa/ccc.nvim", opts = {} },
	{ "nacro90/numb.nvim", opts = {} },
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
		cmd = { "OverseerRun" },
	},
	{
		"danymat/neogen",
		config = true,
	},
	{ "echasnovski/mini.splitjoin", opts = {}, version = false },
}
