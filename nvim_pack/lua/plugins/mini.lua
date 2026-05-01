vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim", version = "main" },
})

require("mini.deps").setup({})
require("mini.ai").setup({})
require("mini.icons").setup({})
require("mini.comment").setup({})
require("mini.snippets").setup({})
require("mini.cmdline").setup({})
require("mini.starter").setup({})
require("mini.surround").setup({})
require("mini.bracketed").setup({})
require("mini.git").setup({})
require("mini.pick").setup({})
require("mini.sessions").setup({})
require("mini.tabline").setup({})
require("mini.indentscope").setup({})
require("mini.cursorword").setup({})
require("mini.fuzzy").setup({})
require("mini.notify").setup({})
require("mini.basics").setup({ mappings = { windows = true } })
require("mini.pairs").setup({
  mappings = {
    ["$"] = { action = "open", pair = "$$", neigh_pattern = "[^\\]." },
  },
})
require("mini.statusline").setup({
  use_icons = true,
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
      local filename = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local location = MiniStatusline.section_location({ trunc_width = 200 })
      local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineDevinfo" },
        "%<", -- Mark general truncate point
        "%=", -- End left alignment
        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
      })
    end,
  },
})

-- -- Later
-- require("mini.completion").setup({
--   delay = { completion = 10, info = 100, signature = 50 },
--   lsp_completion = {
--     source_func = "omnifunc",
--   },
-- })
-- vim.lsp.config("*", { capabilities = MiniCompletion.get_lsp_capabilities() })
--
-- local imap_expr = function(lhs, rhs)
--   vim.keymap.set("i", lhs, rhs, { expr = true })
-- end
-- imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
-- imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
