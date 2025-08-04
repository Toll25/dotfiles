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
require("general.autocmd.duckduckgo")
require("general.autocmd.hl-yank")
require("general.autocmd.open-images")

vim.cmd.colorscheme("catppuccin")

-- paths to check for project.godot file
local paths_to_check = { "/", "/../" }
local is_godot_project = false
local godot_project_path = ""
local cwd = vim.fn.getcwd()

-- iterate over paths and check
for key, value in pairs(paths_to_check) do
	if vim.uv.fs_stat(cwd .. value .. "project.godot") then
		is_godot_project = true
		godot_project_path = cwd .. value
		break
	end
end

-- check if server is already running in godot project path
local is_server_running = vim.uv.fs_stat(godot_project_path .. "/server.pipe")
-- start server, if not already running
if is_godot_project and not is_server_running then
	vim.fn.serverstart(godot_project_path .. "/server.pipe")
end

-- Filter out wrong error --
for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
	local default_diagnostic_handler = vim.lsp.handlers[method]
	vim.lsp.handlers[method] = function(err, result, context, config)
		if err ~= nil and err.code == -32603 then
			return
		end
		return default_diagnostic_handler(err, result, context, config)
	end
end
