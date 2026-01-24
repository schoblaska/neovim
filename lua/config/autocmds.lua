-- Resize splits when window resizes
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = [[exe "normal \<C-w>="]]
})

-- Only show cursorline in active window
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  pattern = "*",
  command = "setlocal cursorline"
})

vim.api.nvim_create_autocmd("WinLeave", {
  pattern = "*",
  command = "setlocal nocursorline"
})
