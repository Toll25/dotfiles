vim.cmd("let g:airline_theme = 'catppuccin'")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number relativenumber")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set nocompatible")
vim.cmd("filetype plugin on")
-- vim.cmd("syntax on")
vim.cmd("set conceallevel=3")
vim.cmd("set foldlevelstart=99")
vim.g.nvim_tree_respect_buf_cwd = 1
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
