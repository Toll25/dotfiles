return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "catppuccin",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				-- lualine_x = {
				-- 	"encoding",
				-- 	"fileformat",
				-- 	"filetype",
				-- },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			extensions = { "trouble", "toggleterm" },
		},
	},
}
