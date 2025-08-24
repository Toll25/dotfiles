return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	after = "catppuccin",
	opts = {
		options = {
			right_mouse_command = "lua Snacks.bufdelete(%d)",
			indicator = {
				style = "icon",
			},
			diagnostics = "nvim_lsp",
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_tab_indicators = true,
			show_duplicate_prefix = true,
			duplicates_across_groups = true,
			move_wraps_at_ends = true,
			separator_style = "thick",
		},
	},
}
