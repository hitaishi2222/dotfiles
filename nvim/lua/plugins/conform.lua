return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        tex = { "tex-fmt" },
        markdown = { "prettierd" },
        rust = { "rustfmt" },
        -- typst = { "typstfmt" },
      },
      notify_no_formatters = true,
      formatters = {
        ["tex-fmt"] = {
          command = "tex-fmt",
          args = { "-n", "--stdin" },
        },
        black = {
          prepend_args = { "--skip-magic-trailing-comma" }, -- "--line-length", "100",
        },
      },
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>F",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
}
