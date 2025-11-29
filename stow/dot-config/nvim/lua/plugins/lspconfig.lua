return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	event = "VeryLazy",
	opts = {},
	config = function()
		vim.lsp.enable({
			"gdscript",
			"lua_ls",
			"pylsp",
			-- "bashls",
			"html",
			"texlab",
			-- "hyprls",
            -- "harper_ls",
			"jdtls",
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
