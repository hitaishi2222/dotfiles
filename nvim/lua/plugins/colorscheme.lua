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
    opts = {},
  },
  { "vague2k/vague.nvim" },
  { "webhooked/kanso.nvim" },
  { "kuri-sun/yoda.nvim" },
  { "marko-cerovac/material.nvim", event = "VeryLazy" },
  { "mhartington/oceanic-next" },
  { "titanzero/zephyrium" },
}
