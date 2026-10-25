return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- GDScript
				-- "gdscript",
				"clangd",
				"clang-format",
				-- Lua
				"lua_ls",
				-- Python
				"pylsp",
				-- Web Dev
				"html",
				"cssls",
				"svelte",
				"tailwindcss",
				"ts_ls",
				-- LaTeX
				"texlab",
				-- Java
				"jdtls",
				-- JSON
				"jsonls",
				"prettierd",
				"prettier",
				"gdscript-formatter",
				"stylua",
				"ruff",
				"tex-fmt",
				"air",
			},
			auto_update = true,
		},
	},
}
