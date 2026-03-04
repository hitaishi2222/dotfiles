vim.pack.add({
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
})

require("typst-preview").setup({
  debug = true,
  open_cmd = "qutebrowser --target tab %s > /dev/null 2>&1",
  invert_colors = "always",
})
