return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{ "williamboman/mason-lspconfig.nvim", opts = {} },
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"beautysh",
				"black",
				"cssls",
				"html",
				"jdtls",
				"jsonls",
				"lua_ls",
				"marksman",
				"prettierd",
				"pylsp",
				"rust-analyzer",
				"shellharden",
				"stylua",
				"svelte",
				"tailwindcss",
				"taplo",
				"ts_ls",
				-- "hyprls",
				-- "harper-ls",
			},
		},
	},
}
