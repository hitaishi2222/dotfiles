vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = "main" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})

require("blink.cmp").setup({
  fuzzy = {
    prebuilt_binaries = {
      force_version = "v1.9.1", -- replace with actual release version
    },
  },
})
