vim.cmd("imap jj <ESC>")
vim.cmd("imap jk <ESC>")
vim.cmd("imap kj <ESC>")

vim.cmd("map <C-h> <C-w>h")
vim.cmd("map <C-j> <C-w>j")
vim.cmd("map <C-k> <C-w>k")
vim.cmd("map <C-l> <C-w>l")

vim.g.autoformat = true
-- vim.g.lazyvim_picker = "auto"
-- vim.g.lazyvim_cmp = "auto"
-- vim.g.ai_cmp = true
vim.g.deprecation_warnings = true

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
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code-Action" })

map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "LSP Signature help" })
map("n", "<leader>cc", "<cmd>ColorizerToggle<cr>", { desc = "Coloriszer Toggle" })


-- Typst keymapping
map(
  "n",
  "<leader>tt",
  "<cmd>TypstPreviewToggle<cr>",
  { silent = true, noremap = true, desc = "[T]ypstPreview [T]oggle" }
)

-- python run
map("n", "<leader>p", function()
  vim.cmd("w")
  vim.cmd("!python %")
end, { desc = "Run python script" })
