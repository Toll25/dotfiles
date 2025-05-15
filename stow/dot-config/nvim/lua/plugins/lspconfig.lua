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
		-- local capabilities = require("blink.cmp").get_lsp_capabilities()
		-- capabilities.textDocument.foldingRange = {
		-- 	dynamicRegistration = false,
		-- 	lineFoldingOnly = true,
		-- }
		vim.lsp.enable({
			"bashls",
			"hyprls",
			"jdtls",
			"marksman",
			"pylsp",
			"tailwindcss",
			"taplo",
			"svelte",
			"ts_ls",
			"lua_ls",
			"jsonls",
			"html",
			"nushell",
		})
		-- vim.lsp.config("bashls", { capabilities = capabilities })
		-- -- require("lspconfig").eslint.setup({ capabilities = capabilities })
		-- vim.lsp.config("hyprls", { capabilities = capabilities })
		-- vim.lsp.config("jdtls", { capabilities = capabilities })
		-- vim.lsp.config("marksman", { capabilities = capabilities })
		-- vim.lsp.config("pylsp", { capabilities = capabilities })
		-- vim.lsp.config("tailwindcss", { capabilities = capabilities })
		-- vim.lsp.config("taplo", { capabilities = capabilities })
		-- vim.lsp.config("svelte", { capabilities = capabilities })
		-- vim.lsp.config("ts_ls", { capabilities = capabilities })
		-- vim.lsp.config("lua_ls", { capabilities = capabilities })
		-- vim.lsp.config("jsonls", { capabilities = capabilities })
		-- vim.lsp.config("html", { capabilities = capabilities })
		-- vim.lsp.config("nushell", { capabilities = capabilities })
		-- require("lspconfig").harper_ls.setup({ capabilities = capabilities })
		-- require("lspconfig").cssls.setup({ capabilities = capabilities })
	end,
}
