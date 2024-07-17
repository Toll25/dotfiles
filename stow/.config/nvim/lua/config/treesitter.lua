-- Treesitter Plugin Setup
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "rust", "toml", "hyprlang" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	vim.filetype.add({
		extension = { rasi = "rasi" },
		pattern = {
			[".*/waybar/config"] = "jsonc",
			[".*/mako/config"] = "dosini",
			[".*/kitty/*.conf"] = "bash",
			[".*/hypr/.*%.conf"] = "hyprlang",
		},
	}),
})
