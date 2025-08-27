local opt = vim.opt
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.cursorline = true -- Enable highlighting of the current line
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.ruler = true -- Disable the default ruler
opt.shiftwidth = 4 -- Size of an indent
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.wrap = true -- Disable line wrap
opt.list = true
opt.listchars = { tab = "» ", trail = "·" }
opt.confirm = true
-- vim.go.lazyredraw = true
-- opt.scrolloff = 15 -- Number of lines to keep before scrolling
vim.g.markdown_recommended_style = 0

-- --folding code by treesitter
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = true
vim.opt.foldlevel = 99

-- Specific python environment
vim.g.python3_host_prog = "~/.pyenv/versions/3.13.5/bin/python3"

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Move line up
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
-- Move line down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move selected lines up
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tex",
  callback = function()
    vim.bo.filetype = "tex" -- Or use "latex"
  end,
})
