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
				"stylua",
				"lua_ls",
				"shellharden",
				"beautysh",
				"black",
				"prettierd",
				"bashls",
				-- "hyprls",
				"jdtls",
				"pylsp",
				"tailwindcss",
				"svelte",
				"taplo",
				"ts_ls",
				"jsonls",
				"html",
				"cssls",
				"rust-analyzer",
				"marksman",
			},
		},
	},
}
