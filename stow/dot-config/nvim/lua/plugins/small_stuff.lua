return {
	{ "uga-rosa/ccc.nvim", opts = {}, cmd = { "CccConvert", "CccPick" } },
	{ "nacro90/numb.nvim", opts = {}, event = "VeryLazy" },
	{
		"gbprod/cutlass.nvim",
		opts = {
			cut_key = "x",
			override_del = nil,
			exclude = {},
			registers = {
				select = "s",
				delete = "d",
				change = "c",
			},
		},
	},
	{
		"stevearc/overseer.nvim",
		opts = {
			strategy = "toggleterm",
		},
		cmd = { "OverseerRun", "OverseerToggle" },
	},
	{ "echasnovski/mini.splitjoin", opts = {}, version = false },
	{ "echasnovski/mini.move", opts = {}, version = false },
	{
		"andrewferrier/debugprint.nvim",
		version = "*",
		dependencies = {
			"echasnovski/mini.hipatterns",
			"ibhagwan/fzf-lua",
		},
		lazy = false,
		opts = {},
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
	},
	{ "gbprod/substitute.nvim", opts = {} },
	{
		"kawre/leetcode.nvim",
		dependencies = {
			"ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		lazy = "leet" ~= vim.fn.argv(0, -1),
		opts = {
			arg = "leet",
			lang = "rust",
			image_support = true,
			injector = {
				["rust"] = {
					before = { "fn main(){}", "struct Solution;" },
				},
			},
			hooks = {
				["question_enter"] = {
					function(question)
						local problem_dir = vim.fn.stdpath("data") .. "/leetcode/Cargo.toml"
						local content = [[
                [package]
                name = "leetcode"
                edition = "2024"

                [lib]
                name = "%s"
                path = "%s"
              ]]

						local file = io.open(problem_dir, "w")
						if file then
							local formatted = (content:gsub(" +", "")):format(question.q.frontend_id, question:path())
							file:write(formatted)
							file:close()
						else
							print("Failed to open file: " .. problem_dir)
						end
					end,
				},
			},
		},
	},
	{ "mistweaverco/kulala.nvim", opts = {}, ft = "http" },
	{
		"AckslD/swenv.nvim",
		ft = "python",
		opts = {},
	},
	{
		"chrisgrieser/nvim-rip-substitute",
		cmd = "RipSubstitute",
		opts = {},
	},
	{
		"MagicDuck/grug-far.nvim",
		opts = {},
	},
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		opts = {},
	},
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			-- vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_view_general_viewer = "okular"
			vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
		end,
	},
	{
		"jbyuki/nabla.nvim",
	},
	{
		"danymat/neogen",
		opts = {},
		cmd = "Neogen",
	},
}
