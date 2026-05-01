-- Format Command
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

-- Autoformat with Exceptions
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		if vim.g.autoformat then
			require("conform").format({ bufnr = args.buf })
		end
	end,
})

vim.api.nvim_create_user_command("W", function()
	vim.g.autoformat = false
	vim.cmd("write")
	vim.g.autoformat = true
end, {})


-- -- Activate Codelens
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local bufnr = args.buf
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
--
-- 		if client and client:supports_method("textDocument/codeLens") then
-- 			vim.lsp.codelens.enable(true, { bufnr = bufnr })
-- 			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
-- 				buffer = bufnr,
-- 				callback = vim.lsp.codelens.enable(true, { bufnr = bufnr }),
-- 			})
-- 		end
-- 	end,
-- })
--
-- -- Activate Inline Hints
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		if client.server_capabilities.inlayHintProvider then
-- 			vim.lsp.inlay_hint.enable(true)
-- 		end
-- 	end,
-- })


-- Custom stuff for opening images
vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = "*.pdf",
	callback = function()
		local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
		vim.cmd("silent !okular " .. filename .. " &")
		vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
	end,
})

vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
	callback = function()
		local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
		vim.cmd("silent !gwenview " .. filename .. " &")
		vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
	end,
})

-- Godot Setup
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


-- Treesitter Setup
local languages = {
	"bash",
	"comment",
	"css",
	"diff",
	"gdscript",
	"html",
	"http",
	"hyprlang",
	"java",
	"javascript",
	"jsdoc",
	"json",
	"kdl",
	"latex",
	"lua",
	"luadoc",
	"luap",
	"markdown",
	"markdown_inline",
	"nu",
	"printf",
	"python",
	"query",
	"regex",
	"rust",
	"sql",
	"svelte",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
}
require("nvim-treesitter").install(languages)
vim.api.nvim_create_autocmd("FileType", {
	pattern = languages,
	callback = function()
		-- syntax highlighting, provided by Neovim
		vim.treesitter.start()
		-- folds, provided by Neovim
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldmethod = "expr"
		-- indentation, provided by nvim-treesitter
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
