return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"adoyle-h/lsp-toggle.nvim",
			"keyvchan/telescope-find-pickers.nvim",
			"crispgm/telescope-heading.nvim",
			"debugloop/telescope-undo.nvim",
		},
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		-- lazy = false,
		branch = "regexp",
		opts = {},
		cmd = "VenvSelect",
	},
}
