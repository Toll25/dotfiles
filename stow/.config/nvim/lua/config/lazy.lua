local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {

		-- FORMATTING AND COLORS --

		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			config = function()
				-- load the colorscheme here
				vim.cmd([[colorscheme catppuccin-mocha]])
			end,
		},
		{ "NvChad/nvim-colorizer.lua" },
		{ "sbdchd/neoformat" },

		-- AUTO COMPLETION --

		{ "hrsh7th/nvim-cmp" },

		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-vsnip" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/vim-vsnip" },

		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
		},

		-- QUALITY OF LIFE --

		{ "lewis6991/gitsigns.nvim" },

		{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

		{
			"numToStr/Comment.nvim",
			opts = {
				-- add any options here
			},
			{
				"folke/todo-comments.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
				opts = {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				},
			},
		},

		{ "vim-airline/vim-airline" },

		{ "m-demare/hlargs.nvim" },

		{ "hadronized/hop.nvim" },

		{ "RRethy/vim-illuminate" },

		{ "preservim/tagbar" },

		{ "danilamihailov/beacon.nvim" },

		{ "lewis6991/hover.nvim" },

		{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

		-- UTILITIES --

		{ "tpope/vim-surround" },

		{ "tpope/vim-fugitive" },

		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = { "nvim-lua/plenary.nvim" },
		},

		{
			"folke/trouble.nvim",
			opts = {}, -- for default options, refer to the configuration section for custom setup.
			cmd = "Trouble",
			keys = {
				{
					"<leader>xx",
					"<cmd>Trouble diagnostics toggle<cr>",
					desc = "Diagnostics (Trouble)",
				},
				{
					"<leader>xX",
					"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
					desc = "Buffer Diagnostics (Trouble)",
				},
				-- {
				-- 	"<leader>cs",
				-- 	"<cmd>Trouble symbols toggle focus=false<cr>",
				-- 	desc = "Symbols (Trouble)",
				-- },
				-- {
				-- 	"<leader>cl",
				-- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				-- 	desc = "LSP Definitions / references / ... (Trouble)",
				-- },
				{
					"<leader>xL",
					"<cmd>Trouble loclist toggle<cr>",
					desc = "Location List (Trouble)",
				},
				{
					"<leader>xQ",
					"<cmd>Trouble qflist toggle<cr>",
					desc = "Quickfix List (Trouble)",
				},
			},
		},

		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			},
		},

		-- LSP SUPPORT --

		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			init_options = {
				userLanguages = {
					eelixir = "html-eex",
					eruby = "erb",
					rust = "html",
				},
			},
		},

		{
			"saecki/crates.nvim",
			event = { "BufRead Cargo.toml" },
			config = function()
				require("crates").setup()
			end,
		},

		{
			"mrcjkb/rustaceanvim",
			version = "^4", -- Recommended
			lazy = false, -- This plugin is already lazy
		},

		{ "nvim-treesitter/nvim-treesitter" },
	},

	install = { colorscheme = { "catppuccin-mocha" } },
	checker = { enabled = true },
})
