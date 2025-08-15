---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
	local conform = require("conform")
	for i = 1, select("#", ...) do
		local formatter = select(i, ...)
		if conform.get_formatter_info(formatter, bufnr).available then
			return formatter
		end
	end
	return select(1, ...)
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			bash = { "shellcheck" },
			css = { "prettierd", "prettier", stop_after_first = true },
			fish = { "fish_indent" },
			gdscript = { "gdformat" },
			html = { "prettierd", "prettier", stop_after_first = true },
			java = { "google-java-format" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			markdown = function(bufnr)
				return { first(bufnr, "prettierd", "prettier"), "injected" }
			end,
			python = { "isort", "black" },
			rust = { "rustfmt", "yew-fmt", lsp_format = "fallback" },
			sh = { "shellcheck" },
			svelte = { "prettierd", "prettier", stop_after_first = true },
			tex = { "latexindent" },
			toml = { "taplo" },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
