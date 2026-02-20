return {
  {
    "benlubas/molten-nvim",
    lazy = false,
    version = "^2.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "snacks.nvim"
      vim.g.molten_output_win_max_height = 20
    end,
    keys = {
      { "<leader>R", ":MoltenEvaluateLine<CR>", mode = "n", desc = "Evaluate Line" },
      { "<leader>E", ":MoltenEvaluateOperator<CR>", mode = "n", desc = "Evaluate Operator" },
      { "<leader>ow", ":noautocmd MoltenEnterOutput<CR>", mode = "n", desc = "Open output window" },
    },
  },
}
