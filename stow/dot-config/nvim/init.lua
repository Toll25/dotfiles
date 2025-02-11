if vim.loader then
	vim.loader.enable()
end

-- Options --
require("general.opts")

-- Lazy --
require("config.lazy")
require("config.neotest")
require("config.yazi")

-- Keybinds and Commands --
require("general.commands")
require("general.keybinds")

-- Misc --
require("general.autocmd.auto-update")
require("general.autocmd.inlay-hints")
require("general.autocmd.hl-yank")
require("general.autocmd.open-images")

vim.cmd.colorscheme("catppuccin")

-- Filter out wrong error --
for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
	local default_diagnostic_handler = vim.lsp.handlers[method]
	vim.lsp.handlers[method] = function(err, result, context, config)
		if err ~= nil and err.code == -32802 then
			return
		end
		return default_diagnostic_handler(err, result, context, config)
	end
end
