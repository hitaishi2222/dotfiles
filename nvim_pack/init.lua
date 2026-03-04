vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.keymaps")
require("core.autocommands")

require("plugins")

vim.cmd("colorscheme kanso-ink")
