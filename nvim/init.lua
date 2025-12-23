vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.options")
require("config.keymaps")

vim.cmd("colorscheme neopywal")
-- vim.cmd("colorscheme rose-pine-main")

-- vim.cmd([[
--   hi Normal guibg=NONE ctermbg=NONE
--   hi NormalNC guibg=NONE ctermbg=NONE
--   hi NormalFloat guibg=NONE ctermbg=NONE
--   hi Pmenu guibg=NONE ctermbg=NONE
-- ]])
