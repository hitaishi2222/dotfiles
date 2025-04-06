return {
  { "folke/todo-comments.nvim", event = "VeryLazy", opts = {} },
  { "j-hui/fidget.nvim", opts = {} },
  { "jbyuki/nabla.nvim" },
  { "github/copilot.vim", enabled = false },
  { "sphamba/smear-cursor.nvim", opts = {} },
  { "arnamak/stay-centered.nvim" },
  { "leseixas/quantum_espresso-vim", lazy = false },
  {
    "vimpostor/vim-tpipeline",
    config = function()
      vim.g.tpipeline_autoembed = 1
      vim.g.tpipeline_restore = 1
      vim.g.tpipeline_clearstl = 1
    end,
  },
}
