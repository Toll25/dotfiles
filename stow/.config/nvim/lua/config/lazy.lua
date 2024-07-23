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

		{
			"NvChad/nvim-colorizer.lua",
			opts = {
				filetypes = { "*" },
				user_default_options = {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					names = true, -- "Name" codes like Blue or blue
					RRGGBBAA = true, -- #RRGGBBAA hex codes
					AARRGGBB = false, -- 0xAARRGGBB hex codes
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
					-- Available modes for `mode`: foreground, background,  virtualtext
					mode = "background", -- Set the display mode.
					-- Available methods are false / true / "normal" / "lsp" / "both"
					-- True is same as normal
					tailwind = true, -- Enable tailwind colors
					-- parsers can contain values used in |user_default_options|
					sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
					virtualtext = "■",
					-- update color values even if buffer is not focused
					-- example use: cmp_menu, cmp_docs
					always_update = false,
				},
				-- all the sub-options of filetypes apply to buftypes
				buftypes = {},
			},
		},

		{
			"stevearc/conform.nvim",
			event = { "BufWritePre" },
			cmd = { "ConformInfo" },
			opts = {
				formatters_by_ft = {
					lua = { "stylua" },
					-- python = { "isort", "black" },
					rust = { "rustfmt", "yew-fmt", lsp_format = "fallback" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 5000,
					lsp_format = "fallback",
				},
			},
		},

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

		{ "f-person/git-blame.nvim", opts = { enabled = false }, cmd = { "GitBlameToggle" } },

		{ "lewis6991/gitsigns.nvim", opts = {} },

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

		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "filesize", "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				extensions = { "neo-tree", "trouble" },
			},
		},

		{ "j-hui/fidget.nvim", opts = {} },

		{ "m-demare/hlargs.nvim", opts = {} },

		{ "RRethy/vim-illuminate" },

		{ "preservim/tagbar" },

		{ "danilamihailov/beacon.nvim" },

		{
			"akinsho/bufferline.nvim",
			version = "*",
			dependencies = "nvim-tree/nvim-web-devicons",
			opts = {
				options = {
					indicator = {
						style = "underline",
					},
					diagnostics = "nvim_lsp",
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							text_align = "center",
							separator = true,
						},
					},
					color_icons = true, -- whether or not to add the filetype icon highlights
					show_buffer_icons = true, -- disable filetype icons for buffers
					show_buffer_close_icons = true,
					show_close_icon = true,
					show_tab_indicators = true,
					show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
					duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
					move_wraps_at_ends = true, -- whether or not the move command "wraps" at the first or last position
					separator_style = "thin",
				},
			},
		},

		-- UTILITIES --

		{
			"linux-cultist/venv-selector.nvim",
			dependencies = {
				"neovim/nvim-lspconfig",
				{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
			},
			lazy = false,
			branch = "regexp", -- This is the regexp branch, use this for the new version
			config = function()
				require("venv-selector").setup()
			end,
			keys = {
				{ "<leader>vs", "<cmd>VenvSelect<cr>" },
			},
		},

		{
			"NeogitOrg/neogit",
			dependencies = {
				"nvim-lua/plenary.nvim", -- required
				"sindrets/diffview.nvim", -- optional - Diff integration

				-- Only one of these is needed, not both.
				"nvim-telescope/telescope.nvim", -- optional
				"ibhagwan/fzf-lua", -- optional
			},
			config = true,
			cmd = { "Neogit" },
		},

		{
			"nvim-neorg/neorg",
			cmd = "Neorg",
			ft = "norg",
			-- lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
			version = "*", -- Pin Neorg to the latest stable release
			config = true,
			opts = {
				load = {
					["core.defaults"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/Documents/Notes",
								mitschrift = "~/Documents/Mitschrift-Norg",
							},
						},
					},
					["core.concealer"] = {},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.integrations.nvim-cmp"] = {},
					["core.text-objects"] = {},
				},
			},
		},

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
			},
		},

		-- LSP SUPPORT --

		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			init_options = {
				userLanguages = {
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
		{
			"nvim-treesitter/nvim-treesitter",
			version = false, -- last release is way too old and doesn't work on Windows
			build = ":TSUpdate",
			event = { "VeryLazy" },
			lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
			init = function(plugin)
				require("lazy.core.loader").add_to_rtp(plugin)
				require("nvim-treesitter.query_predicates")
			end,
			cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
			keys = {
				{ "<c-space>", desc = "Increment Selection" },
				{ "<bs>", desc = "Decrement Selection", mode = "x" },
			},
			opts_extend = { "ensure_installed" },
			opts = {
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"bash",
					"diff",
					"html",
					"javascript",
					"jsdoc",
					"json",
					"jsonc",
					"lua",
					"luadoc",
					"luap",
					"markdown",
					"markdown_inline",
					"printf",
					"python",
					"query",
					"regex",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
					"rust",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				textobjects = {
					move = {
						enable = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
							["]a"] = "@parameter.inner",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]C"] = "@class.outer",
							["]A"] = "@parameter.inner",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
							["[a"] = "@parameter.inner",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[C"] = "@class.outer",
							["[A"] = "@parameter.inner",
						},
					},
				},
			},
			config = function(_, opts)
				require("nvim-treesitter.configs").setup(opts)
			end,
		},
	},

	install = { colorscheme = { "catppuccin-mocha" } },
	checker = { enabled = true },
})
