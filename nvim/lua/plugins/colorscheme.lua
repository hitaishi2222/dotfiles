return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd("hi EndOfBuffer guibg=bg guifg=bg")
    end,
  },
  {
    "rose-pine/neovim",
    event = "VeryLazy",
    config = function()
      -- vim.cmd("colorscheme rose-pine-main")
      vim.cmd("hi EndOfBuffer guibg=bg guifg=bg")
    end,
  },
  {
    "folke/tokyonight.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "vague2k/vague.nvim",
    event = "VeryLazy",
  },
  {
    "webhooked/kanso.nvim",
    event = "VeryLazy",
  },
}
