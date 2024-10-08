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
		config = function()
			require("mkdnflow").setup({
				modules = {
					cmp = true,
				},
				mappings = {
					MkdnEnter = { { "i", "n", "v" }, "<CR>" }, -- This monolithic command has the aforementioned
					-- insert-mode-specific behavior and also will trigger row jumping in tables. Outside
					-- of lists and tables, it behaves as <CR> normally does.
					-- MkdnNewListItem = {'i', '<CR>'} -- Use this command instead if you only want <CR> in
					-- insert mode to add a new list item (and behave as usual outside of lists).
				},
			})
		end,
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
		keys = {
			{ "<leader>ü", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
}
