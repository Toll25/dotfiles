return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"jakewvincent/mkdnflow.nvim",
		event = "VeryLazy",
		opts = {
			modules = {
				cmp = true,
			},
			mappings = {
				MkdnEnter = { { "i", "n", "v" }, "<CR>" },
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
