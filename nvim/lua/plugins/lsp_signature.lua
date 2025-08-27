return {
  "ray-x/lsp_signature.nvim",
  -- enabled = false,
  event = "InsertEnter",
  opts = {
    bind = true,
    floating_window = true,
    hint_prefix = "󰛨 ",
    handler_opts = {
      border = "rounded",
    },
  },
  keymaps = {
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.signature_help()
    end, { silent = true, noremap = true, desc = "toggle signature" }),
  },
  -- or use config
  -- config = function(_, opts) require'lsp_signature'.setup({you options}) end
}
