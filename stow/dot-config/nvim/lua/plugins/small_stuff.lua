return {
	{ "uga-rosa/ccc.nvim", opts = {}, cmd = { "CccConvert", "CccPick" } },
	{ "nacro90/numb.nvim", opts = {}, event = "VeryLazy" },
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
	{
		"chrisgrieser/nvim-chainsaw",
		cmd = "Chainsaw",
		opts = {},
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
	},
	{
		"kawre/leetcode.nvim",
		dependencies = {
			"ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		lazy = "leet" ~= vim.fn.argv(0, -1),
		opts = {
			arg = "leet",
			lang = "rust",
			image_support = true,
		},
	},
	{ "mistweaverco/kulala.nvim", opts = {}, ft = "http" },
	{
		"stefanboca/venv-selector.nvim",
		branch = "sb/push-rlpxsqmllxtz",
		opts = {},
		cmd = "VenvSelect",
	},
	{
		"chrisgrieser/nvim-rip-substitute",
		cmd = "RipSubstitute",
		opts = {},
	},
	{
		"MagicDuck/grug-far.nvim",
		opts = {},
	},
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		opts = {},
	},
	{
		"Yu-Leo/blame-column.nvim",
		opts = {},
		cmd = "BlameColumnToggle",
	},
}
