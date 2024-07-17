local fmt_group = vim.api.nvim_create_augroup("fmt", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	group = fmt_group,
	pattern = "*",
	command = "undojoin | Neoformat",
})
