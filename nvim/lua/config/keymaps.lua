vim.cmd("imap jj <ESC>")
vim.g.autoformat = true
vim.g.lazyvim_picker = "auto"
vim.g.lazyvim_cmp = "auto"
vim.g.ai_cmp = true
vim.g.deprecation_warnings = false

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
local map = vim.keymap.set

map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>G", "<cmd>Gen<cr>", { desc = "Gen AI" })
map("n", "<leader>W", "<cmd>qa<cr>", { desc = "Quit All" })
-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
