local slow_format_filetypes = {}
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			sh = { "shellharden", "beautysh" },
			bash = { "shellharden", "beautysh" },
			fish = { "fish_indent" },
			toml = { "taplo" },
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt", "yew-fmt", lsp_format = "fallback" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
		},
		format_on_save = function(bufnr)
			if slow_format_filetypes[vim.bo[bufnr].filetype] then
				return
			end
			local function on_format(err)
				if err and err:match("timeout$") then
					slow_format_filetypes[vim.bo[bufnr].filetype] = true
				end
			end

			return { timeout_ms = 200, lsp_format = "fallback" }, on_format
		end,

		format_after_save = function(bufnr)
			if not slow_format_filetypes[vim.bo[bufnr].filetype] then
				return
			end
			return { lsp_format = "fallback" }
		end,
	},
}
