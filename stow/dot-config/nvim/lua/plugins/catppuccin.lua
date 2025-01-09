return {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		-- transparent_background = true,
		highlight_overrides = {
			all = function(colors)
				return {
					LspInlayHint = { bg = colors.none },
				}
			end,
		},
		integrations = {
			diffview = true,
			-- fidget = true,
			-- harpoon = true,
			-- headlines = true,
			gitsigns = true,
			lsp_trouble = true,
			neotree = true,
			noice = true,
			notify = true,
			nvim_surround = true,
			overseer = true,
			which_key = true,
			neotest = true,
			blink_cmp = true,
			fzf = true,
			snacks = true,
		},
	},
	priority = 1000,
}
