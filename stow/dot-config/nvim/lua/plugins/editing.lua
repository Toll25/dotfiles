return {
	{
		"gbprod/cutlass.nvim",
		opts = {
			cut_key = "x",
			override_del = nil,
			exclude = {},
			registers = {
				select = "s",
				delete = "d",
				change = "c",
			},
		},
	},
	{ "gbprod/substitute.nvim", opts = {} },
	{ "echasnovski/mini.splitjoin", opts = {}, version = false },
	{ "echasnovski/mini.move", opts = {}, version = false },
}
