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
			"gdscript",
			"lua_ls",
			"pylsp",
			-- "bashls",
			"html",
			"texlab",
			-- "hyprls",
			-- "jdtls",
			"jsonls",
			"cssls",
			-- "marksman",
			-- "nushell",
			"svelte",
			"tailwindcss",
			-- "taplo",
			"ts_ls",
		})
	end,
}
