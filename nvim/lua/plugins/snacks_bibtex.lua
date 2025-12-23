return {
  "krissen/snacks-bibtex.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    context = { enabled = true },
  },
  keys = {
    {
      "<leader>bc",
      function()
        require("snacks-bibtex").bibtex()
      end,
      desc = "BibTeX citations (Snacks)",
    },
  },
}
