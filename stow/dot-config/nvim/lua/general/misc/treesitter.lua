local languages = {
	"bash",
	"css",
	"diff",
	"gdscript",
	"html",
	"comment",
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
