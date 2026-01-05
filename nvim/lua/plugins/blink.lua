return {
  "saghen/blink.cmp",
  -- enabled = false,
  dependencies = { "rafamadriz/friendly-snippets", "echasnovski/mini.snippets" },

  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    -- this is good but "ray-x/lsp_signature.nvim" is better
    -- signature = { enabled = true },
  },
}
