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

-- local header = [[
--    ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆
--     ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦
--           ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄
--            ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄
--           ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀
--    ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄
--   ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄
--  ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄
--  ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄
--       ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆
--        ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃
--      ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶
--      ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧
--      ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆
-- ]]

local header = {
	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

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
						header = header,
						shortcut = {},
					},
				})
			end,
			dependencies = { { "nvim-tree/nvim-web-devicons" } },
		},

		{
			"folke/noice.nvim",
			event = { "VeryLazy" },
			opts = {},
			dependencies = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				"rcarriga/nvim-notify",
			},
			config = function()
				require("lualine").setup({
					sections = {
						lualine_x = {
							{
								require("noice").api.status.command.get,
								cond = require("noice").api.status.command.has,
							},
							"encoding",
							"fileformat",
							"filetype",
						},
					},
				})
				require("noice").setup({
					lsp = {
						progress = {
							enabled = false,
						},
						override = {
							["vim.lsp.util.convert_input_to_markdown_lines"] = true,
							["vim.lsp.util.stylize_markdown"] = true,
							["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
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
				})
			end,
		},

		-- {
		-- 	"TobinPalmer/Tip.nvim",
		-- 	event = "VimEnter",
		-- 	init = function()
		-- 		require("tip").setup({
		-- 			seconds = 2,
		-- 			title = "Tip!",
		-- 			url = "https://vtip.43z.one", -- Or https://vimiscool.tech/neotip
		-- 		})
		-- 	end,
		-- },

		{
			"NvChad/nvim-colorizer.lua",
			opts = {
				filetypes = { "*" },
				user_default_options = {
					RGB = true,
					RRGGBB = true,
					names = true,
					RRGGBBAA = true,
					AARRGGBB = false,
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
		},

		{
			"stevearc/conform.nvim",
			event = { "BufWritePre" },
			cmd = { "ConformInfo" },
			opts = {
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "autopep8" },
					rust = { "rustfmt", "yew-fmt", lsp_format = "fallback" },
				},
				format_on_save = {
					timeout_ms = 5000,
					lsp_format = "fallback",
				},
			},
		},

		-- AUTO COMPLETION --

		{
			"hrsh7th/nvim-cmp",
			version = false, -- last release is way too old
			event = "InsertEnter",
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "hrsh7th/cmp-nvim-lsp-signature-help" },
				{ "hrsh7th/cmp-vsnip" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/vim-vsnip" },
			},
			opts = function()
				-- vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
				local cmp = require("cmp")
				local defaults = require("cmp.config.default")()
				local auto_select = true
				return {
					auto_brackets = {}, -- configure any filetype to auto add brackets
					completion = {
						completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
					},
					preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
					mapping = cmp.mapping.preset.insert({

						["<S-Tab>"] = cmp.mapping.select_prev_item(),
						["<Tab>"] = cmp.mapping.select_next_item(),
						["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.close(),
						["<CR>"] = cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
					}),
					sources = cmp.config.sources({
						{ name = "path" }, -- file paths
						{ name = "nvim_lsp", keyword_length = 3 }, -- from language server
						{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
						{ name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
						{ name = "buffer", keyword_length = 2 }, -- source current buffer
						{ name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
						{ name = "calc" }, -- source for math calculation
						{ name = "neorg" },
					}),
					formatting = {
						format = function(entry, item)
							-- local icons = LazyVim.config.icons.kinds
							-- if icons[item.kind] then
							-- 	item.kind = icons[item.kind] .. item.kind
							-- end

							local widths = {
								abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
								menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
							}

							for key, width in pairs(widths) do
								if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
									item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
								end
							end

							return item
						end,
					},
					experimental = {
						ghost_text = {
							-- hl_group = "CmpGhostText",
						},
					},
					sorting = defaults.sorting,
				}
			end,
		},

		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
		},

		-- QUALITY OF LIFE --

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
			{
				"folke/todo-comments.nvim",
				event = { "BufEnter", "BufWinEnter" },
				dependencies = { "nvim-lua/plenary.nvim" },
				opts = {},
			},
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
				extensions = { "neo-tree", "trouble" },
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
			event = { "BufEnter", "BufWinEnter" },
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
			"smjonas/inc-rename.nvim",
			event = { "BufReadPost", "BufWritePost", "BufNewFile" },
			config = function()
				require("inc_rename").setup()
			end,
		},

		{
			"code-biscuits/nvim-biscuits",
			opts = { cursor_line_only = true },
			keys = {
				{
					"<leader>bb",
					function()
						local nvim_biscuits = require("nvim-biscuits")
						nvim_biscuits.BufferAttach()
						nvim_biscuits.toggle_biscuits()
					end,
					mode = "n",
					desc = "Enable Biscuits",
				},
			},
		},

		{ "jbyuki/nabla.nvim", keys = {
			{ "<leader>la", ":lua require('nabla').popup()<CR>" },
		} },

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

		{ "tpope/vim-surround", event = { "BufReadPost", "BufWritePost", "BufNewFile" } },

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
