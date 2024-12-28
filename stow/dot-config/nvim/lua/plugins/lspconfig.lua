return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	opts = {
		inlay_hints = {
			enabled = true,
		},
		setup = {
			rust_analyzer = function()
				return true
			end,
		},
	},
	config = function()
		require("lspconfig").bashls.setup({})
		require("lspconfig").eslint.setup({})
		require("lspconfig").hyprls.setup({})
		require("lspconfig").jdtls.setup({})
		require("lspconfig").marksman.setup({})
		require("lspconfig").pylsp.setup({})
		require("lspconfig").tailwindcss.setup({})
		require("lspconfig").taplo.setup({})
		require("lspconfig").svelte.setup({})
		require("lspconfig").ts_ls.setup({})
		require("lspconfig").lua_ls.setup({})
	end,
}
