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
map("n", "<leader>S", "<cmd>w<cr>", { desc = "Save file" })

-- Vertical Split
map("n", "<leader>V", "<cmd>vsplit<cr>", { desc = "Save file" })

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

-- relaton isbn import
vim.keymap.set("n", "<leader>I", function()
  -- Prompt for ISBN
  local isbn = vim.fn.input("Enter ISBN: ")
  if isbn == "" then
    print("No ISBN entered.")
    return
  end

  -- Run relaton command and capture stdout
  local output = vim.fn.system("relaton fetch isbn:" .. isbn .. " -f yaml")
  local lines = vim.split(output, "\n")

  -- Insert lines at current cursor row
  local row = vim.api.nvim_win_get_cursor(0)[1] -- get current line (1-indexed)
  vim.api.nvim_buf_set_lines(0, row, row, false, lines)

  print("Inserted Relaton metadata for ISBN " .. isbn)
end, { noremap = true, silent = true })
