local notes_dir = "/home/elena/Documents/Notes"

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = notes_dir .. "/*",
	callback = function()
		local git_commands = {
			"git add .",
			"git commit -m 'Auto-commit: changes in notes'",
			"git push",
		}

		for _, cmd in ipairs(git_commands) do
			-- Use vim.loop.spawn for asynchronous execution
			vim.loop.spawn("sh", {
				args = { "-c", string.format("cd %s && %s", notes_dir, cmd) },
			}, function(code, signal)
				if code ~= 0 then
					vim.notify(
						string.format("Git command '%s' failed with code %d and signal %d", cmd, code, signal),
						vim.log.levels.ERROR
					)
				end
			end)
		end
	end,
	desc = "Auto-commit and push changes in notes directory",
})
