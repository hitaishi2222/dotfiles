vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_format = "fallback",
  },

  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    tex = { "tex-fmt" },
    markdown = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    yml = { "prettier" },
    rust = { "rustfmt" },
    typst = { "typstyle" },
  },
  notify_no_formatters = true,
  formatters = {
    ["tex-fmt"] = {
      command = "tex-fmt",
      args = { "-n", "--stdin" },
    },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.keymap.set("n", "<leader>F", function()
  require("conform").format({ async = true })
end, { desc = "Format buffer" })
