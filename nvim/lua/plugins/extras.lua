return {
  { "folke/todo-comments.nvim", event = "VeryLazy", opts = {} },
  { "j-hui/fidget.nvim", opts = {} },
  { "github/copilot.vim", enabled = false },
  { "arnamak/stay-centered.nvim" },
  {
    "vimpostor/vim-tpipeline",
    config = function()
      vim.g.tpipeline_autoembed = 1
      vim.g.tpipeline_restore = 1
      vim.g.tpipeline_clearstl = 1
    end,
  },
}
