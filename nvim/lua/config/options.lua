-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

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
-- vim.go.lazyredraw = true
vim.g.markdown_recommended_style = 0

-- Specific python environment
vim.g.python3_host_prog = "~/.pyenv/versions/3.13.0/envs/.zed_env/bin/python"

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
