return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "python", "latex", "bash", "markdown" },
      modules = {},
      sync_install = true,
      ignore_install = {},
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
    -- Latex highlight setup
    vim.cmd([[hi @markup.math guifg=#5D8887 gui=italic]])
    vim.cmd([[hi @function.latex guifg=#5D8887 gui=italic]])
    -- vim.cmd([[hi @spell.latex guifg=#9CA2BC ]])
    vim.cmd([[hi @punctuation.bracket.latex guifg=orange ]])
  end,
}
