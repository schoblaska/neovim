local map = vim.keymap.set

-- System clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>Y", '"+y$', { desc = "Yank line to clipboard" })
map("n", "<leader>fc", [[:let @+ = expand('%:.')<CR>:echo "copied file path"<CR>]], { silent = true, desc = "Copy file path" })

-- Tabs
map("n", "<leader>1", "1gt", { desc = "Tab 1" })
map("n", "<leader>2", "2gt", { desc = "Tab 2" })
map("n", "<leader>3", "3gt", { desc = "Tab 3" })
map("n", "<leader>4", "4gt", { desc = "Tab 4" })
map("n", "<leader>5", "5gt", { desc = "Tab 5" })
map("n", "<leader>6", "6gt", { desc = "Tab 6" })
map("n", "<leader>7", "7gt", { desc = "Tab 7" })
map("n", "<leader>8", "8gt", { desc = "Tab 8" })
map("n", "<leader>9", "9gt", { desc = "Tab 9" })
map("n", "<leader>0", ":tabnew<CR>:setlocal nobuflisted<CR>", { silent = true, desc = "New tab" })

-- Tab to switch windows
map("n", "<Tab>", "<C-W>w", { desc = "Next window" })

-- Arrow keys move between splits
map("n", "<Up>", "<C-W>k", { silent = true, desc = "Window up" })
map("n", "<Down>", "<C-W>j", { silent = true, desc = "Window down" })
map("n", "<Left>", "<C-W>h", { silent = true, desc = "Window left" })
map("n", "<Right>", "<C-W>l", { silent = true, desc = "Window right" })

-- Select all file
map("v", "af", ":<C-U>silent! normal! ggVG<CR>", { noremap = true, desc = "Select all" })
map("o", "af", ":normal Vaf<CR>", { desc = "Select all" })

-- Navigate wrapped lines visually, except with counts
map({ "n", "v" }, "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true })
map({ "n", "v" }, "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true })
