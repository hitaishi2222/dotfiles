return {
  "echasnovski/mini.nvim",
  version = false,
  enable = true,
  config = function()
    require("mini.ai").setup()
    require("mini.pairs").setup()
    require("mini.comment").setup()
    require("mini.surround").setup()
    require("mini.bracketed").setup()
    -- require("mini.completion").setup()

    require("mini.icons").setup()
    require("mini.git").setup()
    require("mini.diff").setup()
    -- require("mini.notify").setup()
    -- require("mini.starter").setup()
    require("mini.tabline").setup({})
    require("mini.animate").setup()
    require("mini.indentscope").setup()
    require("mini.basics").setup({ mappings = { windows = true } })
    require("mini.files").setup({ windows = { preview = true, width_focus = 25, width_preview = 75 } })
    require("mini.statusline").setup({
      use_icons = true,
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
          local git = MiniStatusline.section_git({ trunc_width = 40 })
          local diff = MiniStatusline.section_diff({ trunc_width = 75 })
          local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
          local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
          local filename = MiniStatusline.section_filename({ trunc_width = 140 })
          local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
          local location = MiniStatusline.section_location({ trunc_width = 200 })
          local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

          return MiniStatusline.combine_groups({
            { hl = mode_hl, strings = { mode } },
            { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
            "%<", -- Mark general truncate point
            -- { hl = "MiniStatuslineFilename", strings = { filename } },
            "%=", -- End left alignment
            { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
            { hl = mode_hl, strings = { search, location } },
          })
        end,
      },
    })
  end,
  keys = {
    {
      "<leader>z",
      function()
        MiniFiles.open()
      end,
      desc = "Smart Find Files",
    },
  },
}
