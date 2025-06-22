return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	event = "VeryLazy",
	opts = {
		inlay_hints = {
			enabled = true,
		},
		-- setup = {
		-- 	rust_analyzer = function()
		-- 		return true
		-- 	end,
		-- },
	},
	config = function()
		vim.lsp.enable({
			-- "bashls",
			-- "hyprls",
			-- "jdtls",
			-- "marksman",
			"pylsp",
			-- "tailwindcss",
			-- "taplo",
			-- "svelte",
			-- "ts_ls",
			"lua_ls",
			-- "jsonls",
			-- "html",
			-- "nushell",
		})
	end,
}
