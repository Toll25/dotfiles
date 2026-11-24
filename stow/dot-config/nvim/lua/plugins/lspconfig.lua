return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	event = "VeryLazy",
	config = function()
		vim.lsp.enable({
			"dafny",
		})
	end,
}
