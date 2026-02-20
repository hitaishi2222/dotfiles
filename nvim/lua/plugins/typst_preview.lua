return {
  "chomosuke/typst-preview.nvim",
  lazy = false, -- or ft = 'typst'
  version = "1.*",
  opts = {
    debug = true,
    open_cmd = "qutebrowser --target tab %s > /dev/null 2>&1",
    invert_colors = "always",
  },
}
