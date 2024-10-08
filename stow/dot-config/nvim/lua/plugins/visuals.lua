return {
	{ "danilamihailov/beacon.nvim", event = { "VeryLazy" } },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = {
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			theme = "catppuccin",
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
			extensions = { "neo-tree", "trouble", "toggleterm" },
		},
	},
	{ "RRethy/vim-illuminate", event = { "BufReadPost", "BufWritePost", "BufNewFile" } },
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "VeryLazy",
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = { "VeryLazy" },
		opts = {
			lsp = {
				-- progress = {
				-- 	enabled = false,
				-- },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
			cmdline = {
				enabled = true,
				-- view = "cmdline",
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"OXY2DEV/helpview.nvim",

		ft = "help",

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			filetypes = { "*" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = true,
				AARRGGBB = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
				mode = "background",
				tailwind = true,
				sass = { enable = false, parsers = { "css" } },
				virtualtext = "■",
				always_update = false,
			},
			buftypes = {},
		},
		event = { "VeryLazy" },
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
