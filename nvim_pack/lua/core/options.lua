local glo = vim.g
local opt = vim.opt

-- Options
opt.number = true
opt.relativenumber = true
opt.shell = "/bin/bash"
opt.confirm = true
opt.shiftwidth = 4
opt.cursorline = true
opt.signcolumn = "yes"
opt.mouse = "a"
opt.showmode = false
opt.breakindent = true
opt.undofile = true
opt.termguicolors = true
opt.spelllang = { "en" }
opt.autoindent = true
opt.expandtab = true
opt.splitright = true
opt.splitbelow = true
opt.wrap = true
opt.list = true
opt.listchars = { tab = "» ", trail = "·" }
opt.winborder = "rounded"
opt.swapfile = false
opt.autoread = true
opt.fillchars = { eob = " " }
opt.clipboard:append("unnamedplus")
opt.encoding = "utf-8"

-- Globals
glo.have_nerd_font = true
glo.python3_host_prog = "~/.pyenv/versions/3.13.12/bin/python3"
glo.autoformat = true
glo.deprecation_warnings = true
