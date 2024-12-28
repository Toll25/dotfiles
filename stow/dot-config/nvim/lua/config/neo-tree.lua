local function on_move(data)
	Snacks.rename.on_rename_file(data.source, data.destination)
end
local events = require("neo-tree.events")

require("neo-tree").setup({
	event_handlers = {

		{ event = events.FILE_MOVED, handler = on_move },
		{ event = events.FILE_RENAMED, handler = on_move },
	},
	commands = {
		system_open = function(state)
			local node = state.tree:get_node()
			local path = node:get_id()
			vim.fn.jobstart({ "xdg-open", path }, { detach = true })
		end,
	},
	use_libuv_file_watcher = true,
	close_if_last_window = false,
	window = {
		mappings = {
			["."] = function(state)
				local current_node = state.tree:get_node()
				local path = current_node:get_id()
				require("neo-tree.sources.filesystem.commands").set_root(state)
				vim.cmd("cd " .. path)
			end,
			[","] = function(state)
				require("neo-tree.sources.filesystem.commands").set_root(state)
				vim.cmd("cd ..")
			end,
		},
	},
	default_component_configs = {
		git_status = {
			symbols = {
				-- Change type
				added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "󰁕", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
	},
	filesystem = {
		window = {
			mappings = {
				["o"] = "system_open",
			},
		},
		filtered_items = {
			visible = true,
		},
		hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
		-- in whatever position is specified in window.position
		-- "open_current",  -- netrw disabled, opening a directory opens within the
		-- window like netrw would, regardless of window.position
		-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
		follow_current_file = {
			enabled = true, -- This will find and focus the file in the active buffer every time
			leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
		},
	},
})
