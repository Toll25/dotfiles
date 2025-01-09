return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		quickfile = { enabled = true },
		rename = { enabled = true },
		-- statuscolumn = { enabled = true },
		toggle = { enabled = true },
		words = { enabled = true, debounce = 100 }, -- illuminate replacement
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = { enabled = true },
		-- git = { enabled = true },
		gitbrowse = { enabled = true },
		indent = { enabled = true },

		-- input = { enabled = true },
		-- notifier = { enabled = true },
		-- scroll = { enabled = true },
	},
}
