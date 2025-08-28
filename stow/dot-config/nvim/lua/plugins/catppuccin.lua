return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		opts = {
			-- transparent_background = true,
			dim_inactive = { enabled = true },
			highlight_overrides = {
				all = function(colors)
					return {
						LspInlayHint = { bg = colors.none },
					}
				end,
			},
			integrations = {
				beacon = true,
				diffview = true,
				dropbar = {
					enabled = true,
					color_mode = true,
				},
				grug_far = true,
				neotest = true,
				noice = true,
				notify = true,
				nvim_surround = true,
				overseer = true,
				lsp_trouble = true,
				which_key = true,
			},
		},
	},
}
