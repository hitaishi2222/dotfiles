vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "master",
  },
})

require("nvim-treesitter").setup({
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "python",
    "latex",
    "bash",
    "markdown",
    "rust",
    "typst",
  },
  sync_install = true,
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})

-- Latex highlight tweaks
vim.cmd([[hi @markup.math guifg=#5D8887 gui=italic]])
vim.cmd([[hi @function.latex guifg=#5D8887 gui=italic]])
vim.cmd([[hi @punctuation.bracket.latex guifg=orange]])
