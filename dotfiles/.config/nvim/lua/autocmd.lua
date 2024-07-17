-- Create an augroup named 'fmt'
local fmt_group = vim.api.nvim_create_augroup("fmt", { clear = true })

-- Create an autocmd within the 'fmt' group
vim.api.nvim_create_autocmd("BufWritePre", {
  group = fmt_group,
  pattern = "*",
  command = "undojoin | Neoformat"
})

