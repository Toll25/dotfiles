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

local hydra = {
	"⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆          ",
	"⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦         ",
	"      ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄       ",
	"       ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄      ",
	"      ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀     ",
	"⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄   ",
	"⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
	"⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ ",
	"⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄",
	"    ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
	"     ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
}
-- local header = {
-- 	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
-- 	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
-- 	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
-- 	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
-- 	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
-- 	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
-- }
local slow_format_filetypes = {}
-- Splitting the header into lines
require("lazy").setup({
	spec = {

		-- FORMATTING, COLORS AND WINDOWDRESSING --

		{
			"catppuccin/nvim",
			name = "catppuccin",
			lazy = true,
			priority = 1000,
		},
		{
			"nvimdev/dashboard-nvim",
			event = "VimEnter",
			config = function()
				require("dashboard").setup({
					config = {
						header = hydra,
						shortcut = {},
					},
				})
			end,
			dependencies = { { "nvim-tree/nvim-web-devicons" } },
		},

		{
			"folke/noice.nvim",
			event = { "VeryLazy" },
			opts = {
				lsp = {
					progress = {
						enabled = false,
					},
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					-- command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = true, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
				cmdline = {
					enabled = true,
					view = "cmdline",
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
			"stevearc/conform.nvim",
			event = { "BufWritePre" },
			cmd = { "ConformInfo" },
			opts = {
				formatters_by_ft = {
					sh = { "shellharden", "beautysh" },
					bash = { "shellharden", "beautysh" },
					fish = { "fish_indent" },
					toml = { "taplo" },
					lua = { "stylua" },
					python = { "isort", "black" },
					rust = { "rustfmt", "yew-fmt", lsp_format = "fallback" },
				},
				format_on_save = function(bufnr)
					if slow_format_filetypes[vim.bo[bufnr].filetype] then
						return
					end
					local function on_format(err)
						if err and err:match("timeout$") then
							slow_format_filetypes[vim.bo[bufnr].filetype] = true
						end
					end

					return { timeout_ms = 200, lsp_format = "fallback" }, on_format
				end,

				format_after_save = function(bufnr)
					if not slow_format_filetypes[vim.bo[bufnr].filetype] then
						return
					end
					return { lsp_format = "fallback" }
				end,
			},
		},

		-- AUTO COMPLETION --

		{
			"hrsh7th/nvim-cmp",
			version = false, -- last release is way too old
			event = "VeryLazy",
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "hrsh7th/cmp-nvim-lsp-signature-help" },
				{ "hrsh7th/cmp-vsnip" },
				{ "hrsh7th/cmp-path" },
				-- { "hrsh7th/cmp-buffer" },
				{ "hrsh7th/vim-vsnip" },
			},
			opts = function()
				local cmp = require("cmp")
				return {
					snippet = {
						-- REQUIRED - you must specify a snippet engine
						expand = function(args)
							vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
							-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
							-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
							-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
							-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
						end,
					},
					window = {
						-- completion = cmp.config.window.bordered(),
						-- documentation = cmp.config.window.bordered(),
					},
					mapping = cmp.mapping.preset.insert({
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<S-Tab>"] = cmp.mapping.select_prev_item(),
						["<Tab>"] = cmp.mapping.select_next_item(),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.abort(),
						["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "vsnip" }, -- For vsnip users.
						-- { name = 'luasnip' }, -- For luasnip users.
						-- { name = 'ultisnips' }, -- For ultisnips users.
						-- { name = 'snippy' }, -- For snippy users.
					}, {
						{ name = "buffer" },
					}),
				}
			end,
		},

		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
		},

		-- QUALITY OF LIFE --

		{ "aznhe21/actions-preview.nvim", opts = {} },

		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {
				preset = "modern",
			},
			keys = {
				{
					"<leader>?",
					function()
						require("which-key").show({ global = false })
					end,
					desc = "Buffer Local Keymaps (which-key)",
				},
			},
		},

		{ "f-person/git-blame.nvim", opts = { enabled = false }, cmd = { "GitBlameToggle" } },

		{ "lewis6991/gitsigns.nvim", opts = {} },

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
			"numToStr/Comment.nvim",
			event = { "BufReadPost", "BufWritePost", "BufNewFile" },
			opts = {},
		},

		{
			"folke/todo-comments.nvim",
			event = { "BufReadPost", "BufWritePost", "BufNewFile" },
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {},
		},

		{
			"nvim-lualine/lualine.nvim",
			event = "VeryLazy",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {
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

		{ "j-hui/fidget.nvim", opts = {}, event = { "BufReadPost", "BufWritePost", "BufNewFile" } },

		{ "m-demare/hlargs.nvim", opts = {}, event = { "BufReadPost", "BufWritePost", "BufNewFile" } },

		{ "RRethy/vim-illuminate", event = { "BufReadPost", "BufWritePost", "BufNewFile" } },

		{ "preservim/tagbar", cmd = "TagbarToggle" },

		{ "danilamihailov/beacon.nvim", event = { "VeryLazy" } },

		{
			"akinsho/bufferline.nvim",
			version = "*",
			event = { "BufReadPost", "BufWritePost", "BufNewFile" },
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
			"akinsho/toggleterm.nvim",
			version = "*",
			cmd = "ToggleTerm",
			opts = {},
		},

		{
			"folke/flash.nvim",
			event = "VeryLazy",
			opts = {
				modes = { search = { enabled = false } } --[[ things you want to change go here]],
			},
			-- stylua: ignore
			keys = {
					{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
					{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
					{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
					{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
					{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
			},
		},

		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		},

		-- {
		-- 	"tomiis4/Hypersonic.nvim",
		-- 	event = "CmdlineEnter",
		-- 	cmd = "Hypersonic",
		-- 	config = function()
		-- 		require("hypersonic").setup({
		-- 			-- config
		-- 		})
		-- 	end,
		-- },

		{
			"smjonas/inc-rename.nvim",
			event = { "BufReadPost", "BufWritePost", "BufNewFile" },
			config = function()
				require("inc_rename").setup()
			end,
		},

		-- {
		-- 	"code-biscuits/nvim-biscuits",
		-- 	opts = { cursor_line_only = true, show_on_start = true },
		-- },

		{ "jbyuki/nabla.nvim" },

		{
			"linux-cultist/venv-selector.nvim",
			dependencies = {
				"neovim/nvim-lspconfig",
				{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
			},
			-- lazy = false,
			branch = "regexp", -- This is the regexp branch, use this for the new version
			config = function()
				require("venv-selector").setup()
			end,
			cmd = "VenvSelect",
		},

		{
			"NeogitOrg/neogit",
			dependencies = {
				"nvim-lua/plenary.nvim", -- required
				"sindrets/diffview.nvim", -- optional - Diff integration

				-- Only one of these is needed, not both.
				"nvim-telescope/telescope.nvim", -- optional
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
					["core.integrations.telescope"] = {},
				},
			},
			dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
		},

		{ "tpope/vim-surround", event = { "BufReadPost", "BufWritePost", "BufNewFile" } },

		{ "tpope/vim-fugitive" },

		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-symbols.nvim",
				"adoyle-h/lsp-toggle.nvim",
				"cljoly/telescope-repo.nvim",
				{ "polirritmico/telescope-lazy-plugins.nvim" },
				"keyvchan/telescope-find-pickers.nvim",
				"crispgm/telescope-heading.nvim",
			},
		},
		{
			"folke/trouble.nvim",
			opts = {}, -- for default options, refer to the configuration section for custom setup.
			cmd = "Trouble",
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
			"neovim/nvim-lspconfig",
			event = "VeryLazy",
			opts = {
				setup = {
					rust_analyzer = function()
						return true
					end,
				},
			},
			config = function()
				require("lspconfig").bashls.setup({})
				require("lspconfig").taplo.setup({})
				require("lspconfig").hyprls.setup({})
				require("lspconfig").pylsp.setup({})
				require("lspconfig").lua_ls.setup({
					on_init = function(client)
						local path = client.workspace_folders[1].name
						if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
							return
						end

						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								-- Tell the language server which version of Lua you're using
								-- (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
									-- Depending on the usage, you might want to add additional paths here.
									-- "${3rd}/luv/library"
									-- "${3rd}/busted/library",
								},
								-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
								-- library = vim.api.nvim_get_runtime_file("", true)
							},
						})
					end,
					settings = {
						Lua = {},
					},
				})
			end,
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
			lazy = true, -- load treesitter early when opening a file from the cmdline
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
						init_selection = "<C-a>",
						node_incremental = "<C-a>",
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
