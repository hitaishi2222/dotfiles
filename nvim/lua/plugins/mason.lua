return {
  "williamboman/mason.nvim",
  enabled = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
  end,
}
