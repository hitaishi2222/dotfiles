vim.pack.add({
  { src = "https://github.com/ray-x/lsp_signature.nvim" },
})

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    require("lsp_signature").setup({
      bind = true,
      floating_window = true,
      hint_prefix = "󰛨 ",
      handler_opts = {
        border = "rounded",
      },
    })
  end,
})

vim.keymap.set("n", "K", function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "Toggle signature" })
