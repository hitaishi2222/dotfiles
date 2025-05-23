return {
  "OXY2DEV/markview.nvim",
  enabled = false,
  lazy = false,
  config = function()
    require("markview").setup({
      typst = {
        enable = false,
      },
    })
  end,
}
