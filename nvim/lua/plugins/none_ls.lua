return {
  "nvimtools/none-ls.nvim",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- 🔹 Diagnostics
        null_ls.builtins.diagnostics.mypy,

        -- 🔹 Formatters

        -- 🔹 Linters

        -- 🔹 Code Actions
        null_ls.builtins.code_actions.refactoring, -- Refactoring tools
      },
    })
  end,
}
