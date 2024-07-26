local function copy_path(state)
	-- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
	-- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
	local node = state.tree:get_node()
	local filepath = node:get_id()
	local filename = node.name
	local modify = vim.fn.fnamemodify

	local paths = {
		filepath,
		modify(filepath, ":."),
		modify(filepath, ":~"),
		filename,
		modify(filename, ":r"),
		modify(filename, ":e"),
	}

	local results = {
		"1. Absolute path: " .. paths[1],
		"2. Path relative to CWD: " .. paths[2],
		"3. Path relative to HOME: " .. paths[3],
		"4. Filename: " .. paths[4],
		"5. Filename without extension: " .. paths[5],
		"6. Extension of the filename: " .. paths[6],
	}

	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values

	pickers
		.new({}, {
			prompt_title = "Choose to copy to clipboard:",
			finder = finders.new_table({
				results = results,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()[1]
					local i = tonumber(selection:sub(1, 1))
					if i then
						local result = paths[i]
						vim.fn.setreg('"', result)
						vim.notify("Copied: " .. result)
					else
						vim.notify("Invalid selection")
					end
				end)
				return true
			end,
		})
		:find()
end

require("neo-tree").setup({
	use_libuv_file_watcher = true,
	close_if_last_window = false,
	window = {
		mappings = {
			["."] = function(state)
				local current_node = state.tree:get_node() -- this is the current node
				local path = current_node:get_id() -- this gives you the path

				require("neo-tree.sources.filesystem.commands").set_root(state) -- call the default set_root

				-- do whatever you want to do here
				vim.cmd("cd " .. path)
			end,
			["Y"] = copy_path,
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
		filtered_items = {
			visible = true,
		},
		hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
		-- in whatever position is specified in window.position
		-- "open_current",  -- netrw disabled, opening a directory opens within the
		-- window like netrw would, regardless of window.position
		-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
	},
})
