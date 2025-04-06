return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
      vim.cmd("hi EndOfBuffer guibg=bg guifg=bg")
    end,
  },
  {
    "rose-pine/neovim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      vim.cmd("colorscheme rose-pine")
      -- to remove '~'
      vim.cmd("hi EndOfBuffer guibg=bg guifg=bg")
    end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    event = "VeryLazy",
    -- priority = 1000,
    opts = {},
  },
}
