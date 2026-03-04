local map = vim.keymap.set

-- easy-escape
vim.cmd("imap jj <ESC>")
vim.cmd("imap jk <ESC>")
vim.cmd("imap kj <ESC>")
vim.cmd("imap kk <ESC>")

-- Move betwene panes and splits with Ctrl + vim keys
vim.cmd("map <C-h> <C-w>h")
vim.cmd("map <C-j> <C-w>j")
vim.cmd("map <C-k> <C-w>k")
vim.cmd("map <C-l> <C-w>l")

-- Move line up
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
-- Move line down
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move selected lines up
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Escape to remove selection/search
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Quit nvim
map("n", "<leader>W", "<cmd>qa<cr>", { desc = "Quit All" })

map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code-Action" })
map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "LSP Signature help" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- -- Typst keymapping
-- map(
--   "n",
--   "<leader>tt",
--   "<cmd>TypstPreviewToggle<cr>",
--   { silent = true, noremap = true, desc = "[T]ypstPreview [T]oggle" }
-- )

-- python run
map("n", "<leader>p", function()
  vim.cmd("w")
  vim.cmd("!python %")
end, { desc = "Run python script" })
