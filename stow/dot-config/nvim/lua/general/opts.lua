vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.foldcolumn = "0" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.virtualedit = "block"

vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

vim.opt.cursorline = true

vim.opt.incsearch = true
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- vim.cmd("filetype plugin on")
vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
	extension = {
		["http"] = "http",
	},
})
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.ERROR] = "",
		},
		linehl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
	},
})

vim.cmd("let g:loaded_ruby_provider = 0")
vim.cmd("let g:loaded_perl_provider = 0")

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
