return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
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
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		require("lspconfig").bashls.setup({ capabilities = capabilities })
		-- require("lspconfig").eslint.setup({ capabilities = capabilities })
		require("lspconfig").hyprls.setup({ capabilities = capabilities })
		require("lspconfig").jdtls.setup({ capabilities = capabilities })
		require("lspconfig").marksman.setup({ capabilities = capabilities })
		require("lspconfig").pylsp.setup({ capabilities = capabilities })
		require("lspconfig").tailwindcss.setup({ capabilities = capabilities })
		require("lspconfig").taplo.setup({ capabilities = capabilities })
		require("lspconfig").svelte.setup({ capabilities = capabilities })
		require("lspconfig").ts_ls.setup({ capabilities = capabilities })
		require("lspconfig").lua_ls.setup({ capabilities = capabilities })
		require("lspconfig").jsonls.setup({ capabilities = capabilities })
		require("lspconfig").html.setup({ capabilities = capabilities })
		-- require("lspconfig").cssls.setup({ capabilities = capabilities })
	end,
}
