return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	-- opts = function(_, opts)
	-- 	local function on_move(data)
	-- 		Snacks.rename.on_rename_file(data.source, data.destination)
	-- 	end
	-- 	local events = require("neo-tree.events")
	-- 	opts.event_handlers = opts.event_handlers or {}
	-- 	vim.list_extend(opts.event_handlers, {
	-- 		{ event = events.FILE_MOVED, handler = on_move },
	-- 		{ event = events.FILE_RENAMED, handler = on_move },
	-- 	})
	-- end,
}
